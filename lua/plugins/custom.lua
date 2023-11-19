return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
          init_options = {
            languageFeatures = {
              references = true,
              definition = true,
              typeDefinition = true,
              callHierarchy = true,
              hover = false,
              rename = true,
              signatureHelp = true,
              codeAction = true,
              completion = {
                defaultTagNameCase = "both",
                defaultAttrNameCase = "kebabCase",
              },
              schemaRequestService = true,
              documentHighlight = true,
              codeLens = true,
              semanticTokens = true,
              diagnostics = true,
            },
            documentFeatures = {
              selectionRange = true,
              foldingRange = true,
              linkedEditingRange = true,
              documentSymbol = true,
              documentColor = true,
            },
          },
          settings = {
            volar = {
              codeLens = {
                references = true,
                pugTools = true,
                scriptSetupTools = true,
              },
            },
          },
        },
      },
    },
  },
}
