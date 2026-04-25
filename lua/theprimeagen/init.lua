require("theprimeagen.core.options")
require("theprimeagen.core.keymaps")
require("theprimeagen.core.autocmds")
require("theprimeagen.lazy_bootstrap")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

