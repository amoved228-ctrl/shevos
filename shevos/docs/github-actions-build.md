# Сборка ISO ShevOS через GitHub Actions

Этот способ нужен, если у тебя сейчас нет Arch Linux, Arch VM или возможности собрать ISO локально.

## Что получится

GitHub сам запустит Arch Linux контейнер, соберёт пакет Calamares из AUR обычным пользователем, затем запустит `mkarchiso` и отдаст ISO как artifact.

## Как запустить

1. Создай пустой репозиторий на GitHub, например `shevos`.
2. Загрузи туда все файлы проекта.
3. Открой вкладку **Actions**.
4. Выбери workflow **Build ShevOS ISO**.
5. Нажми **Run workflow**.
6. После завершения открой завершённый запуск workflow.
7. Внизу скачай artifact `shevos-iso`.
8. Внутри будет `.iso` и `SHA256SUMS.txt`.

## Важно

- Workflow использует `archlinux:latest` и `--privileged`, потому что `mkarchiso` использует mount/chroot/loop-механики.
- `calamares` собирается из AUR через `makepkg`, поэтому сборка идёт не от root.
- Если AUR-пакет Calamares временно сломан, ISO не соберётся. В таком случае нужно либо починить PKGBUILD, либо временно использовать `calamares-git`.
- Не добавляй в workflow команды вида `curl ... | sudo bash`. Это небезопасно.
