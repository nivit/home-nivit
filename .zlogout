ssh-agent -k
SSH_AUTH_SOCK_DIR=$(dirname ${SSH_AUTH_SOCK}) 
if [ -d "${SSH_AUTH_SOCK_DIR}" ]; then
	rm -fR ${SSH_AUTH_SOCK_DIR};
fi
