---------------------- Config vim go plugin -----------------------------------------------\\

vim.cmd [[
   augroup NvimGo
       autocmd!
       autocmd User NvimGoLintPopupPost wincmd p
   augroup END
]]

------------------------------------------------------------------------------------------\\
-- disable some default providers when checkhealth

for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

