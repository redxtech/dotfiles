# function to read package.json, and yarn add all of the packages
function yadd -d "reads package.json and yarn adds the latest version"
  # initialize some variables
  set -lx scope ".dependencies"
  set -lx install_command "yarn add"

  # parse -d, -n, --dev, & --npm as arguments
  argparse 'd/dev' 'n/npm' -- $argv

  # test if -d or --dev flag is set, and set scope accordingly
  if test -n "$_flag_d"; or test -n "$_flag_dev"
    set scope ".devDependencies"
  end

  # test if -n or --npm flag is set, and set install_command accordingly
  if test -n "$_flag_n"; or test -n "$_flag_npm"
    set install_command "npm install"
  end

  # grab deps from package.json
  set -l deps (jq "$scope | keys | map(\" \"+.) | add" ./package.json | rg "\"" --replace "")

  # set command to run
  set -l command_to_run "$install_command$deps"
  
  echo "Command: $command_to_run"

  # run either yarn add or npm install
  if test -n "$_flag_n"; or test -n "$_flag_npm"
    #(npm install $deps)
    echo "npm install $deps" | fish
  else
    #(yarn add $deps)
    echo "yarn add $deps" | fish
  end

  #($command_to_run)
end
