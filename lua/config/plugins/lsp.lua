return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Formatting
		"stevearc/conform.nvim",
		-- Installs LSP servers
		"williamboman/mason.nvim",
		-- Bridge between mason and lspconfig
		"williamboman/mason-lspconfig.nvim",
		-- Autocompletion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		-- Displays LSP progress status
		"j-hui/fidget.nvim",
	},

	config = function()
		-- Configure conform
		require("conform").setup({
			formatters_by_ft = {
				-- Add formatters for different file types here.
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				go = { "goimports" },
				rust = { "rustfmt" },
				python = { "black" },
			},
		})

		-- Configure cmp
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")

		-- Setup capabilities
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- Configure fidget
		require("fidget").setup({})

		-- Configure mason
		require("mason").setup()

		-- Configure mason-lspconfig
		require("mason-lspconfig").setup({
			-- Ensure the following servers are installed
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"pyright",
				"clangd",
			},
			handlers = {
				-- Default handler
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Custom handler for zig Language Server
				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,

				-- Custom handler for lua_ls
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = {
										"bit",
										"vim",
										"it",
										"describe",
										"before_each",
										"after_each",
									},
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		-- Configure cmp mappings and sources
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		-- Configure diagnostics
		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Add autocommand to format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*" }, -- Or specify file types: { "*.lua", "*.js", "*.ts" }
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
