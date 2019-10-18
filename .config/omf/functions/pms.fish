# function to manage plex media server operations
function pms -d "manage custom plex media server"

    # exit if the pms service file doesn't exist
    if ! test -f "/usr/lib/systemd/system/pms.service"
        echo "error: pms not found"
        return 1
    end

    # make sure $args exits and has exactly one element
    if test -z "$argv"
        sudo systemctl status pms
        return $status
    else if test (count $argv) -ne 1
        echo "error: specify only one operation"
        return 1
    end

    # run the specified systemctl command for pms
    switch $argv
        case start up
            sudo systemctl start pms
        case restart rs
            sudo systemctl restart pms
        case stop down dn
            sudo systemctl stop pms
        case status
            sudo systemctl status pms
        case enable setup
            sudo systemctl --now enable pms
        case disable remove
            sudo systemctl --now disable pms
        case '*'
            echo "error: that operation doesn't exist"
            return 1
    end
end

