local neotest = require "neotest"

neotest.setup {
  adapters = {
    require "neotest-golang",
    require "neotest-zig" {
      dap = {
        adapter = "lldb",
      },
    },
    require("neotest-gtest").setup {
      debug_adapter = "lldb-dap",
    },
  },
}
