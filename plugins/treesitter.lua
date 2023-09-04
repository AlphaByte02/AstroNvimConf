local utils = require "astronvim.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
          "yaml",
          "json",
          "jsonc",
          "lua",
          "luap",
          "python",
          "toml",
          "bash",
          "dockerfile",
          "dot",
          "fish",
          "gitignore",
          "html",
          "css",
          "ini",
          "javascript",
          "markdown",
          "php",
          "sql",
          "typescript",
          "tsx",
          "xml",
        })
      end
    end,
  },
}
