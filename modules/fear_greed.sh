#!/bin/bash


function get_today_fear_greed() {
    result=$(curl -s https://api.alternative.me/fng/?limit=1)
    today_value=$(echo $result | jq -r '.data[0].value')
    echo $today_value
}

