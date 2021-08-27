-- standard library
local awful = require("awful")
local ruled = require("ruled")

-- rules to apply to new clients
ruled.client.connect_signal("request::rules", function()
  -- all clients will match this rule.
  ruled.client.append_rule {
    id         = "global",
    rule       = { },
    properties = {
      focus     = awful.client.focus.filter,
      raise     = true,
      screen    = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  }

  -- floating clients.
  ruled.client.append_rule {
    id       = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class    = {
        "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
        "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
      },
      -- note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name    = {
        "Event Tester",  -- xev.
      },
      role    = {
        "AlarmWindow",    -- thunderbird's calendar.
        "ConfigManager",  -- thunderbird's about:config.
        "pop-up",         -- e.g. google chrome's (detached) developer tools.
      }
    },
    properties = { floating = true }
  }

  -- add titlebars to normal clients and dialogs
  ruled.client.append_rule {
    id         = "titlebars",
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false      }
  }

  -- set firefox to always map on the tag named "2" on screen 1.
  -- ruled.client.append_rule {
    -- rule       = { class = "Firefox"     },
    -- properties = { screen = 1, tag = "2" }
  -- }
end)
