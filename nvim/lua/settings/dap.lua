local dap = require("dap")
local dapui = require("dapui")
local nmap = require("helpers.map").nmap
local vmap = require("helpers.map").vmap

dapui.setup()

-- Open and close the windows automatically.
dap.listeners.after.event_initialized.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Key mappings.
nmap("<F5>", ":lua require 'dap'.continue()<CR>")
nmap("<F6>", ":lua require 'dap'.run_to_cursor()<CR>")
nmap("<F10>", ":lua require 'dap'.step_over()<CR>")
nmap("<F11>", ":lua require 'dap'.step_into()<CR>")
nmap("<F12>", ":lua require 'dap'.step_out()<CR>")
nmap("<leader>Db", ":lua require 'dap'.toggle_breakpoint()<CR>")
nmap("<leader>DB", ":lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nmap("<leader>Dp", ":lua require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nmap("<leader>Dr", ":lua require 'dap'.repl.toggle()<CR>")
nmap("<leader>Dl", ":lua require 'dap'.run_last()<CR>")
nmap("<leader>De", ":lua require 'dap'.terminate()<CR>")
nmap("<leader>DC", ":lua require 'dap'.clear_breakpoints()<CR>")
nmap("<leader>Du", ":lua require 'dap'.up()<CR>")
nmap("<leader>Dd", ":lua require 'dap'.down()<CR>")

nmap("<leader>Dk", ":lua require 'dapui'.eval()<CR>")
vmap("<leader>Dk", ":lua require 'dapui'.eval()<CR>")
