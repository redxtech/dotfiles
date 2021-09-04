---------------------------
-- My awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi
local rnotification = require("ruled.notification")
local naughty = require("naughty")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = dofile(themes_path .. "default/theme.lua")

-- colors
theme.clr = {
    purple      = "#c792ea",
    blue        = "#82aaff",
    green       = "#7cd380",
    red         = "#ff5370",
    gray        = "#8796b0",
    yellow      = "#ffcb8b",
    pink        = "#FF68C4",
    white       = "#8dd1de",
    cyan        = "#88c0d0",
    orange      = "#ffbd2e",
    black       = "#000000",
    dark_gray   = "#424760",
    pure_white  = "#ffffff"
}

-- fonts
local font = "Inter Nerd Font"
theme.font              = font .. " 10"
theme.icon_font         = font .. " 14"
theme.taglist_font      = font .. " 14"
theme.widget_font       = font .. " 10"
theme.notification_font = font .. " 10"
theme.tasklist_font     = font .. " 10"

-- forground colours
-- theme.fg_normal         = "#424760"
-- theme.fg_focus          = '#a6accd'
-- theme.fg_urgent         = '#424760'

-- background colours
theme.bg_normal         = "#1e222a"
theme.bg_focus          = "#121622"
theme.bg_urgent         = "#081218"
theme.bg_light          = "#2c3038"
theme.bg_minimize       = theme.bg_light
theme.bg_systray        = theme.bg_light

-- taglist colours
theme.taglist_fg_focus  = theme.clr.green
theme.taglist_fg_occupied = theme.clr.pure_white
theme.taglist_fg_empty  = theme.clr.dark_gray
theme.taglist_fg_urgent = theme.clr.red
theme.taglist_bg_focus  = theme.bg_light
theme.taglist_bg_urgent = theme.bg_normal

-- tasklist config stuff
theme.tasklist_bg_normal = '#181828'
theme.tasklist_bg_focus = '#1f1f2f'
theme.tasklist_bg_urgent = '#1b1b2b'
-- theme.tasklist_plain_task_name = false
-- theme.tasklist_disable_icon = false

-- gaps & borders
theme.useless_gap       = dpi(10)
theme.gap_single_client = true
theme.border_width      = dpi(2)
theme.border_normal     = theme.clr.black
theme.border_focus      = theme.clr.cyan
theme.border_marked     = theme.clr.red

-- notifications
theme.notification_fg   = "#a6accd"
theme.notification_bg   = "#121622"
theme.notification_opacity = 0.8
theme.notification_border_color = theme.clr.cyan

naughty.config.padding = dpi(8)
naughty.config.defaults = {
    timeout = 5,
    text = "",
    ontop = true,
    position = "top_right",
    margin = dpi(10),
}

-- set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = {
            urgency = 'critical'
        },
        properties = {
            bg = theme.clr.red, 
            fg = theme.clr.pure_white
        }
    }
end)

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = themes_path.."default/submenu.png"
-- theme.menu_height = dpi(15)
-- theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
-- theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
-- theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"
--
-- theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
-- theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"
--
-- theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
-- theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
-- theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
-- theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"
--
-- theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"
--
-- theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
-- theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"
--
-- theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
-- theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
-- theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
-- theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"
--
-- theme.wallpaper = themes_path.."default/background.png"

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
    -- theme.menu_height, theme.bg_focus, theme.fg_focus
-- )

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil


return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
