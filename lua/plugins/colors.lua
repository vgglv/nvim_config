return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(opts)
        vim.cmd.colorscheme("catppuccin")
    end
}
