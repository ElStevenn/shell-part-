#!/bin/bash




function init_susano() {
    # Create folder and its conf file
    if [ ! -d /usr/local/susano ]; then
        mkdir -p /usr/local/susano/metadata
        
        touch /usr/local/susano/user_susano.conf

    

    else
        echo "Configuration already exists!"
    fi
}

    

