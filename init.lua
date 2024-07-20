-- bootstrap lazy.nvim, LazyVim and your plugins
--
vim.g.mapleader = " "

require("config.lazy")
require("toggleterm").setup({})

function _G.run_deno_test()
  -- Get the full path of the current file
  local current_file = vim.fn.expand("%:p")

  -- Get the current line number
  local line_number = vim.fn.line(".")

  -- Read the lines to extract the test description
  local lines = {}
  while true do
    local line = vim.fn.getline(line_number)
    table.insert(lines, line)
    if line:find("%)%s*%{%s*$") then
      break
    end
    line_number = line_number + 1
  end

  -- Join lines and extract the test description using Lua pattern matching
  local test_block = table.concat(lines, " ")
  local test_description = test_block:match('Deno%.test%(%s*"([^"]+)"')

  -- Build the deno test command
  local command = "deno test --allow-all " .. current_file

  -- Append the filter if a test description was found
  if test_description then
    command = command .. ' --filter="' .. test_description .. '"'
  end

  -- Open a terminal and run the command
  vim.cmd("split | terminal " .. command)
end
-- Set the keybinding to <leader>t
vim.api.nvim_set_keymap("n", "<leader>t", ":lua _G.run_deno_test()<CR>", { noremap = true, silent = true })
