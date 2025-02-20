local M = {}

-- Configure the log file path in .config/nvim directory
local log_file = vim.fn.stdpath("config") .. "/error.log"

-- Function to get current timestamp
local function get_timestamp()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- Function to format error message with more detailed information
local function format_error(err, stack)
    local msg = string.format("\n[%s] Error: %s", get_timestamp(), err)
    if stack then
        msg = msg .. "\nStacktrace:\n" .. stack
    end
    -- Add Neovim version and operating system info
    msg = msg .. string.format("\nNeovim Version: %s", vim.version())
    msg = msg .. string.format("\nOS: %s", jit.os)
    return msg .. "\n----------------------------------------"
end

-- Function to ensure log directory exists
local function ensure_log_dir()
    local log_dir = vim.fn.fnamemodify(log_file, ":h")
    if vim.fn.isdirectory(log_dir) == 0 then
        vim.fn.mkdir(log_dir, "p")
    end
end

-- Function to write to log file with error handling
function M.log_error(err, stack)
    ensure_log_dir()
    
    local file = io.open(log_file, "a")
    if file then
        local success, write_error = pcall(function()
            file:write(format_error(err, stack))
            file:flush() -- Ensure content is written immediately
        end)
        file:close()
        
        if not success then
            vim.notify(
                "Failed to write to error log: " .. (write_error or "unknown error"),
                vim.log.levels.ERROR
            )
        end
    else
        vim.notify(
            "Failed to open error log file: " .. log_file,
            vim.log.levels.ERROR
        )
    end
end

-- Function to view error log with fallback
function M.view_error_log()
    if vim.fn.filereadable(log_file) == 1 then
        -- Open in a split window with specific settings
        vim.cmd("split " .. vim.fn.fnameescape(log_file))
        -- Set buffer-local options for better log viewing
        vim.cmd([[
            setlocal readonly
            setlocal nomodifiable
            setlocal buftype=nofile
            setlocal bufhidden=hide
            setlocal nowrap
        ]])
    else
        vim.notify("No error log file exists at: " .. log_file, vim.log.levels.INFO)
    end
end

-- Function to clear error log with confirmation
function M.clear_error_log()
    if vim.fn.filereadable(log_file) == 1 then
        local choice = vim.fn.confirm("Clear error log?", "&Yes\n&No", 2)
        if choice == 1 then
            local file = io.open(log_file, "w")
            if file then
                file:close()
                vim.notify("Error log cleared", vim.log.levels.INFO)
            else
                vim.notify("Failed to clear error log", vim.log.levels.ERROR)
            end
        end
    else
        vim.notify("No error log file exists", vim.log.levels.INFO)
    end
end

-- Function to test error logging
function M.test_error_logging()
    M.log_error("Test error message", debug.traceback("Test stack trace", 2))
    vim.notify("Test error logged successfully", vim.log.levels.INFO)
end

-- Set up error handling
function M.setup()
    -- Override the default error handler
    vim.on_error = function(err)
        local stack = debug.traceback("", 2)
        M.log_error(err, stack)
        vim.notify(
            "An error occurred. Check error log for details.\nError: " .. err,
            vim.log.levels.ERROR
        )
    end

    -- Add commands
    vim.api.nvim_create_user_command("ErrorLog", M.view_error_log, {})
    vim.api.nvim_create_user_command("ErrorLogClear", M.clear_error_log, {})
    vim.api.nvim_create_user_command("ErrorLogTest", M.test_error_logging, {})

    -- Create keymaps
    vim.keymap.set("n", "<leader>xe", M.view_error_log, { desc = "View Error Log" })
    vim.keymap.set("n", "<leader>xE", M.clear_error_log, { desc = "Clear Error Log" })
end

return M
