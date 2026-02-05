#!/bin/bash
URL="https://network-swap-app-final.onrender.com"
echo "🔍 Validating Thomas IT API Data..."

# Devices check
DEVICES=$(curl -s "$URL/api/devices" | jq '. | length')
ONLINE=$(curl -s "$URL/api/devices" | jq 'map(select(.status=="online")) | length')
echo "📱 Devices: $DEVICES total, $ONLINE online"

# Shipments check  
SHIPMENTS=$(curl -s "$URL/api/shipments" | jq '. | length')
COMPLIANT=$(curl -s "$URL/api/shipments" | jq 'map(select(.compliant==true)) | length')
echo "🚚 Shipments: $SHIPMENTS total, $COMPLIANT FDA compliant"
