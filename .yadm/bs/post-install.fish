# General post-install

echo Running general post-install scripts...

# install asdf-vm
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
cd $HOME/.asdf
git checkout '(git describe --abbrev=0 --tags)'
set -xg PATH $PATH $HOME/.asdf/bin
cd ~


# install languages with asdf
# install asdf plugins
asdf plugin-add nodejs
asdf plugin-add rust
asdf plugin-add golang
asdf plugin-add ruby
asdf plugin-add python
asdf plugin-add dart

# add required keys
bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring

# grab language versions from file
source $HOME/.yadm/bs/asdf-versions.fish

# install latest versions of all languages
asdf install nodejs $ASDF_NODE_VERSION
asdf install rust $ASDF_RUST_VERSION
asdf install golang $ASDF_GOLANG_VERSION
asdf install ruby $ASDF_RUBY_VERSION
asdf install python $ASDF_PYTHON_VERSION
asdf install dart $ASDF_DART_VERSION

# set global versions
asdf global nodejs $ASDF_NODE_VERSION
asdf global rust $ASDF_RUST_VERSION
asdf global golang $ASDF_GOLANG_VERSION
asdf global ruby $ASDF_RUBY_VERSION
asdf global python $ASDF_PYTHON_VERSION
asdf globall dart $ASDF_DART_VERSION

# add rust bin to path
set -gx PATH $PATH $HOME/.asdf/installs/rust/$ASDF_RUST_VERSION/bin
rustup default stable
# install cargo packages
cargo install ripgrep fd-find skim exa bat ruplacer sd hyperfine

echo Finished general post-install scripts.

