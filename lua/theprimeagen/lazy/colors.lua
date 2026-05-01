-- =========================
-- Transparency + Contrast
-- =========================

local function apply_transparency()
	-- Base editor (transparent)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#e0def4" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

	-- Floating windows (IMPORTANT: give them a base)
	local float_bg = "#1f1d2e"
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = float_bg })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = float_bg })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = float_bg })

	-- Telescope (same idea: not fully transparent)
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = float_bg })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = float_bg })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = float_bg })
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = float_bg })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = float_bg })

	-- Harpoon (keep consistent)
	vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = float_bg })
	vim.api.nvim_set_hl(0, "HarpoonBorder", { bg = float_bg })

	-- 🔥 Contrast boosters
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a273f" })
	vim.api.nvim_set_hl(0, "Visual", { bg = "#403d52" })

	vim.api.nvim_set_hl(0, "Comment", { fg = "#6e6a86", italic = false })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#555169" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c4a7e7" })
end

-- =========================
-- Colorscheme loader
-- =========================

function ColorMyPencils(color)
	color = color or "rose-pine-moon" -- darker variant = better contrast
	vim.cmd.colorscheme(color)
	apply_transparency()
end

-- Re-apply after any colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		apply_transparency()
	end,
})

-- =========================
-- Plugins (Colorschemes)
-- =========================

return {

	-- 🌙 Rose Pine (PRIMARY)
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})

			ColorMyPencils("rose-pine-moon")
		end,
	},

	-- 🌃 Tokyonight (optional)
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "dark", -- subtle contrast instead of full transparent
				},
			})
		end,
	},

	-- 🟤 Gruvbox (optional high-contrast fallback)
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		lazy = true,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				transparent_mode = false,
			})
		end,
	},

	-- 🔥 Brightburn (optional)
	{
		"erikbackman/brightburn.vim",
		lazy = true,
	},
}


