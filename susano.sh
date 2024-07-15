#!/bin/bash

# Check Arguments

if [ "$1" == "user" ]; then
    # Check User Argument
    if [ "$2" == "session" ]; then
        if [ "$3" == "info" ]; then
            # Check Session Info
        elif [ "$3" == "login" ]; then
            # Login to session
        elif [ "$3" == "logout" ]; then
            # Logout of session
        elif [ "$3" == "register" ]; then
            echo "Enter username"
            read username

            while true; do
                echo "Enter password"
                read -s password

                echo "Repeat password"
                read -s password_repeat

                if [ "$password" == "$password_repeat" ]; then
                    echo "Passwords match."
                    break
                else
                    echo "Passwords do not match. Please try again."
                fi
            done

            echo "Enter email"
            echo email

            echo "Enter you'r country"
            echo country

        fi

    elif [ "$2" == "conf" ]; then

elif [ "$1" == "cvi"]; then
    # Crypto Volatility Index
    if [[ "$2" == "v" ]] || [[ "$2" == "value"]]; then
        # Show the value of CVI
    elif [ "$2" == "subscribe" ]; then
        # Subscribe to CVI and recive notifications and set its conf

    elif [ "$2" == "conf" ]; then
        if [ "$3" == "get" ]; then
            # Get CVI config
        elif [ "$3" == "set" ];
            # Set CVI config
         
    fi

elif [[ "$1" == "fg" ]] || [[ "$1" == "fear_greed" ]]; then
    # Fear an Greed Index
    if [[ "$2" == "v" ]] || [[ "$2" == "value"]]; then
        # Show the last value of fear and greed index
    elif []

