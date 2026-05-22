#!/usr/bin/env bash
# shellcheck disable=SC2034
# Основа взята по смыслу из releng-профиля archiso.
# Название можно заменить через distro.conf / sed.

iso_name="shevos"
iso_label="SHEVOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="ShevOS Project <https://example.local>"
iso_application="ShevOS Live/Install ISO"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"

# Важно: install_dir максимум 8 символов, только [a-z0-9].
install_dir="shevos"

buildmodes=('iso')

# UEFI через systemd-boot + BIOS/Legacy через syslinux.
bootmodes=('bios.syslinux' 'uefi.systemd-boot')

arch="x86_64"
pacman_conf="pacman.conf"

airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')

bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')

file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/usr/local/bin/launch-calamares"]="0:0:755"
  ["/usr/local/bin/shevos-welcome"]="0:0:755"
  ["/usr/local/bin/shevos-postinstall"]="0:0:755"
)
