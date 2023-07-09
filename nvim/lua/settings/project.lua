local nmap = require("helpers.map").nmap

require("project_nvim").setup({
    detection_methods = { "pattern" },
    exclude_dirs = { "~/.cargo/*", "~/.rustup/*" },
})

require("telescope").load_extension("projects")
nmap("<leader>P", ":Telescope projects<CR>", "List projects")
