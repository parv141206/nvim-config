-- ~/.config/nvim/lua/theme_manager.lua

local themes = {"tokyonight", "gruvbox", "nord"} -- List of available themes

local function switch_theme(theme)
    vim.cmd("colorscheme " .. theme)
end

local function theme_picker()
    local actions = require('telescope.actions')
    local telescope = require('telescope')

    -- Create a new picker using Telescope
    telescope.pickers.new({}, {
        prompt_title = "Select Theme",
        finder = telescope.finders.new_table {
            results = themes,
            entry_maker = function(theme)
                return {
                    value = theme,
                    display = theme,
                    ordinal = theme,
                }
            end,
        },
        sorter = telescope.sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                local selection = actions.get_selected_entry()
                if selection then
                    switch_theme(selection.value) -- Switch to the selected theme
                end
                actions.close(prompt_bufnr) -- Close the picker
            end)
            return true
        end,
    }):find() -- Call find to display the picker
end

return {
    theme_picker = theme_picker,
}
