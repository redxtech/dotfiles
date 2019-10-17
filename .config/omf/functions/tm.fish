# function to start tmux if not already started
function tm -d "run tmux if not already running"
    if test -z "$TMUX"
        tat
    end
end

