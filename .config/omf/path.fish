set -l yarn_path "$HOME/.config/yarn/global/node_modules/.bin"
set -l opam_path "$HOME/.opam/system/bin"
set -l cargo_path "$HOME/.cargo/bin"
set -l python_path "$HOME/.asdf/installs/python"
set -l rust_path "$HOME/.asdf/installs/rust"

# echo $PATH | sed -E 's/ /\n/g'

if test -d $yarn_path; and ! contains $yarn_path $PATH
  set -gx PATH $PATH $yarn_path
end

if test -d $opam_path; and ! contains $opam_path $PATH
  set -gx PATH $PATH $opam_path
end

if test -d $cargo_path; and ! contains $cargo_path 
  set -gx PATH $PATH $cargo_path
end

if type -q asdf
  set -l rust_version (asdf current rust | awk '{print $1}')
  set -l rust_bin_path "$rust_path/$rust_version/bin"
  if test -d $rust_bin_path; and ! contains $rust_bin_path $PATH
    set -gx PATH $PATH $rust_bin_path
  end
  
  set -l python_version (asdf current python | awk '{print $1}')
  set -l python_bin_path "$python_path/$python_version/bin"
  if test -d $python_bin_path; and ! contains $python_bin_path $PATH
    set -gx PATH $PATH $python_bin_path
  end
end

