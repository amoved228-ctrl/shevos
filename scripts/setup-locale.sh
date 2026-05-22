#!/usr/bin/env bash
set -euo pipefail

sed -i 's/^#\(ru_RU.UTF-8 UTF-8\)/\1/' /etc/locale.gen
sed -i 's/^#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen
locale-gen

cat > /etc/locale.conf <<'EOF'
LANG=ru_RU.UTF-8
LC_COLLATE=C
EOF

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc || true
