function read_desktop
  while true
    read -l -P 'Is this a desktop (as opposed to a server)? [y/N] ' confirm
    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

function read_main
  while true
    read -l -P 'Is this your main computer? [y/N] ' confirm
    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

