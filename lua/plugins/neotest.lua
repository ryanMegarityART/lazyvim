return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-jest")({
        jestCommand = "npx jest",
        jestConfigFile = function(file)
          if string.match(file, "%.integration%.test%.ts$") then
            return "./tests/integration/jest.config.ts"
          end
          return "./jest.config.js"
        end,
        cwd = function()
          return vim.fn.getcwd()
        end,
      })
    )
  end,
}
