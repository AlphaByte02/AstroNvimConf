local utils = require "astronvim.utils"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "jsonls",
        "pyright",
        "ruff_lsp",
        "taplo",
        "yamlls",
        "docker_compose_language_service",
        "dockerls",
        "html",
        "cssls",
        "emmet_ls",
      })
    end,
  },
}
