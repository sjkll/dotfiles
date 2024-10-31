local M = {}

-- a function to obtain and format the current git branch

M.git_branch = function()
	local branch = vim.b.gitsigns_head

	if branch == nil then
		return " -- "
	end

	local added = vim.b.gitsigns_status_dict.added or 0
	local changed = vim.b.gitsigns_status_dict.changed or 0
	local removed = vim.b.gitsigns_status_dict.removed or 0

	return "%#statusline_branch# " -- branch ..
		.. "+"
		.. added
		.. "-"
		.. removed
		.. "~"
		.. changed
		.. " "
end

-- a function to obtain and format the file name

M.file_name = function()

	-- change highlight group based on if the file has been modified
	local highlight_group = vim.bo.modified and "statusline_modifiedfile"
		or "statusline_file"

	return "%#" .. highlight_group .. "# " .. "%f" .. " "
end

-- a function to obtain and format the current mode

M.current_mode = function()
	local mode = vim.fn.mode()

	local mode_aliases = {
		n = "n",
		i = "i",
		v = "v",
		V = "v",
		t = "t",
		c = "c",
		s = "s",
		[""] = "v",
	}

	mode = mode and mode_aliases[mode] and mode_aliases[mode]:upper() or "?"

	return "%#statusline_mode# " .. mode .. " "
end

-- a function to obtain and format the diagnostics

M.diagnostics = function()
	local status_line = "%#statusline_diagnostics#"

	local num_error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	if num_error ~= 0 then
		status_line = status_line .. " E" .. num_error
	end

	local num_warning = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	if num_warning ~= 0 then
		status_line = status_line .. " W" .. num_warning
	end

	local num_hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	if num_hint ~= 0 then
		status_line = status_line .. " H" .. num_hint
	end

	return status_line
end

M.contexts = function()
	if true then
		return ""
	end

	-- Define type patterns for Python, Lua, and Go
	local filetype = vim.bo.filetype
	local type_patterns = {}

	if filetype == "python" then
		type_patterns = { "class", "function", "method" }
	elseif filetype == "lua" then
		type_patterns = { "function_definition" }
	elseif filetype == "go" then
		type_patterns = { "method_declaration", "struct" }
	else
		return ""
	end

	local success, treesitter = pcall(require, "nvim-treesitter")
	if not success then
		return ""
	end

	local context = treesitter.statusline({
		type_patterns = type_patterns,

		transform_fn = function(line)
			if filetype == "python" then
				line = line:gsub("class%s*", "")
				line = line:gsub("def%s*", "")
			elseif filetype == "lua" then
				line = line:gsub("function_definition%s*", "")
			elseif filetype == "go" then
				line = line:gsub("method_declaration%s*", "")
				line = line:gsub("type%s*", "")
			end

			return line:gsub("%s*[%(%{%[].*[%]%}%)]*%s*$", "")
		end,

		separator = " -> ",

		allow_duplicates = false,
	})

	if context == nil then
		return ""
	end

	return "%#statusline_contexts# " .. context .. " "
end

-- a function to assign highlight group to the separator

M.separator = function()
	-- the highlight group changes based on current mode

	local highlight_group = "statusline_separator"
	-- local mode = vim.fn.mode()
	--
	-- if mode == 'i' then
	--   return '%#' .. highlight_group .. '_insert#%='
	-- end
	--
	-- if mode == 'v' or mode == 'V' or mode == '' then
	--   return '%#' .. highlight_group .. '_visual#%='
	-- end

	return "%#" .. highlight_group .. "#%="
end

M.setup = function(opts)
	-- a function to call and place the statusline components

	Status_line = function()
		return table.concat({

			M.file_name(),
			M.contexts(),

			M.separator(),

			M.diagnostics(),
			M.git_branch(),
			-- M.current_mode(),
		})
	end

	vim.cmd("set statusline=%!v:lua.Status_line()")

	-- set colors for each statusline components

	local group_styles = {}

	if opts.flavour == "grayscale" then
		group_styles = {

			["statusline_file"] = { fg = "#eeeeee", bg = "#444444", bold = true },
			["statusline_modifiedfile"] = { fg = "#000000", bg = "#cccccc", bold = true },
			["statusline_diagnostics"] = { fg = "#eeeeee", bg = "#222222" },
			["statusline_contexts"] = { fg = "#cccccc", bg = "None" },

			["statusline_separator"] = { fg = "#333333", bg = "None" },
			["statusline_separator_insert"] = { fg = "#444444", bg = "None" },
			["statusline_separator_visual"] = { fg = "#555555", bg = "None" },

			["statusline_branch"] = { fg = "#eeeeee", bg = "#222222" },
			["statusline_mode"] = { fg = "#eeeeee", bg = "#444444", bold = true },
		}
	end

	for group, style in pairs(group_styles) do
		vim.api.nvim_set_hl(0, group, style)
	end
end

return M