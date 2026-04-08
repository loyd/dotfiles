vim.pack.add({ "https://github.com/lsig/messenger.nvim" })

local nmap = require("helpers.map").nmap

require("messenger").setup({ border = "single" })

nmap("<leader>gs", ":MessengerShow<CR>", "Messenger: show commit messages")
