local dap, dapui = require "dap", require "dapui"

-- setup
dapui.setup()
require("nvim-dap-virtual-text").setup {
  commented = true,
  highlight_changed_variables = true,
}
require("dap-go").setup()

--have dapUI open with dap
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- debuggers
dap.adapters.lldb = {
  type = "executable",
  command = "lldb-dap",
  name = "lldb",
}

-- configurations
dap.configurations.c = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
dap.configurations.zig = dap.configurations.c

-- keybinds
local map = vim.keymap.set
map("n", "<F4>", function()
  dap.continue()
end, { desc = "DAP continue" })
map("n", "<F5>", function()
  dap.step_over()
end, { desc = "DAP step over" })
map("n", "<F6>", function()
  dap.step_into()
end, { desc = "DAP step into" })
map("n", "<F7>", function()
  dap.step_out()
end, { desc = "DAP step out" })
map("n", "<leader>tb", function()
  dap.toggle_breakpoint()
end, { desc = "DAP toggle breakpoint" })
