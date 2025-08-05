local M = {}

-- Find Terraform block (resource, data, or module) the cursor is inside
local function find_terraform_block()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor[1]

  for lnum = current_line, 1, -1 do
    local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]

    -- resource "type" "name"
    local res_type, res_name = line:match '^resource%s+"([%w_]+)"%s+"([%w_]+)"'
    if res_type and res_name then
      return res_type .. '.' .. res_name
    end

    -- data "type" "name"
    local data_type, data_name = line:match '^data%s+"([%w_]+)"%s+"([%w_]+)"'
    if data_type and data_name then
      return data_type .. '.' .. data_name
    end

    -- module "name"
    local mod_name = line:match '^module%s+"([%w_]+)"'
    if mod_name then
      return 'module.' .. mod_name
    end
  end

  return nil
end

-- Open a floating terminal and run a command
local function open_floating_term(cmd)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.fn.termopen(cmd)

  vim.cmd 'startinsert'

  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>bd!<CR>', { noremap = true, silent = true })
end

-- Main action: run `tofu plan -target=...` on the current Terraform block
function M.tf_plan_target()
  local target = find_terraform_block()
  if not target then
    vim.notify('No Terraform resource/data/module block found.', vim.log.levels.WARN)
    return
  end

  local cmd = { 'tofu', 'plan', '-target=' .. target }
  open_floating_term(cmd)
end

-- Setup: keymap binding
function M.setup()
  vim.keymap.set('n', '<leader>ip', M.tf_plan_target, {
    noremap = true,
    silent = true,
    desc = 'Run `tofu plan` for current Terraform block',
  })
end

return M
