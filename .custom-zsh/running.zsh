# Run custom things

# Run ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(ssh-agent -s)"
fi

# thefuck
if [ xhost >& /dev/null ]; then
	#eval $(thefuck --alias --enable-experimental-instant-mode)
fi
