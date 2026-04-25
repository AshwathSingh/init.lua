local function apply_transparency()
	-- Core transparency
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

	-- Telescope transparency (find/grep pickers)
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })

	-- Harpoon transparency (v1/v2 highlight group names)
	vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "none" })
	vim.api.nvim_set_hl(0, "HarpoonBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "HarpoonNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "HarpoonInactive", { bg = "none" })
	vim.api.nvim_set_hl(0, "HarpoonActive", { bg = "none" })
end

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	apply_transparency()
end

-- Re-apply transparency whenever a colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		apply_transparency()
	end,
})

-- =========================
-- Plugins (Colorschemes)
-- =========================

return {

	-- Rose Pine (PRIMARY THEME)
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

			ColorMyPencils("rose-pine")
		end,
	},

	-- Tokyonight (optional fallback / switch manually)
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},

	-- Gruvbox (kept but NOT auto-enabled)
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		lazy = true,
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
			})
		end,
	},

	-- Brightburn (kept as optional theme)
	{
		"erikbackman/brightburn.vim",
		lazy = true,
	},
}
