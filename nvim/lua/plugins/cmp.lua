local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		-- TODO: Check this later
		{ name = "luasnip" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<S-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<S-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
