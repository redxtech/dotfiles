# function to read package.json, and yarn add all of the packages
function yadd -d "reads package.json and yarn adds the latest version"
  # test for available packages
  set -l _missing_yarn false
  set -l _missing_npm false

  if test -z "(yarn)"
    set _missing_yarn true
  end

  if test -z "(npm)"
    set _missing_npm true
  end

   if $_missing_yarn; and $_missing_npm
    echo "No package manager installed. Install either npm or yarn."
    return 1
  end

  if test -z "(jq)"
    echo "JQ is either not installed or not in \$PATH. Install it or add it to \$PATH."
    return 1
  end

  # test that there is a package.json file in the current directory
  if not test -e ./package.json
    echo "No package.json file was found in the current directory."
    return 1
  end

  # initialize some variables
  set -lx scope "dependencies"
  set -lx install_command "yarn add"
  set -lx command_options ""

  # parse -d, -n, --dev, & --npm as arguments
  argparse 'd/dev' 'n/npm' -- $argv

  # echo "args: $argv"

  # test if -d or --dev flag is set, and set scope accordingly
  # also set command_options to -D if dev is specified
  if test -n "$_flag_dev";
    set scope "devDependencies"
    set command_options " -D"
  end

  # test if -n or --npm flag is set, and set install_command accordingly
  if test -n "$_flag_npm"; or $_missing_yarn
    if $_missing_npm
      echo "NPM specied, but is missing. Install NPM and add it to path to use it."
      set install_command "yarn add"
    else
      set install_command "npm install"
    end
  end

  # grab deps from package.json
  set -l deps (jq "{$scope: {}}+.|.$scope+{}|keys|map(\" \"+.)+[\"\"]|add" ./package.json)
  set -l stripped (echo $deps | sed "s/\"//g")

  # set command to run
  set -l command_to_run "$install_command$command_options$stripped"
  # echo "Command: $command_to_run $argv"

  # return 0
  
  # run either yarn add or npm install
  echo "$install_command$stripped $argv" | fish
end
