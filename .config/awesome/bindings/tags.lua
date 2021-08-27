-- tag keybindings

-- standard library
local awful = require("awful")

-- tags related keybindings
awful.keyboard.append_global_keybindings({
  awful.key(
    { modkey,           }, "Left",  
      awful.tag.viewprev,
    {
      description = "view previous",
      group = "tag"
    }),
  awful.key(
    { modkey,           }, "Right",
      awful.tag.viewnext,
    {
      description = "view next",
      group = "tag"
    }),
  awful.key(
    { modkey,           }, "Escape",
      awful.tag.history.restore,
    {
      description = "go back",
      group = "tag"
    }),
})

