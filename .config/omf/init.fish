if test -e $OMF_CONFIG/env.fish
  source $OMF_CONFIG/env.fish
end

if test -e $OMF_CONFIG/path.fish
  source $OMF_CONFIG/path.fish
end

if test -e $OMF_CONFIG/aliases.fish
  source $OMF_CONFIG/aliases.fish
end

if test -e $OMF_CONFIG/prof.fish
  source $OMF_CONFIG/prof.fish
end

if test -e $HOME/.asdf/asdf.fish
  source $HOME/.asdf/asdf.fish
end
