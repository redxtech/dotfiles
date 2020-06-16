#! /usr/bin/env fish

# TODO: convert to pure sh

source "$HOME/.local/bin/install/arch/arch_setup.fish"
source "$HOME/.local/bin/install/arch/pacaur_install.fish"

# function to install dotfiles on arch
function arch_install

    # run the setup function
    arch_setup
    
    # install required deps
    pacaur_install yadm neovim tmux alacritty neofetch ranger
    
end
