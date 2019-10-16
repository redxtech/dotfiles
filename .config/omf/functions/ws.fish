# function to manage nginx webserver daemon operations
function ws -d "manage nginx webserver daemon"

    # exit if the nginx command doesn't exist
    if ! type -q nginx
        echo "error: nginx command not found"
        return 1
    end

    # make sure $args exits and has exactly one element
    if test -z "$argv"
        sudo systemctl status nginx
    else if test (count $argv) -ne 1
        echo "error: specify only one operation"
        return 1
    end

    # run the specified systemctl command for nginx
    switch $argv
        case start up
            sudo systemctl start nginx
        case restart rs
            sudo systemctl restart nginx
        case stop down dn
            sudo systemctl stop nginx
        case status info
            sudo systemctl status nginx
        case enable setup
            sudo systemctl --now enable nginx
        case disable remove
            sudo systemctl --now disable nginx
        case test t
            sudo nginx -t
        case '*'
            echo "error: that operation doesn't exist"
    end
end

