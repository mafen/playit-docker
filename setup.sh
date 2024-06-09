#!/bin/bash
# If /etc/playit does not contain a file run playit setup

playit_secret_path="/etc/playit/playit.toml"
playit_agent="PLAYIT.GG agent"


if [ ! -f ${PLAYIT_SECRET}  ]; then
    echo "${playit_agent} is setup with env secret. Starting ${playit_agent}, please wait..."
    playit --secret ${PLAYIT_SECRET}

elif [ ! -f ${playit_secret_path} ]; then
    echo "${playit_agent} is not setup. Running setup..."
    playit -s setup

else
    echo "${playit_agent} is already setup. Starting ${playit_agent}, please wait..."
    playit --secret_path=${playit_secret_path}
fi
