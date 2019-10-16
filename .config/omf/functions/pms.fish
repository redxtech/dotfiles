# function to handle plex media server operations
function pms -d "manage plex media server"

    # exit if the pms service file doesn't exist
    if ! test -f "/usr/lib/systemd/system/pms.service"
        echo "pms not found"
        return 1
    end

    # set up arguments: restart|rs, start|up, stop|down|dn, status
    if test "$argv" = "restart" -o "$argv" = "rs"
        sudo systemctl restart pms
    else if test "$argv" = "start" -o "$argv" = "up"
        sudo systemctl start pms
    else if test "$argv" = "stop" -o "$argv" = "down" -o "$argv" = "dn"
        sudo systemctl stop pms
    else
        sudo systemctl status pms
    end
end
