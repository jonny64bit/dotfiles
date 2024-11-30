return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end
        local wk = require("which-key")

        wk.add({
            { "<leader>a", function() harpoon:list():add() end, desc = "Add to Harpoon", icon = "" },
            { "<leader>fh", function() toggle_telescope(harpoon:list()) end, desc = "Harpoon", icon = "󰀱" },
            { "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Quick Menu", icon = "󰓅" },
            { "<leader>oo", function() harpoon:list():remove() end, desc = "Remove", icon = "" },
            { "<leader>oc", function() harpoon:list():clear() end, desc = "Clear", icon = "󰯈" },
            { "<leader>1", function() harpoon:list():select(1) end, desc = "Harpoon 1", icon = "⚡"},
            { "<leader>2", function() harpoon:list():select(2) end, desc = "Harpoon 2", icon = "⚡"},
            { "<leader>3", function() harpoon:list():select(3) end, desc = "Harpoon 3", icon = "⚡"},
            { "<leader>4", function() harpoon:list():select(4) end, desc = "Harpoon 4", icon = "⚡"},
            { "<leader>5", function() harpoon:list():select(5) end, desc = "Harpoon 5", icon = "⚡", hidden = true},
            { "<leader>6", function() harpoon:list():select(6) end, desc = "Harpoon 6", icon = "⚡", hidden = true},
            { "<leader>7", function() harpoon:list():select(7) end, desc = "Harpoon 7", icon = "⚡", hidden = true},
            { "<leader>8", function() harpoon:list():select(8) end, desc = "Harpoon 7", icon = "⚡", hidden = true},
            { "<leader>9", function() harpoon:list():select(9) end, desc = "Harpoon 9", icon = "⚡", hidden = true},
            { "<leader>oh", function() harpoon:list():prev() end, desc = "Harpoon Last", icon = ""},
            { "<leader>ol", function() harpoon:list():next() end, desc = "Harpoon Next", icon = ""},
            { "<leader>o", group = "Harpoon", icon = "󰀱" },
        })
    end
}
