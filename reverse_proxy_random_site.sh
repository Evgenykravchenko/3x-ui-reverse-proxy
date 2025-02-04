#!/bin/bash

msg_inf() {
    echo "[INFO] $1"
}

msg_err() {
    echo "[ERROR] $1" >&2
}

msg_ok() {
    echo "[OK] $1"
}
apt-get update -y && apt-get install -y zip wget unzip
    msg_inf "Разворачиваем лендинг из локального архива..."
   rm -rf /var/www/
    mkdir -p /var/www/html /usr/local/reverse_proxy

 if [[ -f "landing-ideaplex.zip" ]]; then
      msg_inf "Переносим landing-ideaplex.zip в /usr/local/reverse_proxy/..."
      mv landing-ideaplex.zip /usr/local/reverse_proxy/
  fi
 
    cd /usr/local/reverse_proxy || { msg_err "Не удалось перейти в /usr/local/reverse_proxy"; return 1; }

  if [[ ! -f "landing-ideaplex.zip" ]]; then
      msg_err "Файл landing-ideaplex.zip не найден! Поместите его в /usr/local/reverse_proxy и попробуйте снова."
      return 1
  fi

  msg_inf "Распаковываем landing-ideaplex.zip..."
  rm -rf landing-ideaplex
  unzip -q landing-ideaplex.zip -d landing-ideaplex || { msg_err "Ошибка при распаковке"; return 1; }

  msg_inf "Копируем содержимое в /var/www/html/..."
  rm -rf /var/www/html/*
  cp -a "landing-ideaplex/." /var/www/html/ || { msg_err "Ошибка при копировании"; return 1; }

  msg_ok "Лендинг успешно установлен!"
cd ~
