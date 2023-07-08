local nmap = require("helpers.map").nmap

require("project_nvim").setup({
    detection_methods = { "pattern" },
})

require("telescope").load_extension("projects")
nmap("<leader>P", ":Telescope projects<CR>", "List projects")
