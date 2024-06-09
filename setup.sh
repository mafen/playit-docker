#!/bin/bash
# If /etc/playit does not contain a file run playit setup

secret_path="/etc/playit/playit.toml"

if [ ! -f ${secret_path} ]; then
    echo "Playit is not setup. Running setup..."
    playit -s setup

else
    echo "Playit Agent is already setup. Starting agent, please wait."
    playit --secret_path=${secret_path}
fi
