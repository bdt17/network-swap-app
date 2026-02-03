#!/bin/bash
APP_URL="https://network-swap-app-final.onrender.com"
echo "Thomas IT Status: $(curl -s -m 30 -o /dev/null -w "%{http_code}" "$APP_URL/")"
echo "Root: $(curl -s -m 30 -o /dev/null -w "%{http_code}" "$APP_URL")"
echo "Health: $(curl -s -m 30 -o /dev/null -w "%{http_code}" "$APP_URL/up")"
