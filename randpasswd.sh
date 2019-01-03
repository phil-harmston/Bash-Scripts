#!/bin/bash
echo "A Random number as a PASSWORD"
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

echo "Three random numbers together"
PASSWORD=${RANDOM}${RANDOM}${RANDOM}
echo "${PASSWORD}"

echo "Use the current date/time as the basis for a PASSWORD"
PASSWORD=$(date +%s)
echo "${PASSWORD}"

echo "Use nanoseconds to act as randomization."
PASSWORD="$(date +%s%N)"
echo "${PASSWORD}"

echo "A better PASSWORD"
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo ${PASSWORD}

echo "an even better PASSWORD"
PASSWORD=$(date +%s%N{RANDOM}{RANDOM} |sha256sum | head -c48)
echo "${PASSWORD}"

echo "Append a special character to the PASSWORD"
SPECIAL=$(echo '!@#$%^&*()_+=-' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL}"
