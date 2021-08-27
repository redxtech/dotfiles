-- standard, notification, & rule libraries
local awful = require("awful")
local naughty = require("naughty")
local ruled = require("ruled")

-- set notification window rules
ruled.notification.connect_signal('request::rules', function()
  -- all notifications will match this rule.
  ruled.notification.append_rule {
    rule       = { },
    properties = {
      screen           = awful.screen.preferred,
      implicit_timeout = 5,
    }
  }
end)

-- gotta find out what this does exactly
naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n }
end)

