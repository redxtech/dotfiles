# Alias yup to run yadd and pass args
function yup --wraps yadd
  # run yadd and pass args
  yadd $argv
end
