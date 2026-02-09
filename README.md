# Thomas IT Network Swap

**Phase 5-6 LIVE** - Enterprise Network Inventory + Bulk Swap Planning
- 500 Devices across 5 Sites (Phoenix, AZ) 
- Live Postgres: https://network-swap-static.onrender.com
- Thomas IT Colors: Deep Ocean Blue (#0984C0) + Metallic Silver

## Features LIVE ✅
- **Dashboard**: 500 devices + bulk operations + stats
- **API**: `/api/swaps` → JSON SwapTickets + AuditLogs
- **Bulk Swaps**: "Create 10 Test Swaps" → Real DB writes
- **Responsive**: Tailwind CSS + Thomas IT branding
- **Production**: Render Postgres + audit trails

## 🧪 UI Test Suite

| Script | Purpose | Status |
|--------|---------|--------|
| `ui-tests/testUI_network_swap.sh` | Dashboard + API smoke | ✅ PASS |
| `ui-tests/testUI_network_swap_FULL.sh` | Full E2E regression | ✅ PASS |
| `ui-tests/production_status_20260207_183225.txt` | Deploy logs | Render Events |
| `ui-tests/ui_test_network_swap_20260205_165650.txt` | Baseline | Saved |

### Run Tests
```bash
cd ui-tests
./testUI_network_swap.sh           # 30s smoke test
./testUI_network_swap_FULL.sh      # 2min full regression
