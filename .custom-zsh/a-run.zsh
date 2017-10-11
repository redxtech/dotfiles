# Run custom things

# Run ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent > /dev/null
fi

if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval "$(ssh-agent -s)" > /dev/null
fi
