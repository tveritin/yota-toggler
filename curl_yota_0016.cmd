@echo off
cd c:\yota_script
set login=номер_счета
set pwd=пароль
set tariff=POS-MA2-0016
set curl_cmd=curl --location --silent --cookie ./cookie.jar --cookie-jar ./cookie.jar
%curl_cmd% -d "IDToken1=%login%" -d "IDToken2=%pwd%" -d "goto=https://my.yota.ru/selfcare/loginSuccess" -d "org=customer" https://login.yota.ru/UI/Login | grep -Eo "name=\"product\" value=\"[0-9]+\"" | grep -Eo "[0-9]+" > productID.txt
set /p prod=<productID.txt
echo.[ %date% %time% ] trying to set %tariff% >> tariff.log
%curl_cmd% -d "product=%prod%" -d "offerCode=%tariff%" -d "areOffersAvailable=false" -d "status=custom" -d "isSlot=false" -d "currentDevice=1" -d "isDisablingAutoprolong=false" https://my.yota.ru/selfcare/devices/changeOffer | grep -Eo "name=\"offerCode\" value=\"[a-z,A-Z,0-9\-]+\"" >> tariff.log
echo. >> tariff.log
