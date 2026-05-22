#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Удаляю рабочие каталоги сборки: work/ и out/"
sudo rm -rf "$ROOT_DIR/work" "$ROOT_DIR/out"

echo "Готово."
