if test -d $HOME/.config/yarn/global/node_modules/.bin
  set -gx PATH $PATH $HOME/.config/yarn/global/node_modules/.bin
end

if test -d $HOME/.opam/system/bin
  set -gx PATH $PATH $HOME/.opam/system/bin
end

if test -d $HOME/.cargo/bin
  set -gx PATH $PATH $HOME/.cargo/bin
end

if type -q asdf
  set -l _RUST_VERSION (asdf current rust | awk '{print $1}')
  if test -d $_RUST_PATH
    set -gx PATH $PATH $HOME/.asdf/installs/rust/$_RUST_VERSION/bin
  else
    echo nopers
  end
end

