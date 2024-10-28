return {
    'nvim-lualine/lualine.nvim',
    opts = {
        {
            options = {
                theme = "catppuccin",
                section_separators = {
                    left = '',
                    right = '',
                },
                component_separators = {
                    left = '|',
                    right = '|',
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = {
                    'location',
                    {
                        function()
                            local schema = require("yaml-companion").get_buf_schema(0)
                            if schema.result[1].name == "none" then
                                return ""
                            end
                            return schema.result[1].name
                        end,
                    }
                }
            },
        }
    }
}
