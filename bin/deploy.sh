#!/usr/bin/env bash
git add .
git commit -m "Quick wins: $(git diff --stat HEAD~1 | head -1)"
git push origin main
echo "Deploy triggered on Render"
