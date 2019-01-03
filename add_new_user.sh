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
if [[ "${#}" -eq 0 ]]
then
echo
echo "${0} (USER NAME)....[USER COMMENT]"
echo
exit 1
fi

U_NAME="${1}"
echo "Searching for user"
id -u "${U_NAME}"
if [[ "${?}" = 0 ]]
  then
    echo "User already exists"
    exit 1
fi
shift
R_NAME="${*}"

useradd -c "${R_NAME}" -m "${U_NAME}"

if [[ "${?}" -ne 0 ]]
  then
    echo "The account creation failed"
    exit 1
  else
    echo "Account Created"
    echo
  fi
PASSWORD=$(date +%s%N | sha256sum |head -c10)
echo ${PASSWORD} | passwd --stdin ${U_NAME}
passwd -e ${U_NAME}
echo
echo "Password change required on next login."
echo
echo "${U_NAME}: ${PASSWORD}"
