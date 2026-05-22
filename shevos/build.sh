#!/usr/bin/env bash
set -euo pipefail

# Сборка ISO ShevOS через mkarchiso.
# Запускать на Arch Linux, в Arch VM или в привилегированном Arch-контейнере.
# В Ubuntu/RED OS напрямую запускать не нужно: там нет pacman/mkarchiso и archiso-окружения.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_DIR="$ROOT_DIR/archiso"
OUT_DIR="$ROOT_DIR/out"
WORK_DIR="$ROOT_DIR/work"
LOCAL_REPO_SRC="$ROOT_DIR/archiso/localrepo/os/x86_64"
LOCAL_REPO_RUNTIME="/tmp/shevos-localrepo/os/x86_64"

echo "[ShevOS] Проверяю, что mkarchiso установлен..."
if ! command -v mkarchiso >/dev/null 2>&1; then
  echo "mkarchiso не найден. На Arch установи:"
  echo "  sudo pacman -S archiso"
  exit 1
fi

echo "[ShevOS] Проверяю локальный репозиторий для Calamares..."
if ! ls "$LOCAL_REPO_SRC"/calamares*.pkg.tar.* >/dev/null 2>&1; then
  echo "Не найден пакет calamares в $LOCAL_REPO_SRC"
  echo "Сначала выполни:"
  echo "  ./scripts/build-localrepo-calamares.sh"
  exit 1
fi

echo "[ShevOS] Готовлю локальный репозиторий для pacman..."
sudo rm -rf /tmp/shevos-localrepo
sudo mkdir -p "$LOCAL_REPO_RUNTIME"
sudo cp -a "$LOCAL_REPO_SRC"/*.pkg.tar.* "$LOCAL_REPO_RUNTIME"/

(
  cd "$LOCAL_REPO_RUNTIME"
  sudo repo-add shevos-local.db.tar.gz ./*.pkg.tar.*
)

mkdir -p "$OUT_DIR" "$WORK_DIR"

echo "[ShevOS] Собираю ISO..."
sudo mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$PROFILE_DIR"

echo "[ShevOS] Готово. ISO лежит в: $OUT_DIR"
ls -lh "$OUT_DIR"/*.iso
