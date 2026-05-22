#!/usr/bin/env bash
set -euo pipefail

# Собирает Calamares из AUR в локальный pacman-репозиторий.
# ВАЖНО: запускать обычным пользователем, НЕ root.
if [[ "${EUID}" -eq 0 ]]; then
  echo "Не запускай этот скрипт от root. makepkg запрещает сборку от root."
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_DIR="$ROOT_DIR/archiso/localrepo/os/x86_64"
BUILD_DIR="$ROOT_DIR/.build/aur"

mkdir -p "$REPO_DIR" "$BUILD_DIR"

echo "[1/5] Проверяю зависимости..."
sudo pacman -S --needed --noconfirm base-devel git pacman-contrib

echo "[2/5] Клонирую AUR calamares..."
cd "$BUILD_DIR"
if [[ ! -d calamares ]]; then
  git clone https://aur.archlinux.org/calamares.git
fi

echo "[3/5] Собираю пакет..."
cd calamares
git pull --ff-only || true
makepkg -s --noconfirm --needed

echo "[4/5] Копирую пакет в локальный репозиторий..."
cp ./*.pkg.tar.* "$REPO_DIR/"

echo "[5/5] Обновляю базу repo-add..."
cd "$REPO_DIR"
rm -f shevos-local.db shevos-local.files shevos-local.db.tar.* shevos-local.files.tar.* || true
repo-add shevos-local.db.tar.gz ./*.pkg.tar.*

echo "Готово: локальный репозиторий создан в $REPO_DIR"
echo "Теперь можно запускать ./build.sh"
