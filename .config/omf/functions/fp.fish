# function to search path with fzf & rg
function fp -d "search your path with fzf & rg"

    # make sure fzf & rg are installed
    if ! type -q fzf
        echo "error: fzf not installed"
        return 1
    else if ! type rg
        echo "error: rg not installed"
        return 1
    end

    # save currently selected path as a variable
    set -l loc (echo $PATH | tr ' ' '\n' | eval "fzf $FZF_DEFAULT_OPTS --header='[find:path]'")

    # recursively search path
    if test (count $loc) = 1
        set -l cmd (rg --files $loc | rev | cut -d'/' -f1 | rev | tr ' ' '\n' | eval "fzf $FZF_DEFAULT_OPTS --header='[find:exe] => $loc'")
        if test (count $cmd) = 1
            echo $cmd
        else
            fp
        end
    end
end

