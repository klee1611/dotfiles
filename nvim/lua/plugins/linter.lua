return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure ruff with a broad set of rules:
		--   E/W  - pycodestyle (PEP8 style)
		--   F    - pyflakes (unused imports, undefined names)
		--   I    - isort (import order)
		--   UP   - pyupgrade (deprecated syntax, suggest modern alternatives)
		--   B    - flake8-bugbear (common bugs and design issues)
		--   PERF - perflint (performance anti-patterns)
		--   SIM  - flake8-simplify (suggest simpler code)
		-- Per-project overrides go in ruff.toml or pyproject.toml.
		lint.linters.ruff = vim.tbl_deep_extend("force", lint.linters.ruff or {}, {
			args = {
				"check",
				"--select=E,W,F,I,UP,B,PERF,SIM",
				"--output-format=json",
				"-",
			},
		})

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			-- ruff: PEP8, pyflakes, bugbear, pyupgrade (deprecations), performance
			-- mypy: deep static type checking
			python = { "ruff", "mypy" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
