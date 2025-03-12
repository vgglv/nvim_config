return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
        invert_signs = true
    },
    config = function(opts)
        vim.cmd.colorscheme("gruvbox")
        require("gruvbox").setup(opts)
    end
}
