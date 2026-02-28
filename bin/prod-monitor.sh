#!/bin/bash
./test_thomasit_comprehensive.rb | grep -E "PASS|SUMMARY"
curl -s https://network-swap-app.onrender.com/drone/inspect/1 | jq .status
