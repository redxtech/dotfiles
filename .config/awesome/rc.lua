-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- standard awesome library
local awful = require("awful")
require("awful.autofocus")

-- global Variables
RC = {}
RC.vars = require("main.user-variables")

-- {{{ Error handling
require("main.error-handling")

-- run startup script
awful.spawn.with_shell("~/.config/awesome/scripts/autorun.sh")

-- {{{ theme setup
require("deco.theme")

-- {{{ menu
require("deco.menubar")
-- }}}

-- {{{ layouts
require("main.layouts")
-- }}}

-- {{{ wibar
require("deco.statusbar")
-- }}}

-- {{{ mouse bindings
require("bindings/mouse")
-- }}}

-- {{{ key bindings

-- global for shorthand
modkey = RC.vars.modkey

-- general awesome keys
require("bindings.general-awesome")

-- tag keybinds
require("bindings.tags")

-- focus bindings
require("bindings.focus")

-- layout related keybindings
require("bindings.layout")

-- global keybinds
require("bindings.global")

-- client bindings
require("bindings.client")

-- }}}

-- {{{ rules
require("main.rules")
-- }}}

-- {{{ titlebars
require("deco.titlebars")
-- }}}

-- {{{ notifications
require("main.notifications")
-- }}}

-- signals
require("main.signals")

