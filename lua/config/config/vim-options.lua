vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.opt.mouse = 'a'
vim.opt.showmode = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.wo.number = true
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false

-- Clipboard configuration
local function is_windows()
    return vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1
end

local function has_wsl()
    local output = vim.fn.systemlist "uname -r"
    return not not string.find(output[1] or "", "WSL")
end

local function has_clipboard_tool()
    if is_windows() or has_wsl() then
        return vim.fn.executable('win32yank.exe') == 1
    end
    return vim.fn.executable('xclip') == 1 
        or vim.fn.executable('wl-copy') == 1 
        or vim.fn.executable('pbcopy') == 1  -- for MacOS
end

if has_clipboard_tool() then
    if is_windows() or has_wsl() then
        vim.g.clipboard = {
            name = 'win32yank-wsl',
            copy = {
                ['+'] = 'win32yank.exe -i --crlf',
                ['*'] = 'win32yank.exe -i --crlf',
            },
            paste = {
                ['+'] = 'win32yank.exe -o --lf',
                ['*'] = 'win32yank.exe -o --lf',
            },
            cache_enabled = 0,
        }
    else
        -- For Linux/MacOS, use the default unnamedplus clipboard
        vim.opt.clipboard = 'unnamedplus'
    end
else
    local msg = ""
    if is_windows() or has_wsl() then
        msg = "No clipboard tool found. Please install win32yank."
    else
        msg = "No clipboard tool found. Please install xclip (X11) or wl-clipboard (Wayland)"
    end
    vim.notify(msg, vim.log.levels.WARN)
end
