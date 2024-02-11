return {
  'mfussenegger/nvim-dap',
  config = function ()
    local dap = require("dap")
    dap.adapters["pwa-node"] = {
      type = "server",
      hose = "127.0.0.1",
      port = 8123,
      executable = {
        command = "js-debug-adapter",
      }
    }
    for _, language in ipairs { "typescript", "javascript" } do
      dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "node",
      },
    }
    end
  end,

  -- DAP keybinds
  vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Debugger: Add Breakpoint at line" }),
  vim.keymap.set("n", "<leader>db", "<cmd>DapContinue<cr>", { desc = "Run or continue the debugger" })
}
