#!/bin/bash

cat <<EOF  > /var/www/html/index.nginx-debian.html
<HTML>
<HEAD>
    <meta charset="UTF-8">
    <title>Погода</title>
</HEAD>
<BODY>
    <p>Погода в Перми</p>
    <p>$(curl -s 'wttr.in/Perm?format=j1' | jq -r '.current_condition[0] | "Температура: \(.temp_C)°C, Влажность: \(.humidity)%"')</p>
    <p>Время обновления: $(TZ='Asia/Yekaterinburg' date +'%Y-%m-%d %H:%M:%S')</p>
</BODY>
</HTML>
EOF
