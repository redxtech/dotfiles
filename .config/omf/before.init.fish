# Run custom important things.

# Start up SHH agent.
if test -n "(pgrep -u "$USER" ssh-agent)"
  ssh-agent > /dev/null
end

if test -z "$SSH_AGENT_PID"
  #eval (ssh-agent -s) > /dev/null
  eval (ssh-agent -c | sed 's/^echo/#echo/; s/setenv/set -gx/')
end

set -gx SSH_KEY_PATH "~/.ssh/rsa_id"

# add ssh keys

set -l pem $HOME/.ssh/*.pem
set -l rsa $HOME/.ssh/*_rsa

# if ~/.ssh has any files matching *.pem, add them all.
if test (count $pem) -gt 0 
  # add all *.pem files, and silence the output.
  ssh-add $HOME/.ssh/*.pem > /dev/null 2>&1
  # if command fails, echo to STDOUT, because prevous command was silenced.
  set -l exit_code $status
  if test $exit_code -ne 0
    echo "ssh-adding .pem files failed. check manually."
  end
end

# if ~/.ssh has any files matching *_rsa, add them all.
if test (count $rsa) -gt 0
  # add all *_rsa files, and silence the output.
  ssh-add $HOME/.ssh/*_rsa > /dev/null 2>&1
  # if command fails, echo to STDOUT, because prevous command was silenced.
  set -l exit_code $status
  if test $exit_code -ne 0
    echo "ssh-adding _rsa files failed. check manually."
  end
end

## TODO: add thefuck
