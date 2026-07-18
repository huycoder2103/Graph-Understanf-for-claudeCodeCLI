#!/usr/bin/env bash
# Graph Understand for Claude Code — helper installer (macOS / Linux)
#
# Claude Code cài plugin trực tiếp qua marketplace, KHÔNG cần script này:
#
#   /plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
#   /plugin install understand-anything
#
# Script này chỉ dành cho ai muốn clone repo về máy để phát triển / tự build.
#
# Usage:
#   ./install.sh            Clone repo về ~/.understand-anything/repo và cài deps
#   ./install.sh --update   Cập nhật bản clone lên mới nhất
#   ./install.sh --help

set -euo pipefail

REPO_URL="${UA_REPO_URL:-https://github.com/huycoder2103/Graph-Understanf-for-claudeCodeCLI.git}"
REPO_DIR="${UA_DIR:-$HOME/.understand-anything/repo}"

show_help() {
  cat <<EOF
Graph Understand for Claude Code — helper installer

Claude Code cài plugin trực tiếp qua marketplace, KHÔNG cần script này:

  /plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
  /plugin install understand-anything

Script này chỉ dành cho ai muốn clone repo về máy để phát triển / tự build.

  ./install.sh            Clone repo và cài deps
  ./install.sh --update   Cập nhật bản clone
  ./install.sh --help     Hiện trợ giúp
EOF
}

update_repo() {
  if [ ! -d "$REPO_DIR/.git" ]; then
    echo "Chưa có bản clone tại $REPO_DIR. Chạy ./install.sh trước." >&2
    exit 1
  fi
  echo "Đang cập nhật $REPO_DIR ..."
  git -C "$REPO_DIR" pull --ff-only
  echo "Xong."
}

clone_and_build() {
  if [ -d "$REPO_DIR/.git" ]; then
    echo "Đã có bản clone tại $REPO_DIR — dùng ./install.sh --update để cập nhật."
  else
    echo "Đang clone vào $REPO_DIR ..."
    mkdir -p "$(dirname "$REPO_DIR")"
    git clone "$REPO_URL" "$REPO_DIR"
  fi

  if command -v pnpm >/dev/null 2>&1; then
    echo "Đang cài dependencies và build core ..."
    (cd "$REPO_DIR" && pnpm install && pnpm --filter @understand-anything/core build)
  else
    echo "Chưa có pnpm — bỏ qua bước build. Cài pnpm (>=10) rồi chạy: pnpm install"
  fi

  cat <<EOF

Hoàn tất. Tiếp theo, trong Claude Code:

  /plugin marketplace add huycoder2103/Graph-Understanf-for-claudeCodeCLI
  /plugin install understand-anything
  /understand
EOF
}

case "${1:-}" in
  --help|-h) show_help ;;
  --update)  update_repo ;;
  "")        clone_and_build ;;
  *)         echo "Tham số không hợp lệ: $1" >&2; show_help; exit 1 ;;
esac
