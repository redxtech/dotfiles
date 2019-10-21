# function to handle configuration file opening
function conf -d "open configuration file"

    # make sure $args exits and has exactly one element
    if test -z "$argv"
        echo "error: specify a config"
        return 1
    else if test (count $argv) -ne 1
        echo "error: specify only one config"
        return 1
    end

    # open the specified config file with $EDITOR
    switch $argv
        case v vim nvim vimrc vi # vim
            $EDITOR "$HOME/.config/nvim/init.vim"
        case vm # vim maps
            $EDITOR "$HOME/.config/nvim/maps.vim"
        case vp # vim plugs
            $EDITOR "$HOME/.config/nvim/plugs.vim" 
    	case o omf oi # omf (init)
            $EDITOR "$HOME/.config/omf/init.fish"
    	case oa # omf aliases
            $EDITOR "$HOME/.config/omf/aliases.fish"
    	case oaa # omf abbreviations
            $EDITOR "$HOME/.config/omf/abbreviations.fish"
    	case ob # omf before init
            $EDITOR "$HOME/.config/omf/before.init.fish"
    	case oe # omf env
            $EDITOR "$HOME/.config/omf/env.fish"
    	case op # omf path
            $EDITOR "$HOME/.config/omf/path.fish"
    	case t tmux # tmux
            $EDITOR "$HOME/.tmux.conf"
    	case i i3 # i3
            $EDITOR "$HOME/.config/i3/config"
    	case p polybar poly # polybar
            $EDITOR "$HOME/.config/polybar/config"
    	case pl # polybar launch
            $EDITOR "$HOME/.config/polybar/launch.sh"
    	case r ranger  # ranger
            $EDITOR "$HOME/.config/ranger/rc.conf"
    	case rr # ranger rifle
            $EDITOR "$HOME/.config/ranger/rifle.conf"
    	case rs # ranger scope
            $EDITOR "$HOME/.config/ranger/scope.sh"
        case a alacritty # alacritty
            $EDITOR "$HOME/.config/alacritty/alacritty.yml"
        case s sxhkd
            $EDITOR "$HOME/.config/sxhkd/sxhkdrc"
        case '*'
            echo "error: that config doesn't exist"
            return 1
    end
end

