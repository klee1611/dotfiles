return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false,
		build = "make",
		opts = {
			-- Drive the local Claude Code CLI over ACP (Agent Client Protocol).
			-- Requires: npm i -g @agentclientprotocol/claude-agent-acp
			-- Auth comes from the CLI itself (`claude login`) -- no API key needed.
			-- Switch back to the plain HTTP provider with :AvanteSwitchProvider claude
			provider = "claude-code",
			auto_suggestions_provider = "copilot",

			acp_providers = {
				["claude-code"] = {
					command = "claude-agent-acp",
					args = {},
					-- avante spawns the agent with ONLY PATH plus what is listed
					-- here, so pass through everything the CLI needs to locate
					-- its own config and credentials.
					env = {
						NODE_NO_WARNINGS = "1",
						HOME = os.getenv("HOME"),
						USER = os.getenv("USER"),
						SHELL = os.getenv("SHELL"),
						-- claude-agent-acp reads CLAUDE_CODE_EXECUTABLE
						CLAUDE_CODE_EXECUTABLE = vim.fn.exepath("claude"),
						-- ANTHROPIC_API_KEY is deliberately not passed: it would
						-- override `claude login` and bill the API account instead.
						ANTHROPIC_BASE_URL = os.getenv("ANTHROPIC_BASE_URL"),
					},
				},
			},

			-- Non-ACP fallback: direct Anthropic API. Optional — the default
			-- provider above uses `claude login` and needs no key. To enable it,
			-- run `secret-set ANTHROPIC_API_KEY`; the key is read from Keychain
			-- (approval dialog) only when this provider is used.
			providers = {
				claude = {
					endpoint = "https://api.anthropic.com",
					api_key_name = "cmd:/usr/bin/security find-generic-password -s dotfiles-env -a ANTHROPIC_API_KEY -w",
					model = "claude-sonnet-4-6",
					timeout = 30000,
					extra_request_body = {
						temperature = 0,
						max_tokens = 8096,
					},
				},
			},

			behaviour = {
				auto_suggestions = false,
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
				-- Jump to the file/line the ACP agent is editing as it works
				acp_follow_agent_locations = true,
			},

			mappings = {
				-- Sidebar / session (leader is ",")
				ask = "<leader>aa", -- open sidebar & ask
				new_ask = "<leader>an", -- start a fresh conversation
				edit = "<leader>ae", -- inline edit on visual selection
				refresh = "<leader>ar",
				focus = "<leader>af",
				stop = "<leader>aS", -- interrupt the running agent
				zen_mode = "<leader>az", -- full-screen, CLI-like view
				toggle = {
					default = "<leader>at",
					debug = "<leader>ad",
					selection = "<leader>aC",
					suggestion = "<leader>as",
					repomap = "<leader>aR",
				},
				files = {
					add_current = "<leader>ac", -- add current buffer as context
					add_all_buffers = "<leader>aB",
				},
				select_history = "<leader>ah",
				select_model = "<leader>a?", -- non-ACP providers
				-- ACP-specific: pick the Claude Code model / permission mode
				select_acp_model = "<leader>aM",
				select_acp_mode = "<leader>am",

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
					retry_user_request = "r",
					edit_user_request = "e",
					expand_tool_use = "<S-Tab>",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
					toggle_code_window = "x",
					add_file = "@",
					remove_file = "d",
					close = { "q" },
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
