#!/bin/bash


function init_susano() {
    # Create folder and its conf file, it does not include the session
    if [ ! -d /usr/local/susano ]; then
        mkdir -p /usr/local/susano/metadata
        
        user_ip=$(curl -s ifconfig.me)

        config_template="{
            \"main\": {
                \"subscribed_services\": [],
                \"user_data\": {
                    \"user_ip\": \"$user_ip\",
                    \"user_id\": \"\",
                    \"user_name\": \"\",
                    \"user_email\": \"\"
                }
            }
        }"

        echo "$config_template" > /usr/local/susano/user_susano.conf

        echo "Susano has been inited!"
    else
        echo "Configuration already exists!"
    fi
}


    

