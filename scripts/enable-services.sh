#!/usr/bin/env bash
set -euo pipefail

# Запускать внутри установленной системы или через Calamares shellprocess.
systemctl enable NetworkManager.service
systemctl enable sddm.service
systemctl enable bluetooth.service || true
systemctl --global enable pipewire.service pipewire-pulse.service wireplumber.service || true
