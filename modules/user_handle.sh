#!/bin/bash

source ./init.sh

function login_user() {
    echo "Enter username:"
    read username

    echo "Enter password:"
    read -s password

    response=$(curl -s -X 'POST' \
    'http://18.227.161.231:8000/login_user' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
    "username": "'"$username"'",
    "password": "'"$password"'"
    }')

    status=$(echo "$response" | jq -r '.status')
    if [ "$status" == "success" ]; then
        if [ -f /usr/local/susano/user_susano.conf ]; then
            # Update user data
            user_id=$(echo "$response" | jq -r '.id')
            user_name=$(echo "$response" | jq -r '.username')
            email=$(echo "$response" | jq -r '.email') 
            echo "user_id=$user_id" > /usr/local/susano/user_susano.conf
            echo "username=$user_name" >> /usr/local/susano/user_susano.conf
            echo "email=$email" >> /usr/local/susano/user_susano.conf

            echo "Login successful and user data updated."
        else
            echo "Your login was successful but you haven't executed 'susano init'."
        fi
    else
        message=$(echo "$response" | jq -r '.error')
        echo "Login failed: $message"
    fi
}

function register_user() {
    echo "Enter username:"
    read username

    while true; do
        echo "Enter password:"
        read -s password

        echo "Repeat password:"
        read -s password_repeat

        if [ "$password" == "$password_repeat" ]; then
            echo "Passwords match."
            break
        else
            echo "Passwords do not match. Please try again."
        fi
    done

    echo "Enter email:"
    read email

    echo "Enter your country:"
    read country

    # Register User in the API
    response=$(curl -s -X 'POST' \
    'http://18.227.161.231:8000/register_user' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
    "username": "'"$username"'",
    "email": "'"$email"'",
    "password": "'"$password"'",
    "country": "'"$country"'"
    }')

    # If successful, update conf data
    status=$(echo "$response" | jq -r '.status')

    if [ "$status" == "success" ]; then
        user_id=$(echo "$response" | jq -r '.id')
        user_name=$(echo "$response" | jq -r '.username')
        email=$(echo "$response" | jq -r '.email')

        echo "user_id=$user_id" > /usr/local/susano/user_susano.conf
        echo "username=$user_name" >> /usr/local/susano/user_susano.conf
        echo "email=$email" >> /usr/local/susano/user_susano.conf

        echo "Registration successful and user data updated."
    else
        message=$(echo "$response" | jq -r '.error')
        echo "Registration failed: $message"
    fi
}

function logout_user() {
    user_id=$(cat /usr/local/susano/user_susano.conf | grep user_id | cut -d '=' -f 2)

    response=$(curl -s -X 'PUT' \
    'http://18.227.161.231:8000/logout/'"$user_id" \
    -H 'accept: application/json')

    status=$(echo "$response" | jq -r '.status')
    if [ "$status" == "success" ]; then
        echo "Logout successful."
    else
        message=$(echo "$response" | jq -r '.error')
        echo "Logout failed: $message"
    fi
}

function session() {
    # Print the actual session
    user_name=$(cat /usr/local/susano/user_susano.conf | grep username | cut -d '=' -f 2)
    user_email=$(cat /usr/local/susano/user_susano.conf | grep email | cut -d '=' -f 2)

    # Subscriptions
    # MAKE IT IN THE FUTURE IMPORTANT

    echo "---SESSION---"
    echo "Username: $user_name"
    echo "Email: $user_email"

    echo "---SUBSCRIPTIONS---"
    echo "Notifications subscribed: Not available yet"
    echo "Economic calendar conf: Not available yet"
    echo "Trading bot: Not available yet"
    echo ""
}

function delete_account() {
    user_name=$(cat /usr/local/susano/user_susano.conf | grep username | cut -d '=' -f 2)
    echo "Are you sure that you want to delete your account, $user_name? (y/n)"
    read response

    if [[ "$response" == "y" ]] || [[ "$response" == "yes" ]]; then
        user_id=$(cat /usr/local/susano/user_susano.conf | grep user_id | cut -d '=' -f 2)

        # Delete user in server
        response=$(curl -s -X 'DELETE' \
        'http://18.227.161.231:8000/delete_user/'"$user_id" \
        -H 'accept: application/json')

        status=$(echo "$response" | jq -r '.status')
        if [ "$status" == "success" ]; then
            # Delete user in local machine
            rm /usr/local/susano/user_susano.conf
            echo "Account deleted successfully."
        else
            message=$(echo "$response" | jq -r '.error')
            echo "Account deletion failed: $message"
        fi
    else
        echo "Account deletion canceled."
    fi
}
