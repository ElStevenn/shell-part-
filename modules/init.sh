#!/bin/bash

function init_susano() {
    # Create folder and its conf file, it does not include the session
    if [ ! -d /usr/local/susano ]; then
        sudo mkdir -p /usr/local/susano/metadata 
        
        user_ip=$(curl -s ifconfig.me)

        config_template=$(cat <<EOF
{
    "main": {
        "subscribed_services": [],
        "user_data": {
            "user_ip": "$user_ip",
            "user_id": "",
            "user_name": "",
            "user_email": ""
        }
    }
}
EOF
        )
        
        echo "$config_template" | sudo tee /usr/local/susano/user_susano.conf > /dev/null

        echo "Susano has been initialized!"
    else
        echo "Configuration already exists!"
    fi
}

