#!/bin/bash

if [ [ -n "$( which ruby 2>/dev/null )" ] ]; then
    RUBY_BIN = $( cygpath -u $( ruby -e 'puts RbConfig::CONFIG["bindir"]' ) | tr -d '\r' )

    for f in $( find ${RUBY_BIN} -regex ".*bat$"| xargs -n1 basename ); do
        alias ${ f%.bat } = ${ f }
    done
fi

ps -W | awk '/ssh-agent/,NF=1' | xargs kill -f

{ eval `ssh-agent -s`; ssh-add ~/.ssh/*_rsa; } &>/dev/null

cd ~
