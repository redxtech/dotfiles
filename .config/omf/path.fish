set -l yarn_path "$HOME/.config/yarn/global/node_modules/.bin"
set -l opam_path "$HOME/.opam/system/bin"
set -l cargo_path "$HOME/.cargo/bin"
set -l python_path "$HOME/.asdf/installs/python"
set -l rust_path "$HOME/.asdf/installs/rust"
set -l scripts_path "$HOME/Documents/scripts/bin"
set -l local_bin_path "$HOME/.local/bin"

if test -d $yarn_path; and ! contains $yarn_path $PATH
  set -gx PATH $PATH $yarn_path
end

if test -d $opam_path; and ! contains $opam_path $PATH
  set -gx PATH $PATH $opam_path
end

if test -d $cargo_path; and ! contains $cargo_path $PATH
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

if test -d $scripts_path; and ! contains $scripts_path $PATH
    set -gx PATH $PATH $scripts_path
end

if test -d $local_bin_path; and ! contains $local_bin_path $PATH
    set -gx PATH $PATH $local_bin_path
    for bin_path in (string split ' ' (du $local_bin_path | cut -f2 | tr '\n' ' ' | awk '{$1=$1}1'))
        set -gx PATH $PATH $bin_path
    end
end

