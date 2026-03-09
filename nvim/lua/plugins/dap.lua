return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		{
			'jay-babu/mason-nvim-dap.nvim', -- DAP installer with Mason
			dependencies = {
				'williamboman/mason.nvim',
				'mfussenegger/nvim-dap',
			},
			config = function()
				require('mason-nvim-dap').setup({
					-- Install debug adapter
					ensure_installed = require("plugins.utils.common").mason_ensure_installed.dap,
					automatic_installation = true,
				})
			end,
		},
	},
	keys = {
		-- normal mode is default
		{ "db", function() require 'dap'.toggle_breakpoint() end },
		{ "dc", function() require 'dap'.continue() end },
		{ "dn", function() require 'dap'.step_over() end },
		{ "di", function() require 'dap'.step_into() end },
		{ "do", function() require 'dap'.step_out() end },
	},
	config = function()
		local dap = require('dap')
		local dapui = require("dapui")

		-- Modern JS/TS Debug Adapter (js-debug-adapter)
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
			}
		}

		for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch File",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to Process",
					processId = require('dap.utils').pick_process,
					cwd = "${workspaceFolder}",
				}
			}
		end

		-- DAP UI configuration
		dapui.setup({
			controls = {
				element = "repl",
				enabled = true,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = ""
				}
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" }
				}
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = ""
			},
			layouts = {
				{
					elements = {
						"scopes"
					},
					size = 0.3,
					position = "bottom",
				},
				{
					elements = {
						"repl",
						"breakpoints"
					},
					size = 0.3,
					position = "right"
				},
			},
			mappings = {
				edit = "e",
				expand = { "t", "<2-LeftMouse>" },
				remove = "d",
				repl = {},
				open = {},
				toggle = {},
			},
			render = {
				indent = 1,
				max_value_lines = 100
			}
		})
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({ reset = true })
		end
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end
}
