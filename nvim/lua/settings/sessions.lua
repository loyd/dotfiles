require("sessions").setup({
    events = { "VimLeavePre" },
    session_filepath = "~/.config/nvim/session",
})
