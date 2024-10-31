local M = {}

local jobid = nil
local winid = nil
local repls = {
	python = "python",
	lua = "lua",
	haskell = "stack ghci",
}

M.launch_term = function(cmd, opts)
	opts = opts or {}

	if opts.direction == "vertical" then
		print(opts.direction)
		vim.cmd("vnew")
	else
		vim.cmd("belowright new")
	end

	winid = vim.fn.win_getid()
	vim.api.nvim_win_set_var(0, "REPL", 1)
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.buflisted = false
	vim.bo.swapfile = false
	opts = vim.tbl_extend("error", opts, {
		on_exit = function()
			jobid = nil
		end,
	})
	jobid = vim.fn.termopen(cmd, opts)
end

M.close_term = function()
	if not jobid then
		return
	end
	vim.fn.jobstop(jobid)
	if winid and vim.api.nvim_win_is_valid(winid) then
		vim.api.nvim_win_close(winid, true)
	end
	winid = nil
end

M.repl = function()
	local win = vim.api.nvim_get_current_win()
	M.toggle(repls[vim.bo.filetype])
	vim.api.nvim_set_current_win(win)
end

M.toggle = function(cmd)
	if jobid then
		M.close_term()
	else
		cmd = cmd or (vim.fn.environ()["SHELL"] or "sh")
		M.launch_term(cmd)
	end
end

M.toggle_vertical = function(cmd)
	if jobid then
		M.close_term()
	else
		cmd = cmd or (vim.fn.environ()["SHELL"] or "sh")
		M.launch_term(cmd, { direction = "vertical" })
	end
end

M.sendline = function(line)
	if not jobid then
		return
	end
	vim.fn.chansend(jobid, line .. "\n")
end

M.sendvisual = function()
	if not jobid then
		M.toggle()
	end
	local mode = vim.api.nvim_get_mode()
	local pos1
	local pos2
	local type
	if vim.tbl_contains({ "v", "V", "" }, mode.mode) then
		pos1 = vim.fn.getpos("v")
		pos2 = vim.fn.getpos(".")
		type = mode.mode
	else
		pos1 = vim.fn.getpos("'<")
		pos2 = vim.fn.getpos("'>")
		type = vim.fn.visualmode()
		if type == "V" then
			pos2[3] = #vim.fn.getline(pos2[2])
		end
	end
	local lines = vim.fn.getregion(pos1, pos2, { type = type })
	local indent = math.huge
	for _, line in ipairs(lines) do
		indent = math.min(line:find("[^ ]") or math.huge, indent)
	end
	indent = indent == math.huge and 0 or indent
	for _, line in ipairs(lines) do
		vim.fn.chansend(jobid, line:sub(indent) .. "\n")
	end
end

return M
