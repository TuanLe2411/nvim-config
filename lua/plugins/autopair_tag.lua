return {
 {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePromt", "vim" },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag"
  }
}
