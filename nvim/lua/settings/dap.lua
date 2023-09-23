local dap = require("dap")
local dapui = require("dapui")
local nmap = require("helpers.map").nmap
local vmap = require("helpers.map").vmap
local thunk = require("helpers.func").thunk

dapui.setup()

-- Open and close the windows automatically.
dap.listeners.after.event_initialized.dapui_config = thunk(dapui.open)
dap.listeners.before.event_terminated.dapui_config = thunk(dapui.close)
dap.listeners.before.event_exited.dapui_config = thunk(dapui.close)

-- Key mappings.
nmap("<F5>", dap.continue, "Debugger: continue")
nmap("<F6>", dap.run_to_cursor, "Debugger: run to cursor")
nmap("<F10>", dap.step_over, "Debugger: step over")
nmap("<F11>", dap.step_into, "Debugger: step into")
nmap("<F12>", dap.step_out, "Debugger: step out")
nmap("<leader>Db", dap.toggle_breakpoint, "Debugger: toggle breakpoint")
nmap("<leader>DB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "Debugger: set conditional breakpoint")
nmap("<leader>Dp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, "Debugger: set log point")
nmap("<leader>Dr", dap.repl.toggle, "Debugger: toggle REPL")
nmap("<leader>Dl", dap.run_last, "Debugger: re-run the last configuration")
nmap("<leader>De", dap.terminate, "Debugger: terminate")
nmap("<leader>DC", dap.clear_breakpoints, "Debugger: clear breakpoints")
nmap("<leader>Du", dap.up, "Debugger: go up in stacktrace")
nmap("<leader>Dd", dap.down, "Debugger: go down in stacktrace")

nmap("<leader>Dk", dapui.eval, "Debugger: eval the current word")
vmap("<leader>Dk", dapui.eval, "Debugger: eval the current selection")
