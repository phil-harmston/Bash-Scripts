#!/bin/bash

# Display the UID and username of user executing the this script.
# Display if the user is the root user or not.

# Display the UID
echo "Your UID is ${UID}"

# Display the Username
USER_NAME=$(id -un)
echo "Your user name is ${USER_NAME}"

# Display if the user is the root user or not.
if [[ "${UID}" -eq 0 ]]
then
	echo "You are root"
else
	echo "You are not root"
fi


