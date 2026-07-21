return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false,
		build = "make",
		opts = {
			-- Default provider: "claude" | "openai" | "copilot" | "gemini"
			-- Set ANTHROPIC_API_KEY env var to use claude
			provider = "claude",
			auto_suggestions_provider = "claude",

			providers = {
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-6",
					timeout = 30000,
					extra_request_body = {
						temperature = 0,
						max_tokens = 8096,
					},
				},
			},

			-- Uncomment to use Copilot instead (no API key needed)
			-- provider = "copilot",
			-- auto_suggestions_provider = "copilot",

			behaviour = {
				auto_suggestions = false,
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
			},

			mappings = {
				diff = {
					ours = "co",
					theirs = "ct",
					all_theirs = "ca",
					both = "cb",
					cursor = "cc",
					next = "]x",
					prev = "[x",
				},
				suggestion = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				sidebar = {
					apply_all = "A",
					apply_cursor = "a",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
				},
			},

			hints = { enabled = true },

			windows = {
				position = "right",
				wrap = true,
				width = 35,
				sidebar_header = {
					enabled = true,
					align = "center",
					rounded = true,
				},
				input = {
					prefix = "> ",
					height = 8,
				},
				edit = {
					border = "rounded",
					start_insert = true,
				},
				ask = {
					floating = false,
					start_insert = true,
					border = "rounded",
					focus_on_apply = "ours",
				},
			},

			highlights = {
				diff = {
					current = "DiffText",
					incoming = "DiffAdd",
				},
			},

			diff = {
				autojump = true,
				list_opener = "copen",
				override_timeoutlen = 500,
			},
		},

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			-- Paste images into chat
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = { insert_mode = true },
						use_absolute_path = true,
					},
				},
			},
			-- Markdown rendering in sidebar (already in basic-plug.lua, marked optional)
			{ "OXY2DEV/markview.nvim", optional = true },
		},
	},
}
