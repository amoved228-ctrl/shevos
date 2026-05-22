# Локальная сборка ISO в Arch VM

Самый стабильный способ для новичка — поставить Arch Linux в виртуальную машину и собирать ISO там.

## 1. Установить зависимости

```bash
sudo pacman -Syu
sudo pacman -S --needed archiso base-devel git sudo pacman-contrib rsync
```

## 2. Перейти в папку проекта

```bash
cd shevos
```

## 3. Собрать Calamares в локальный pacman-репозиторий

Запускать обычным пользователем, не root:

```bash
./scripts/build-localrepo-calamares.sh
```

## 4. Собрать ISO

```bash
./build.sh
```

## 5. Проверить результат

```bash
ls -lh out/*.iso
sha256sum out/*.iso
```

## 6. Проверить ISO в QEMU

```bash
qemu-system-x86_64 \
  -m 4096 \
  -smp 2 \
  -cdrom out/shevos-*.iso \
  -boot d \
  -vga virtio
```
