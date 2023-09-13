-- Vanilla Config
require('gui1612.settings')
require('gui1612.autocmd')
require('gui1612.plugins')
require('gui1612.keybinds')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
