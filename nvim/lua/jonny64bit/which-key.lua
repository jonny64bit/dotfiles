local wk = require("which-key")
wk.register(mappings, opts)

wk.register({
    ["<leader>h"] = {
        name = "Harpoon ⚓"
    },
    ["<leader>f"] = {
        name = "Telescope 🔭"
    },
    ["<leader>p"] = {
        name = "Launch ▶️",
        v = { function() vim.cmd.Ex() end, "Netrw 📂" }
    }
});
