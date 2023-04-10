---@type LazyVimConfig
local M = {}
M.lazy_version = ">=9.1.0"

---@class LazyVimConfig
local defaults = {
    -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
    ---@type string|fun()
    colorscheme = function()
        require("tokyonight").load()
    end,
    -- load the default settings
    defaults = {
        autocmds = true, -- config.autocmds
        keymaps = true,  -- config.keymaps
    },
    -- icons used by other plugins
    icons = {
        diagnostics = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
        },
        git = {
            added = " ",
            modified = " ",
            removed = " ",
        },
        kinds = {
            Array = " ",
            Boolean = " ",
            Class = " ",
            Color = " ",
            Constant = " ",
            Constructor = " ",
            Copilot = " ",
            Enum = " ",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = " ",
            Folder = " ",
            Function = " ",
            Interface = " ",
            Key = " ",
            Keyword = " ",
            Method = " ",
            Module = " ",
            Namespace = " ",
            Null = " ",
            Number = " ",
            Object = " ",
            Operator = " ",
            Package = " ",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            String = " ",
            Struct = " ",
            Text = " ",
            TypeParameter = " ",
            Unit = " ",
            Value = " ",
            Variable = " ",
        },
    },
}

---@type VimConfig
local options

---@param opts? VimConfig
function M.setup(opts)
    options = vim.tbl_deep_extend("force", defaults, opts or {})
    if not M.has() then
        require("util").error(
            "**NeoVim** needs **lazy.nvim** version "
                .. M.lazy_version
                .. " to work properly.\n"
                .. "Please upgrade **lazy.nvim**",
            { title = "NeoVim" }
        )
        error("Exiting")
    end

    if vim.fn.argc(-1) == 0 then
        -- autocmds and keymaps can wait to load
        vim.api.nvim_create_autocmd("User", {
            group = vim.api.nvim_create_augroup("NeoVim", { clear = true }),
            pattern = "VeryLazy",
            callback = function()
                M.load("autocmds")
                M.load("keymaps")
            end,
        })
    else
        -- load them now so they affect the opened buffers
        M.load("autocmds")
        M.load("keymaps")
    end
end

---@param range? string
function M.has(range)
    local Semver = require("lazy.manage.semver")
    return Semver.range(range or M.lazy_version):matches(require("lazy.core.config").version or "0.0.0")
end

---@param name "autocmds" | "keymaps"
function M.load(name)
    local Util = require("lazy.core.util")
    local function _load(mod)
        Util.try(function()
            require(mod)
        end, {
            msg = "Failed loading " .. mod,
            on_error = function(msg)
                local info = require("lazy.core.cache").find(mod)
                if info == nil or (type(info) == "table" and #info == 0) then
                    return
                end
                Util.error(msg)
            end,
        })
    end

    if M.defaults[name] then
        _load("config." .. name)
    end

     _load("config." .. name)
    if vim.bo.filetype == "lazy" then
        vim.cmd([[do VimResized]])
    end
end

M.did_init = false
function M.init()
    if not M.did_init then
        M.did_init = true
        -- delay notifications till vim.notify was replaced or after 500ms
        require("util").lazy_notify()
    end
end

setmetatable(M, {
    __index = function(_, key)
        if options == nil then
            return vim.deepcopy(defaults)[key]
        end
        ---@cast options LazyVimConfig
        return options[key]
    end,
})

return M