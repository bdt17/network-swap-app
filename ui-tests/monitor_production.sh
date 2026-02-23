#!/bin/bash
while true; do
  echo "$(date): Testing Thomas IT PRODUCTION..."
  curl -s -w "DJI API: %{http_code} | Tech: %{http_code} | Load: %{time_total}s\n" \
    -X POST https://network-swap-app.onrender.com/api/v1/inspections \
    https://network-swap-app.onrender.com/tech \
    -o /dev/null -d "test=1"
  sleep 30
done
