# yota-toggler
Переключатель скорости (тарифа) Yota

yota_max.py - питоновский скрипт установки минимальной скорости

yota_min.py - питоновский скрипт установки максимальной скорости

yota_check.py - питоновский скрипт проверки тарифа

curl_yota_0016.cmd - виндовый скрипт установки максимальной скорости

curl_yota_check.cmd - виндовый скрипт проверки тарифа

curl_yota_0003.cmd - виндовый скрипт установки минимальной скорости

yota-toggler-new - реинкарнация https://github.com/neoascetic/yota-toggler спасибо ему за идею, убрал только оттуда лишнее и на его основе сделал питоновские и виндовые скрипты

settings.ini - конфигурационный файл от yota-toggler-new

Виндовые и питоновские скрипты при успешной работе должны выдавать имя тарифа:
name="offerCode" value="POS-MA2-00**". Другое поведение интерпретируется как ошибка.

curl_yota_0016.cmd и curl_yota_0003.cmd пишут только в tariff.log. Отсутствие в логе строки name="offerCode" value="POS-MA2-00**" интерпретируется как ошибка.

Для виндовых скриптов требуется: 

curl.exe https://curl.haxx.se/windows/

grep.exe http://gnuwin32.sourceforge.net/packages/grep.htm
