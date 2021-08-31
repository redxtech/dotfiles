-- standard & hotkeys library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- enable hotkeys help widget for vim and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- general awesome keys
awful.keyboard.append_global_keybindings({
  awful.key(
    { modkey,           }, "s",
    hotkeys_popup.show_help,
    {
      description="show help",
      group="awesome",
    }),
    awful.key(
    { modkey,           }, "w",
    function () mymainmenu:show() end,
    {
      description = "show main menu",
      group = "awesome"
    }),
  awful.key(
    { modkey, "Control" }, "r",
      awesome.restart,
    {
      description = "reload awesome",
      group = "awesome"
    }),
  awful.key(
    { modkey, "Shift"   }, "q",
      awesome.quit,
    {
      description = "quit awesome",
      group = "awesome"
    }),
  awful.key(
    { modkey }, "x",
    function ()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {
      description = "lua execute prompt",
      group = "awesome"
    }),
  awful.key(
    { modkey,           }, "Return",
    function () awful.spawn(RC.vars.terminal) end,
    {
      description = "open a terminal",
      group = "launcher"
    }),
  awful.key(
    { modkey,           }, "b", 
      function () awful.spawn(RC.vars.browser) end,
    {
      description = "open a browser",
      group = "launcher"
    }),
  awful.key(
    { modkey },            "r",     
      function () awful.spawn("rofi -show run") end,
    {
      description = "run prompt",
      group = "launcher"
    }),
  awful.key(
    { modkey, "Control" }, "l", 
      function() awful.spawn(RC.vars.home .. "/.config/rofi/powermenu/powermenu.sh") end,
    {
      description = "show power menu",
      group = "awesome"
    }),
  awful.key(
    { modkey }, "p", 
      function() awful.spawn(RC.vars.home .. "/.config/rofi/launchers/misc/launcher.sh") end,
    {
      description = "show application launcher",
      group = "launcher"
    }),
  awful.key(
    { "Control"}, "space", 
      function () awful.spawn("rofi -show combi") end, 
    {
      description = "open rofi launcher in combi mode",
      group = "launcher"
    }),
  awful.key(
    { "Mod1" }, "Tab", 
      function () awful.spawn("rofi -show windowcd") end, 
    {
      description = "open window switcher",
      group = "client"
    }),
  awful.key(
    { "Shift", "Mod1" }, "s", 
      function () awful.spawn(RC.vars.home .. "/.config/rofi/launchers/text/ssh.sh") end, 
    {
      description = "open window switcher",
      group = "client"
    }),
  awful.key(
    { "Shift", "Mod1" }, "m",
      function () awful.spawn(RC.vars.terminal .. " -e " .. RC.vars.home .. "/.zinit/plugins/ClementTsang---bottom/btm") end,
      {
        description = "open resource monitor",
        group = "launcher"
      }),
  awful.key(
    { "Shift", "Mod1" }, "f",
      function () awful.spawn(RC.vars.terminal .. " -e " .. "ranger") end,
      {
        description = "open file browser",
        group = "launcher"
      }),
  awful.key(
    { "Shift", "Mod1" }, "u",
      function () awful.spawn(RC.vars.terminal .. " -e " .. "zsh -c \"pacaur -Syu ; echo Done - Press enter to exit; read\"") end,
      {
        description = "open pacaur -Syu",
        group = "launcher"
      }),
  awful.key(
    { "Shift", "Mod1" }, "/",
      function () awful.spawn("zsh -c \"yadm stash\"") end,
      {
        description = "stash changes",
        group = "dotfiles"
      }),
  awful.key(
    { }, "Print", 
      function () awful.util.spawn("flameshot screen -p " .. RC.vars.home .. "/Pictures/Screenshots", false) end,
    {
      description = "screenshot the current screen",
      group = "screenshot",
    }),
  awful.key(
    { "Shift" }, "Print", 
      function () awful.util.spawn("flameshot gui -p " .. RC.vars.home .. "/Pictures/Screenshots", false) end,
    {
      description = "screenshot with selection tool",
      group = "screenshot"
    }),
  -- media keys
  awful.key({}, "XF86AudioPlay", function() awful.util.spawn("playerctl play-pause", false) end),
  awful.key({}, "XF86AudioNext", function() awful.util.spawn("playerctl next", false) end),
  awful.key({}, "XF86AudioPrev", function() awful.util.spawn("playerctl previous", false) end),
  -- volume keys
  awful.key({}, "XF86AudioLowerVolume", function () awful.util.spawn("amixer -q -D pulse sset Master 5%-", false) end),
  awful.key({}, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer -q -D pulse sset Master 5%+", false) end),
  awful.key({}, "XF86AudioMute",        function () awful.util.spawn("amixer -D pulse set Master 1+ toggle", false) end),
})

