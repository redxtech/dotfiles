-- standard, widget and layout, & theme libraries
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- create a launcher widget and a main menu
-- TODO: add stuff to the main menu
myawesomemenu = {
 { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
 { "manual",      RC.vars.terminal .. " -e man awesome" },
 { "edit config", RC.vars.editor_cmd .. " " .. awesome.conffile },
 { "restart",     awesome.restart },
 { "quit",        function() awesome.quit() end },
}

mymainmenu = awful.menu({
  items = {
    { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", RC.vars.terminal }
  }
})

-- create a launcher widget
mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mymainmenu
})

-- create a textclock widget
mytextclock = wibox.widget.textclock()

-- stuff
screen.connect_signal("request::desktop_decoration", function(s)
  -- each screen has its own tag table
  -- TODO: do something fun with tag names
  -- awful.tag({ ">_", "www", "...", "</>", "~/", "#", "?" }, s, awful.layout.layouts[1])
  awful.tag({ '', '', '', '', '', '', '', '', '' }, s, awful.layout.layouts[1])

  -- create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- create an imagebox widget which will contain an icon indicating which layout we're using.
  -- we need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen  = s,
    buttons = {
      awful.button({ }, 1, function () awful.layout.inc( 1) end),
      awful.button({ }, 3, function () awful.layout.inc(-1) end),
      awful.button({ }, 4, function () awful.layout.inc(-1) end),
      awful.button({ }, 5, function () awful.layout.inc( 1) end),
    }
  }

  -- create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({ }, 1, function(t) t:view_only() end),
      awful.button({ modkey }, 1,
        function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3,
        function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end),
      awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
      awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
    }
  }

  -- create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({ }, 1, function (c)
        c:activate { context = "tasklist", action = "toggle_minimization" }
      end),
      awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
      awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
      awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
    }
  }

  -- create the wibox
  s.mywibox = awful.wibar({ 
    position = "top",
    screen = s,
    height = 30
  })

  -- add widgets to the wibox
  s.mywibox.widget = {
    layout = wibox.layout.align.horizontal,
    { -- left widgets
      layout = wibox.layout.fixed.horizontal,
      mylauncher,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- middle widget
    { -- right widgets
      layout = wibox.layout.fixed.horizontal,
      spacing = 10,
      wibox.widget.systray(),
      mytextclock,
      s.mylayoutbox,
    },
  }
end)

