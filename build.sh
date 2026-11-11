#!/bin/bash
# index.html（Artifact用の本文のみ）を、GitHub Pages用の単体HTML（docs/index.html）に包む
set -e
cd "$(dirname "$0")"
mkdir -p docs
{
  cat <<'EOF'
<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px);color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>
</head>
<body>
EOF
  cat index.html
  printf '\n</body>\n</html>\n'
} > docs/index.html
echo "docs/index.html を生成しました"
