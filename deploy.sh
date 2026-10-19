#!/usr/bin/env bash

# Остановить скрипт при ошибках
set -e

# Сборка приложения
npm run build

# Переход в папку сборки
cd dist

# Инициализация гит-репозитория внутри папки dist
git init
git add -A
git commit -m 'deploy'

# Публикация в ветку gh-pages вашего репозитория
# Замените <USERNAME> на ваш логин, а <REPO> на имя вашего репозитория на GitHub
git push -f git@github.com:Straycorgi/Holidays_DNK.git master:gh-pages

cd -