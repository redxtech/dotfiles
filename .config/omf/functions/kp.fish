# function to kill a process found with fzf
function kp -d "kill processes found with fzf"

    # make sure fzf is installed
    if ! type -q fzf
        echo "error: fzf not installed"
        return 1
    end

    # find process and kill it
    set -l __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
    set -l __kp__kc $argv[1]

    if test "x$__kp__pid" != "x"
        if test "x$argv[1]" != "x"
            echo $__kp__pid | xargs kill $argv[1]
        else
            echo $__kp__pid | xargs kill -9
        end
        kp
    end
end

