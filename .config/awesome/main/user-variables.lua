-- Global Variable Definitions

local home = os.getenv("HOME")
local terminal = "kitty"
local editor = "nvim"


-- first entry is default modkey.
-- usually, Mod4 is the key with a logo between Control and Alt.
-- if you do not like this or do not have such a key,
-- i suggest you to remap Mod4 to another key using xmodmap or other tools.
-- however, you can use another modifier like Mod1, but it may interact with others.

local _M = {
  modkey        = "Mod4",
  home          = home,
  terminal      = terminal,
  editor        = editor,
  editor_cmd    = terminal .. " -e " .. editor,
  browser       = "vivaldi-stable",
  wallpaper     = home .. "/.config/wall.png",
}

return _M

