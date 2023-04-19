return {
	"freddiehaddad/feline.nvim",
	config = function()
		local present, feline = pcall(require, "feline")
		if not present then
			return
		end
		local theme = {
			aqua = "#7AB0DF",
			bg = "#1C212A",
			blue = "#5FB0FC",
			cyan = "#70C0BA",
			darkred = "#FB7373",
			fg = "#C7C7CA",
			gray = "#222730",
			green = "#79DCAA",
			lime = "#54CED6",
			orange = "#FFD064",
			pink = "#D997C8",
			purple = "#C397D8",
			red = "#F87070",
			yellow = "#FFE59E",
		}

		local mode_theme = {
			["NORMAL"] = theme.green,
			["OP"] = theme.cyan,
			["INSERT"] = theme.aqua,
			["VISUAL"] = theme.yellow,
			["LINES"] = theme.darkred,
			["BLOCK"] = theme.orange,
			["REPLACE"] = theme.purple,
			["V-REPLACE"] = theme.pink,
			["ENTER"] = theme.pink,
			["MORE"] = theme.pink,
			["SELECT"] = theme.darkred,
			["SHELL"] = theme.cyan,
			["TERM"] = theme.lime,
			["NONE"] = theme.gray,
			["COMMAND"] = theme.blue,
		}

		local component = {
			vim_mode = {
				provider = function()
					return vim.api.nvim_get_mode().mode:upper()
				end,
				hl = function()
					return {
						fg = "bg",
						bg = require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
						name = "NeovimModeHLColor",
					}
				end,
				left_sep = "block",
				right_sep = "block",
			},
			gitBranch = {
				provider = "git_branch",
				hl = {
					fg = "fg",
					bg = "gray",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "",
			},
			gitDiffAdded = {
				provider = "git_diff_added",
				hl = {
					fg = "green",
					bg = "bg",
				},
				left_sep = "",
				right_sep = "",
			},
			gitDiffRemoved = {
				provider = "git_diff_removed",
				hl = {
					fg = "red",
					bg = "bg",
				},
				left_sep = "",
				right_sep = "",
			},
			gitDiffChanged = {
				provider = "git_diff_changed",
				hl = {
					fg = "purple",
					bg = "bg",
				},
				left_sep = "",
				right_sep = "",
			},
			separator = {
				provider = "",
			},
			fileinfo = {
				provider = {
					name = "file_info",
					opts = {
						type = "relative-short",
					},
				},
				hl = {
					style = "bold",
				},
				left_sep = " ",
				right_sep = " ",
			},
			diagnostic_errors = {
				provider = "diagnostic_errors",
				hl = {
					fg = "red",
				},
			},
			diagnostic_warnings = {
				provider = "diagnostic_warnings",
				hl = {
					fg = "yellow",
				},
			},
			diagnostic_hints = {
				provider = "diagnostic_hints",
				hl = {
					fg = "aqua",
				},
			},
			diagnostic_info = {
				provider = "diagnostic_info",
			},
			lsp_client_names = {
				provider = "lsp_client_names",
				hl = {
					fg = "purple",
					bg = "bg",
					style = "bold",
				},
				left_sep = "left_filled",
				right_sep = "block",
			},
			file_type = {
				provider = {
					name = "file_type",
					opts = {
						filetype_icon = true,
					},
				},
				hl = {
					fg = "fg",
					bg = "bg",
				},
				left_sep = "block",
				right_sep = "block",
			},
			file_encoding = {
				provider = "file_encoding",
				hl = {
					fg = "orange",
					bg = "bg",
					style = "italic",
				},
				left_sep = "block",
				right_sep = "block",
			},
			scroll_bar = {
				provider = function()
					local chars = {
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
					}
					local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
					local position = math.floor(line_ratio * 100)

					if position <= 5 then
						position = " TOP"
					elseif position >= 95 then
						position = " BOT"
					else
						position = chars[math.floor(line_ratio * #chars)] .. position
					end
					return position
				end,
				hl = function()
					local position =
						math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
					local fg
					local style

					if position <= 5 then
						fg = "aqua"
						style = "bold"
					elseif position >= 95 then
						fg = "red"
						style = "bold"
					else
						fg = "purple"
						style = nil
					end
					return {
						fg = fg,
						style = "bold",
						bg = "gray",
					}
				end,
				left_sep = "block",
				right_sep = "block",
			},
		}

		local left = {
			component.vim_mode,
			component.gitBranch,
			component.gitDiffAdded,
			component.gitDiffRemoved,
			component.gitDiffChanged,
			component.separator,
		}

		local middle = {
			-- component.fileinfo,
			component.diagnostic_errors,
			component.diagnostic_warnings,
			component.diagnostic_info,
			component.diagnostic_hints,
		}

		local right = {
			component.file_type,
			component.lsp_client_names,
			component.scroll_bar,
		}

		local components = {
			active = {
				left,
				middle,
				right,
			},
			inactive = {
				left,
				middle,
				right,
			},
		}

		feline.setup({
			components = components,
			theme = theme,
			vi_mode_colors = mode_theme,
		})
	end,
}
