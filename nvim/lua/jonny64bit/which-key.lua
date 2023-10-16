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
    },
    ["<leader>g"] = {
        name = "Goto 🚀",
        g = { '<cmd>lua vim.lsp.buf.hover()<cr>', "Details" },
        d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Definition" },
        o = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Declaration" },
        i = { '<cmd>Telescope lsp_implementations<cr>', "Implementations" },
        y = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
        r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
        s = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', "Signature Help" },
    },
    ["<leader>r"] = {
        name = "Refactor ♻️",
        r = { '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "Format" },
        n = { '<cmd>lua vim.lsp.buf.rename()<cr>', "Rename" },
        p = { '<cmd>lua vim.lsp.buf.code_action()<cr>', "Code Action" },
    }
});
