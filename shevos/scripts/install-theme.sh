#!/usr/bin/env bash
set -euo pipefail

# Безопасная схема интеграции темы:
# 1) не запускаем curl|bash от root;
# 2) не включаем телеметрию;
# 3) используем либо свои адаптированные конфиги, либо вручную проверенный fork.
echo "Для ilyamiro/imperative-dots лучше сначала изучить install.sh,"
echo "затем перенести нужные .config/hypr, quickshell, kitty, rofi, matugen вручную."
echo "Не запускай сторонний install.sh от root."
