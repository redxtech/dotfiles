# Custom profile for redxtech

# Add ssh keys

# allow globs to expand for (#qN) comparing
setopt extendedglob

# if ~/.ssh has any files matching *.pem, add them all.
if [[ -n $HOME/.ssh/*.pem(#qN) ]]; then
	# add all *.pem files, and silence the output.
	ssh-add $HOME/.ssh/*.pem > /dev/null 2>&1
	# if command fails, echo to STDOUT, because prevous command was silenced.
	if [ $? -ne 0 ]; then
    	echo "ssh-adding .pem files failed. check manually."
	fi
fi

# if ~/.ssh has any files matching *_rsa, add them all.
if [[ -n $HOME/.ssh/*_rsa(#qN) ]]; then
	# add all *.pem files, and silence the output.
    ssh-add $HOME/.ssh/*_rsa > /dev/null 2>&1
    # if command fails, echo to STDOUT, because prevous command was silenced.
	if [ $? -ne 0 ]; then
    	echo "ssh-adding _rsa files failed. check manually."
	fi
fi