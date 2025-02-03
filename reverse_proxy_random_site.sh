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

     if [[ ! -d "landing-ideaplex" ]]; then
      while ! cp /root/3x-ui-reverse-proxy/landing-ideaplex.zip /usr/local/reverse_proxy/; do
        warning " $(text 38) "
        sleep 3
      done
      unzip -q landing-ideaplex.zip &>/dev/null && rm -f landing-ideaplex.zip
  fi

  cd landing-ideaplex/ || echo "Не удалось перейти в папку с шаблоном"



  info " $(text 80) landing-ideaplex"

  # Копируем шаблон в /var/www/html
  if [[ -d "/var/www/html/" ]]; then
      echo "Копируем шаблон в /var/www/html/..."
      rm -rf /var/www/html/*  # Очищаем старую папку
      cp -a . /var/www/html/ || echo "Ошибка при копировании шаблона"
  else
      echo "Ошибка при извлечении шаблона!"
  fi

  cd ~
