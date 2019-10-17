# function to attack or create tmux sessions based on context
function tat -d "attach or create tmux session named the same as current directory"
    # save the currect directory to be made into a session name
    set -lx session_name (basename "$PWD" | tr . -)

    # if the TMUX variable isn't set, make a new session
    if test -z "$TMUX"
        tmux new-session -As "$session_name"
    # otherwise test if a session already exists with the same name
    else
        # if a session with the same name exists, attach to it
        if tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$session_name\$"
            tmux switch-client -t "$session_name"
        # otherwise create a new sessions
        else
            tmux new-session -Ad -s "$session_name"
        end
    end
end
