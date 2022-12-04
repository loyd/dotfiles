local nmap = require("helpers.map").nmap

require("project_nvim").setup({})

require("telescope").load_extension("projects")
nmap("<leader>p", ":Telescope projects<CR>")
