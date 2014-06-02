SSH_AUTH_SOCK_DIR=$(dirname ${SSH_AUTH_SOCK}) 
if [ -d "${SSH_AUTH_SOCK_DIR}" ]; then
	rm -R ${SSH_AUTH_SOCK_DIR};
fi
