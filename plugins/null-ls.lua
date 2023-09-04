local utils = require "astronvim.utils"
local jsonu = require "user.utils.json"
local search = require "user.utils.filesearch"

local function has_eslint(util)
  return util.root_has_file ".eslintrc.js"
    or util.root_has_file ".eslintrc.cjs"
    or util.root_has_file ".eslintrc.yaml"
    or util.root_has_file ".eslintrc.yml"
    or util.root_has_file ".eslintrc.json"
    or jsonu.check_json_key_exists(vim.fn.getcwd() .. "/package.json", "eslintConfig")
end

local function has_mypy(util)
  return util.root_has_file "pyproject.toml"
    and search.file_search_string(vim.fn.getcwd() .. "/pyproject.toml", "[tool.mypy]")
end

local function has_ruff(util)
  return util.root_has_file "pyproject.toml"
    and search.file_search_string(vim.fn.getcwd() .. "/pyproject.toml", "[tool.ruff]")
end

local function has_isort(util)
  return util.root_has_file "pyproject.toml"
    and search.file_search_string(vim.fn.getcwd() .. "/pyproject.toml", "[tool.isort]")
end

return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        utils.list_insert_unique(opts.ensure_installed, { "prettierd", "eslint_d", "stylua", "black", "isort", "mypy" })
      if not opts.handlers then opts.handlers = {} end

      opts.handlers.prettierd = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "json", "markdown", "css" } })
      end
      opts.handlers.eslint_d = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.eslint_d.with { condition = has_eslint })
        null_ls.register(null_ls.builtins.formatting.eslint_d.with { condition = has_eslint })
        null_ls.register(null_ls.builtins.code_actions.eslint_d.with { condition = has_eslint })
      end

      opts.handlers.mypy = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.mypy.with { condition = has_mypy })
      end
      opts.handlers.fuff_lsp = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.ruff.with { condition = has_ruff })
      end
      opts.handlers.isort = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.isort.with { condition = has_isort })
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      opts.sources = utils.list_insert_unique(opts.sources, require "typescript.extensions.null-ls.code-actions")
    end,
  },
}
