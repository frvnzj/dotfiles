local wezterm = require("wezterm")

local function font_with_fallback(name, params)
  local names = { name, "Noto Color Emoji", "azuki_font" }
  return wezterm.font_with_fallback(names, params)
end

local font_name = "Cascadia Code"
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

local act = wezterm.action

return {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",

  color_scheme = "rose-pine",
  colors = colors,
  window_frame = window_frame, -- needed only if using fancy tab bar

  -- Font config
  font = font_with_fallback(font_name),
  font_rules = {
    {
      italic = true,
      font = font_with_fallback(font_name, { italic = true }),
    },
    {
      italic = false,
      font = font_with_fallback(font_name, { bold = false }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback(font_name, { bold = true }),
    },
  },

  warn_about_missing_glyphs = false,
  font_size = 11,
  line_height = 1.0,
  dpi = 96.0,

  -- Cursor style
  default_cursor_style = "BlinkingUnderline",

  -- X11
  enable_wayland = true,

  -- Keybinds
  disable_default_key_bindings = true,
  keys = {
    {
      key = "o",
      mods = "CTRL|SHIFT",
      action = wezterm.action({
        SplitHorizontal = { domain = "CurrentPaneDomain" },
      }),
    },
    {
      key = "i",
      mods = "CTRL|SHIFT",
      action = wezterm.action({
        SplitVertical = { domain = "CurrentPaneDomain" },
      }),
    },
    {
      key = "q",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
    },
    {
      key = "LeftArrow",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Left" }),
    },
    {
      key = "RightArrow",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Right" }),
    },
    {
      key = "UpArrow",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Up" }),
    },
    {
      key = "DownArrow",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Down" }),
    },
    {
      key = "h",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
    },
    {
      key = "l",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
    },
    {
      key = "k",
      mods = "CTRL|SHIFT|ALT",
      action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
    },
    {
      key = "j",
      mods = "CTRL|SHIFT|ALT",
      action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
    },
    { -- browser-like bindings for tabbing
      key = "t",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
    },
    {
      key = "w",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
    },
    {
      key = "k",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivateTabRelative = 1 }),
    },
    {
      key = "j",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivateTabRelative = -1 }),
    }, -- standard copy/paste bindings
    {
      key = "x",
      mods = "CTRL|SHIFT",
      action = "ActivateCopyMode",
    },
    {
      key = "v",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ PasteFrom = "Clipboard" }),
    },
    {
      key = "c",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
    },
    {
      key = "*",
      mods = "CTRL|SHIFT",
      action = wezterm.action.IncreaseFontSize,
    },
    {
      key = "_",
      mods = "CTRL|SHIFT",
      action = wezterm.action.DecreaseFontSize,
    },
    {
      key = "=",
      mods = "CTRL|SHIFT",
      action = wezterm.action.ResetFontSize,
    },
  },

  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
    {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.Nop,
    },
  },

  hyperlink_rules = {
    {
			regex = [[\b\w+://[\w.-]+\S*\b]],
			format = "$0",
		},
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = '$0',
    }
  },

  -- Aesthetic Night Colorscheme
  bold_brightens_ansi_colors = true,
  -- Padding
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 0,
  },

  initial_cols = 100,
  initial_rows = 25,

  -- Tab Bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- General
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  window_background_opacity = 0.4,
  window_close_confirmation = "NeverPrompt",
}
