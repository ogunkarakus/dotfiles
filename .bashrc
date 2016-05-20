#!/bin/bash

if [ "$( uname -o )" != "Cygwin" ]; then
    ps -W | awk '/ssh-agent/,NF=1' | xargs kill -f

    { eval `ssh-agent -s`; ssh-add ~/.ssh/*_rsa; } &>/dev/null
fi;

cd ~
