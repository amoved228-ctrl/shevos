# Build guide

## Вариант 1: Arch Linux / Arch VM

```bash
sudo pacman -Syu
sudo pacman -S --needed archiso base-devel git pacman-contrib
./scripts/build-localrepo-calamares.sh
./build.sh
```

## Вариант 2: Ubuntu/RED OS host

Нативно собирать неудобно: archiso использует pacman, pacstrap/chroot, loop/mount и archiso-профили. Безопаснее поднять Arch VM.

Допустимый вариант — привилегированный Arch-контейнер, но новичку проще VM.
