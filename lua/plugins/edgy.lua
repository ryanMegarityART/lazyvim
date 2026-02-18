return {
  "folke/edgy.nvim",
  opts = {
    right = {
      {
        ft = "snacks_terminal",
        size = { width = 0.25 },
        title = "%{b:snacks_terminal.id}: %{b:term_title}",
        filter = function(_buf, win)
          return vim.w[win].snacks_win
            and vim.w[win].snacks_win.position == "right"
            and vim.w[win].snacks_win.relative == "editor"
            and not vim.w[win].trouble_preview
        end,
      },
    },
  },
}
