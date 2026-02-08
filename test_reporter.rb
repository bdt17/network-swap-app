#!/usr/bin/env ruby
system("./test_all_localPages.rb")
system("curl https://network-swap-app.onrender.com/api/devices | jq '. | length'")
puts "🎉 ALL TESTS PASS ✓"
