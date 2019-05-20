# general post install

# install asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
cd ~


# install languages with asdf
# install asdf plugins
asdf plugin-add nodejs
asdf plugin-add rust
asdf plugin-add golang
asdf plugin add ruby
asdf plugin-add python
asdf plugin-add dart

# add required keys
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# install latest versions of all languages
asdf install nodejs 12.2.0
asdf install rust 1.34.2
asdf install golang 1.12.5
asdf install ruby 2.6.3
asdf install python 3.7.3
asdf install dart 2.3.0

# install cargo packages
cargo install ripgrep fd-find skim exa bat ruplacer sd hyperfine

