return {
  {
    "sigmaSd/deno-nvim",
    config = function()
      require("deno-nvim").setup({
        -- Your configuration settings here
      })
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
}
