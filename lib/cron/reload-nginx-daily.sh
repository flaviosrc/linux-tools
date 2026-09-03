#!/bin/bash

echo "
Crontab entry example:

    0 2 * * * docker exec nginx-1 sh -c \"nginx -t && nginx -s reload\"

Explanation:
    0 2 * * *: execute every day at 02:00AM
    docker exec nginx-1 sh -c: execute sh command inside nginx-1 container
    nginx -t && nginx -s reload: reload nginx if config is ok

ATTENTION!!!

change nginx-1 with the actual container name

finally, add your custom command to crontab:

    crontab -e
"