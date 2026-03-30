#!/bin/bash
# 作業終了時に自動でgit add / commit / push する

cd "C:\Users\PC_User\Desktop\Claude code" 2>/dev/null || \
cd "/c/Users/PC_User/Desktop/Claude code" 2>/dev/null || exit 0

# 変更がなければ何もしない
if git diff --quiet && git diff --cached --quiet; then
  exit 0
fi

# .env や秘密ファイルは除外
git add index.html css/style.css images/ README.md 2>/dev/null

# 変更がステージされていなければ終了
if git diff --cached --quiet; then
  exit 0
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
git commit -m "chore: 自動保存 ${TIMESTAMP}"
git push origin master
