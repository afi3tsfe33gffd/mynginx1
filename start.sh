#!/bin/bash
set -e

USERNAME="admin"
PASSWORD="$(openssl rand -base64 18 | tr -dc 'A-Za-z0-9' | head -c 24)"

echo "=============================================="
echo " Web terminal credentials"
echo " username: ${USERNAME}"
echo " password: ${PASSWORD}"
echo "=============================================="

ttyd -p 80   -c "${USERNAME}:${PASSWORD}" bash &
ttyd -p 3000 -c "${USERNAME}:${PASSWORD}" bash &

wait -n
