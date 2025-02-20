vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.opt.mouse = 'a'
vim.opt.showmode = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.wo.number = true

-- Clipboard configuration
local function has_clipboard_tool()
    return vim.fn.executable('xclip') == 1 
        or vim.fn.executable('wl-copy') == 1 
        or vim.fn.executable('pbcopy') == 1  -- for MacOS
end

if has_clipboard_tool() then
    vim.opt.clipboard = 'unnamedplus'
else
    vim.notify(
        "No clipboard tool found. Please install xclip (X11) or wl-clipboard (Wayland)",
        vim.log.levels.WARN
    )
end
