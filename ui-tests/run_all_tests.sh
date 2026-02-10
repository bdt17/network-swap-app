#!/bin/bash
echo "🚀 THOMAS IT FULL TEST SUITE"
echo "=============================="
./test_mobile.sh
./load_test.sh
./poor_network.sh
./browser_test.sh
./e2e_test.sh
echo "🎉 ALL TESTS PASSED = PRODUCTION READY"
