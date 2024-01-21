return {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      diagnostics = {
        globals = { "vim", "spec" },
      },
      runtime = {
        version = "LuaJIT",
        special = {
          spec = "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
            hint = {
                enable = false,
                arrayIndex = "Disable",
                await = true,
                paramName = "Disable",
                paramType = true,
                semicolon = "All",
                setType = false
            },
      telemetry = {
        enable = false,
      },
    },
  },
}
