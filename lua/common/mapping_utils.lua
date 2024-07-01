-- common/mapping_utils.lua
local M = {}

-- Generic function to apply mappings
function M.apply_mappings(mapping_table)
  for section_name, section in pairs(mapping_table) do
    for mode, mappings in pairs(section) do
      for key, map_info in pairs(mappings) do
        local opts = { desc = map_info[2] }
        vim.api.nvim_set_keymap(mode, key, map_info[1], opts)
      end
    end
  end
end

return M
