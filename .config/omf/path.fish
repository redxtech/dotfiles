if test -d $HOME/.config/yarn/global/node_modules/.bin
  set -gx PATH $PATH $HOME/.config/yarn/global/node_modules/.bin
end

if test -d $HOME/.opam/system/bin
  set -gx PATH $PATH $HOME/.opam/system/bin
end

if test -d $HOME/.rvm/bin
  set -gx PATH $PATH $HOME/.rvm/bin
end

if test -d $HOME/.cargo/bin
 set -gx PATH $PATH $HOME/.cargo/bin
end