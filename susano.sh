#!/bin/bash

source ./modules/init.sh
source ./modules/user_handle.sh
source ./modules/cvi.sh
source ./modules/fear_greed.sh

# Check Arguments

if [ "$1" == "user" ]; then
    # Check User Argument
    if [ "$2" == "session" ]; then
        if [ "$3" == "session" ]; then
            # Show actual info about the session and a tiny brief
            session
        elif [ "$3" == "login" ]; then
            # Login account
            login_user
        elif [ "$3" == "logout" ]; then
            # Logout of session
            logout_user
        elif [ "$3" == "register" ]; then
            # Register
            register_user
        elif [ "$3" == "delete_acount" ]; then
            # Delete account
            delete_account
        fi
    elif [ "$2" == "conf" ]; then
        # User configuration
        # Implement your user configuration logic here
        :
    fi


elif [ "$1" == "init" ]; then
    init_susano

elif [[ "$1" == "help" ]] || [[ "$1" == "h" ]]; then
    cat help.txt

elif [ "$1" == "cvi" ]; then
    # Crypto Volatility Index
    if [[ "$2" == "v" ]] || [[ "$2" == "value" ]]; then
        # Show the value of CVI
        :
    elif [ "$2" == "subscribe" ]; then
        # Subscribe to CVI and receive notifications and set its conf
        :
    elif [ "$2" == "conf" ]; then
        if [ "$3" == "get" ]; then
            # Get CVI config
            :
        elif [ "$3" == "set" ]; then
            # Set CVI config
            :
        fi
    fi

elif [[ "$1" == "fg" ]] || [[ "$1" == "fear_greed" ]]; then
    # Fear and Greed Index
    if [[ "$2" == "v" ]] || [[ "$2" == "value" ]]; then
        today_fear_greed=$(get_today_fear_greed)
        echo "Today's Fear and Greed Index value: $today_fear_greed"
    fi

elif [[ "$1" == "trading" ]]; then
    if [[ "$2" == "assets" ]]; then 
        :
        if [[ "$3" == "--pretty-print" ]] || [[ "$3" == "-p" ]]; then
            :
        elif [[ "$3" == "-f" ]] || [[ "$3" == "--filter" ]]; then
            shift 3  # Shift past the first three arguments (trading assets -f)
            for filter in "$@"; do
                case $filter in
                    "*"|"all")
                        :
                        ;;
                    "pnl")
                        :
                        ;;
                    "roi")
                        :
                        ;;
                    "used")
                        :
                        ;;
                    "^")
                        :
                        ;;
                    *)
                        echo "Unknown filter: $filter"
                        ;;
                esac
            done
        fi
    
    elif [[ "$2" == "positions" ]] || [[ "$2" == "pos" ]]; then
        :

    elif [[ "$2" == "orders" ]]; then
        if [ "$3" == "open" ]; then
            :
        elif [ "$3" == "close" ]; then
            :
        elif [ "$3" == "show" ]; then
            :
        fi

fi






