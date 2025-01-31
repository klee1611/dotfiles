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
					ensure_installed = { "node2" },
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

		-- Node.js Debug Adapter Configuration
		dap.adapters.node2 = {
			type = 'executable',
			command = 'node',
			args = { vim.fn.stdpath("data") .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
		}

		dap.configurations.javascript = {
			{
				type = 'node2',
				request = 'launch',
				name = 'Launch File',
				program = '${file}', -- Launch the current file
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = 'inspector',
				console = 'integratedTerminal',
			},
			{
				type = 'node2',
				request = 'attach',
				name = 'Attach to Process',
				processId = require('dap.utils').pick_process,
				cwd = vim.fn.getcwd(),
			},
		}

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
