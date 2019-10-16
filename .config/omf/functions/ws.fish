# function to handle webserver operations
function ws -d "manage webserver"

    # exit if the nginx command doesn't exist
    if ! type -q nginx
        echo "nginx not found"
        return 1
    end

    # set up arguments: restart|rs, start|up, stop|down|dn, status
    if test "$argv" = "restart" -o "$argv" = "rs"
        sudo systemctl restart nginx
    else if test "$argv" = "start" -o "$argv" = "up"
        sudo systemctl start nginx
    else if test "$argv" = "stop" -o "$argv" = "down" -o "$argv" = "dn"
        sudo systemctl stop nginx
    else
        sudo systemctl status nginx
    end
end
