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
  set -l _RUST_PATH $HOME/.asdf/installs/rust/$_RUST_VERSION/bin
  if test -d $_RUST_PATH
    set -gx PATH $PATH $_RUST_PATH
  end
  
  set -l _PYTHON_VERSION (asdf current python | awk '{print $1}')
  set -l _PYTHON_PATH $HOME/.asdf/installs/python/$_PYTHON_VERSION/bin
  if test -d $_PYTHON_PATH
    set -gx PATH $PATH $_PYTHON_PATH
  end
end

