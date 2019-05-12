# general post install

# install asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
cd ~

# install languages with asdf
# TODO: ^
# node, ruby, python, go, dart, elixir, crystal, rust
