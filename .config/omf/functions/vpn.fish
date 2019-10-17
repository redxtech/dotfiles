# function to manage vpn connections
function vpn -d "manage vpn connections"

    # exit if nordvpn isn't installed
    if ! type -q nordvpn
        echo "error: nordvpn not installed"
        return 1
    end

    # run the specified systemctl command for vpn
    switch $argv
        case start up
            # sudo systemctl start vpn
        case restart rs
            # sudo systemctl restart vpn
        case stop down dn
            # sudo systemctl stop vpn
        case status
            # sudo systemctl status vpn
        case enable setup
            # sudo systemctl --now enable vpn
        case disable remove
            # sudo systemctl --now disable vpn
        case '*'
            echo "error: that operation doesn't exist"
            return 1
    end
end

