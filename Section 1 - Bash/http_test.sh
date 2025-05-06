#!/bin/bash
codes=(200 201 301 404 500)

check_url() {
    local code=$1
    local url="https://httpstat.us/$code"
    #Получаем тело ответа и статус-код
    response=$(curl -s -k -w "\n%{http_code}" "$url")
    body=$(echo "$response" | head -n -1)
    status=$(echo "$response" | tail -n1)
    #Соот-щий вывод для статус кодов
    if [[ $status =~ ^[1-3][0-9][0-9]$ ]]; then
        echo "$body"
    elif [[ $status =~ ^[4-5][0-9][0-9]$ ]]; then
        echo "Exception occurred! $body" >&2
        return 1
    else
        echo "Unknown status: $status $body"
        return 2
    fi
}

for code in "${codes[@]}"; do
    check_url "$code"
done
