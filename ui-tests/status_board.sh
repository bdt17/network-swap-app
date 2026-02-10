#!/bin/bash
echo "<h1>🚀 Thomas IT Network Swap - LIVE STATUS</h1>
<p>🟢 STATIC: <a href='https://network-swap-static.onrender.com/tech'>Tech Dashboard LIVE</a></p>
<p>📱 Field Ops: 6/7 endpoints LIVE</p>
<p>🔴 DYNAMIC: Deploy when backend ready</p>" | lynx -dump - | grep -v "No."
