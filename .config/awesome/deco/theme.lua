-- theme handling library
local beautiful = require("beautiful")
local gears = require("gears")

-- initialize themes
-- themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- some theme settings
beautiful.useless_gap = 10
beautiful.border_width = 0

-- set last wallpaper
beautiful.wallpaper = RC.vars.home .. "/.config/wall.png"

screen.connect_signal("request::wallpaper", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)


