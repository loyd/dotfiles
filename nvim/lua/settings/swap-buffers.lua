local sb = require("swap-buffers")
local nmap = require("helpers.map").nmap
local partial = require("helpers.func").partial

sb.setup()

nmap("<leader><C-h>", partial(sb.swap_buffers, "h"), "Swap the current buffer with the left one")
nmap("<leader><C-j>", partial(sb.swap_buffers, "j"), "Swap the current buffer with the bottom one")
nmap("<leader><C-k>", partial(sb.swap_buffers, "k"), "Swap the current buffer with the top one")
nmap("<leader><C-l>", partial(sb.swap_buffers, "l"), "Swap the current buffer with the right one")
