import requests
import re

cookies = {
}

data = {
  'IDToken1': 'номер_счета',
  'IDToken2': 'пароль',
  'goto': 'https://my.yota.ru/selfcare/loginSuccess',
  'org': 'customer'
}

s = requests.Session() 

response = s.post('https://login.yota.ru/UI/Login', cookies=cookies, data=data)
#print (response.content);

#%curl_cmd% https://my.yota.ru/selfcare/devices | grep -Eo "name=\"product\" value=\"[0-9]+\"" | grep -Eo "[0-9]+" > productID.txt
m = re.search(r'name="product" value="\d+"', str(response.content))
#print(str(response.content))
m = re.search(r'\d+', m.group(0))
ProductID = m.group(0)

response = s.get('https://my.yota.ru/selfcare/devices', cookies=cookies, data=data)
#"name=\"offerCode\" value=\"[a-z,A-Z,0-9\-]+\""
#echo.[ %date% %time% ] trying to set %tariff% >> tariff.log
m = re.search(r'name="offerCode" value="\S+"', str(response.content))
#print (str(response.content))
print (m.group(0))
