#!/bin/bash
curl -s -o /dev/null -w "🟢 Thomas IT: %{http_code} %{time_total}s\n" \
  https://network-swap-static.onrender.com/tech
