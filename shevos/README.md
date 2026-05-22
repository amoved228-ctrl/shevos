# ShevOS

ShevOS — учебная основа собственного Arch-based ISO с:

- archiso / releng-подходом;
- Calamares;
- Hyprland по умолчанию;
- SDDM;
- русской локалью `ru_RU.UTF-8`;
- NetworkManager и `nmtui`;
- готовыми пользовательскими конфигами в `/etc/skel`.

## Важно про Calamares

В официальных репозиториях Arch пакет `calamares` может отсутствовать. Поэтому проект использует локальный pacman-репозиторий:

```bash
./scripts/build-localrepo-calamares.sh
```

Этот скрипт нельзя запускать от root.

## Сборка на Arch Linux

```bash
sudo pacman -Syu
sudo pacman -S --needed archiso git base-devel pacman-contrib

git clone <your-repo-url> shevos
cd shevos

./scripts/build-localrepo-calamares.sh
./build.sh
```

ISO появится в `out/`.

## Тест в QEMU

```bash
qemu-system-x86_64 \
  -enable-kvm \
  -m 4096 \
  -cpu host \
  -smp 2 \
  -bios /usr/share/edk2/x64/OVMF.4m.fd \
  -cdrom out/shevos-*.iso \
  -boot d \
  -vga virtio
```

## Тест в VirtualBox

1. Создай VM: Linux / Arch Linux 64-bit.
2. RAM: 4096 MB.
3. EFI: включить.
4. Video: VMSVGA, 128 MB.
5. Подключи ISO из `out/`.
6. После загрузки нажми “Установить ShevOS”.

## Переименование дистрибутива

Главные места:

- `distro.conf`;
- `archiso/profiledef.sh`;
- `archiso/airootfs/etc/os-release`;
- `archiso/airootfs/etc/calamares/branding/shevos/branding.desc`;
- имена папок branding.

## Русские или английские папки пользователя

Для стабильности лучше оставить английские папки `Desktop`, `Downloads`, `Documents`, особенно для скриптов и программ. Русские названия красивее для пользователя, но иногда ломают плохо написанные скрипты. Компромисс: оставить английские физические пути, а локализацию интерфейса сделать русской.

## Сборка ISO без локального Arch Linux

Если у тебя сейчас нет возможности собрать ISO на своём компьютере, используй GitHub Actions:

1. Загрузи проект в GitHub-репозиторий.
2. Открой вкладку **Actions**.
3. Запусти **Build ShevOS ISO**.
4. Скачай artifact `shevos-iso`.

Подробно: `docs/github-actions-build.md`.

