-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 25
-- This is where you actually apply your config choices

config.use_fancy_tab_bar = true
config.window_frame = {
   -- The font used in the tab bar.
   -- Roboto Bold is the default; this font is bundled
   -- with wezterm.
   -- Whatever font is selected here, it will have the
   -- main font setting appended to it to pick up any
   -- fallback fonts you may have used there.
   font = wezterm.font { family = 'Roboto', weight = 'Bold' },

   -- The size of the font in the tab bar.
   -- Default to 10.0 on Windows but 12.0 on other systems
   font_size = 20.0,

   -- The overall background color of the tab bar when
   -- the window is focused
   active_titlebar_bg = '#0b0b14',

   -- The overall background color of the tab bar when
   -- the window is not focused
   inactive_titlebar_bg = '#0b0b14',
}

config.colors = {
   tab_bar = {
      -- The color of the inactive tab bar edge/divider
      inactive_tab_edge = '#575757',
   },
}
config.window_padding = {
   left = 5,
   right = 2,
   top = 2,
   bottom = 0,
}
config.native_macos_fullscreen_mode = false
-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'
-- config.use_ime = true
-- config.disable_default_key_bindings = true
config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.colors = {
   scrollbar_thumb = 'white',
}
local dimmer = { brightness = 0.1 }
config.background = {
   {
      source = {
         File = '/Users/s.o.i./wezterm_background/tokyonight4.png',
      },
      -- The texture tiles vertically but not horizontally.
      -- When we repeat it, mirror it so that it appears "more seamless".
      -- An alternative to this is to set `width = "100%"` and have
      -- it stretch across the display
      repeat_x = 'Mirror',
      hsb = dimmer,
      -- When the viewport scrolls, move this layer 10% of the number of
      -- pixels moved by the main viewport. This makes it appear to be
      -- further behind the text.
      attachment = { Parallax = 0.1 },
   },
}
config.keys = {
   {key="n", mods="OPT", action=wezterm.action{SendString="~"}},
   {key="9", mods="OPT", action=wezterm.action{SendString="}"}},
   {key="8", mods="OPT", action=wezterm.action{SendString="{"}},
   {key="7", mods="OPT", action=wezterm.action{SendString="|"}},
   {key="6", mods="OPT", action=wezterm.action{SendString="]"}},
   {key="5", mods="OPT", action=wezterm.action{SendString="["}},
   {key="4", mods="OPT", action=wezterm.action{SendString="Ç"}},
   {key="3", mods="OPT", action=wezterm.action{SendString="#"}},
   {key="2", mods="OPT", action=wezterm.action{SendString="“"}},
   {key="1", mods="OPT", action=wezterm.action{SendString="±"}},
   {key="/", mods="SHIFT|ALT", action=wezterm.action({ SendString = "\\" }) },
   {key="g", mods="OPT", action=wezterm.action({ SendString = "@" }) },
   -- {key="7", mods="SHIFT|OPT", action=wezterm.action{SendString="\\"}},
}

wezterm.on('user-var-changed', function(window, pane, name, value)
   local overrides = window:get_config_overrides() or {}
   if name == "ZEN_MODE" then
      local incremental = value:find("+")
      local number_value = tonumber(value)
      if incremental ~= nil then
         while (number_value > 0) do
            window:perform_action(wezterm.action.IncreaseFontSize, pane)
            number_value = number_value - 1
         end
         overrides.enable_tab_bar = false
      elseif number_value < 0 then
         window:perform_action(wezterm.action.ResetFontSize, pane)
         overrides.font_size = nil
         overrides.enable_tab_bar = true
      else
         overrides.font_size = number_value
         overrides.enable_tab_bar = false
      end
   end
   window:set_config_overrides(overrides)
end)
-- and finally, return the configuration to wezterm
return config
