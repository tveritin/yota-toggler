@echo off
cd c:\yota_script
set login=номер_счета
set pwd=пароль
set curl_cmd=curl --location --silent --cookie ./cookie.jar --cookie-jar ./cookie.jar
%curl_cmd% -d "IDToken1=%login%" -d "IDToken2=%pwd%" -d "goto=https://my.yota.ru/selfcare/loginSuccess" -d "org=customer" https://login.yota.ru/UI/Login | grep -Eo "name=\"product\" value=\"[0-9]+\"" | grep -Eo "[0-9]+" > productID.txt
set /p prod=<productID.txt
%curl_cmd% https://my.yota.ru/selfcare/devices | grep -Eo "name=\"offerCode\" value=\"[a-z,A-Z,0-9\-]+\""
