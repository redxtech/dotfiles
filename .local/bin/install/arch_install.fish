#! /usr/bin/env fish

source "$HOME/.local/bin/install/arch_helpers/arch_setup.fish"
source "$HOME/.local/bin/install/arch_helpers/pacaur_install.fish"

# function to install dotfiles on arch
function arch_install

    # run the setup function
    arch_setup
    
    # install required deps
    pacaur_install yadm neovim tmux alacritty neofetch ranger
    
end
