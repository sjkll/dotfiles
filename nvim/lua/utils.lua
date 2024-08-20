local M = {}

--- Creates a new mapping
---@param mode string|table: can be for example 'n', 'i', 'v' or { 'n', 'i', 'v' }
---@param lhs string: the left hand side
---@param rhs string|function: the right hand side
---@param opts table|nil: a table containing the mapping's options e.g. silent, remap
function M.map(mode, lhs, rhs, opts)
  local options = { silent = true, noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

--- Function to trim trailing whitespace.
function M.trim_trailing_white_space()
  local savedView = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(savedView)
end

local PATTERN =
  "\\v\\c%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)%([&:#*@~%_\\-=?!+;/0-9a-z]+%(%([.;/?]|[.][.]+)[&:#*@~%_\\-=?!+/0-9a-z]+|:\\d+|,%(%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)@![0-9a-z]+))*|\\([&:#*@~%_\\-=?!+;/.0-9a-z]*\\)|\\[[&:#*@~%_\\-=?!+;/.0-9a-z]*\\]|\\{%([&:#*@~%_\\-=?!+;/.0-9a-z]*|\\{[&:#*@~%_\\-=?!+;/.0-9a-z]*\\})\\})+"

M.FindLinks = function(lines)
  ---@type Link[]
  local ret = {}
  for lnum, line in ipairs(lines) do
    local link = ""
    local last = 0
    local first = 0
    while true do
      link, first, last = unpack(vim.fn.matchstrpos(line, PATTERN, last))
      link = vim.trim(link)
      if link == "" then
        break
      end
      table.insert(ret, { link = link, lnum = lnum, first = first, last = last })
    end
  end
  return ret
end

M.open_link_under_cursor = function()
  local line = vim.api.nvim_get_current_line()
  local links = M.FindLinks({ line })
  if #links > 0 then
    local col = vim.fn.col(".")
    for _, link in ipairs(links) do
      vim.fn.jobstart(string.format("open %s", link.link), {
        on_stderr = function(_, data)
          local msg = table.concat(data or {}, "\n")
          if msg ~= "" then
            print(msg)
          end
        end,
      })
    end
  end
end

M.GetFileType = function(path)
  local is_existing_buffer = false
  local buf

  if not path or path == "" then
    -- Используем текущий буфер
    return vim.bo.filetype, vim.fn.expand("%:.")
  else
    -- Проверим, существует ли файл или директория
    if vim.fn.filereadable(path) == 0 and vim.fn.isdirectory(path) == 0 then
      return "", ""
    end

    -- Нормализуем путь
    local absolute_path = vim.fn.resolve(vim.fn.fnamemodify(path, ":p"))

    -- Проверяем, существует ли уже такой буфер
    for _, b in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_name(b) == absolute_path then
        buf = b
        is_existing_buffer = true
        break
      end
    end

    -- Если буфер не найден, создаем новый
    if not is_existing_buffer then
      buf = vim.fn.bufadd(absolute_path)
      vim.fn.bufload(buf)
    end

    local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

    if filetype == "" or filetype == "netrw" then
      filetype = vim.bo.filetype
    end

    -- Получаем текущую рабочую директорию
    local cwd = vim.fn.getcwd()

    -- Если буфер не был открыт ранее, удаляем его, чтобы не засорять
    if not is_existing_buffer then
      vim.api.nvim_buf_delete(buf, { force = true })
    end

    return filetype, absolute_path
  end
end

M.EnableDiagnostic = function()
  vim.diagnostic.config({
    underline = true,
    signs = true,
    update_in_insert = true,
    virtual_text = true,
  })
end

M.DisableDiagnostic = function()
  vim.diagnostic.config({
    underline = false,
    signs = false,
    update_in_insert = false,
    virtual_text = false,
  })
end

M.Run = function(opts)
  local filetype, path = M.GetFileType(opts.args)

  if filetype == "go" then
    vim.cmd("!go run " .. path)
  elseif filetype == "python" then
    vim.cmd("!python3.12 " .. path)
  elseif filetype == "sh" then
    vim.cmd("!sh " .. path)
  else
    print("Unsupported file type")
  end
end

M.Test = function(opts)
  local filetype, _ = M.GetFileType(opts.args)

  if filetype == "go" then
    vim.cmd("!go test ./...") -- TODO: replace file to ...
  end
  -- TODO: add more langs
end

M.cowboy = function()
  ---@type table?
  local id
  local ok = true
  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local map = key
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= 10 then
        ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🤠",
          replace = id,
          keep = function()
            return count >= 10
          end,
        })
        if not ok then
          id = nil
          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

M.switch_case = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local word = vim.fn.expand("<cword>")
  local word_start = vim.fn.matchstrpos(vim.fn.getline("."), "\\k*\\%" .. (col + 1) .. "c\\k*")[2]

  -- Detect camelCase
  if word:find("[a-z][A-Z]") then
    -- Convert camelCase to snake_case
    local snake_case_word = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()
    vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { snake_case_word })
  -- Detect snake_case
  elseif word:find("_[a-z]") then
    -- Convert snake_case to camelCase
    local camel_case_word = word:gsub("(_)([a-z])", function(_, l)
      return l:upper()
    end)
    vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { camel_case_word })
  else
    print("Not a snake_case or camelCase word")
  end
end

M.cowboy()

return M
