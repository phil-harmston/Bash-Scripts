#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password

USERID=${UID}
HOSTNAME=$(hostname -b)
IPADDRESS=$(hostname -I)

if [[ ${USERID} != 0 ]]
then
echo " "
echo "You need to be root to run this script"
echo "  "
exit 1
fi

# Ask for the user name.
read -p "Enter the username to create: " U_NAME
echo " "
echo "Searching for user"
id -u "${U_NAME}"
if [[ "${?}" = 0 ]]
then
echo "User already exists"
exit 1
fi
# Ask for the real name
read -p "Enter the name of the person who this account is for: " R_NAME


# Ask for the passord

read -p "Enter the password account ${U_NAME}: " PASSWORD
read -p "Enter the password again for the account ${U_NAME}: " PASSWORD1


# Compare the passwords to see if they are the same
if [[ ${PASSWORD} = ${PASSWORD1} ]]
then 
# Create the account

useradd -c "${R_NAME}" -m ${U_NAME}
echo ${PASSWORD} | passwd --stdin ${U_NAME}
echo " "
echo "Password force change on next login"
passwd -e ${U_NAME}
else 
echo "Passwords do not match account not created."
exit 1
fi

read -p "Do you want to right this to a file?  For security sake not recommended...(y/n) " YES
if [[ ${YES} == "y" ]]
then
echo ""${U_NAME}", "${PASSWORD}", "${HOSTNAME}", @ "${IPADDRESS}"" | cat >> ${U_NAME}.txt 
echo "File written"
exit 0
else
echo "Write failed"
exit 1
fi



# ask if user needs to be member of sudo group







