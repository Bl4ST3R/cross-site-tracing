#!/bin/bash
clear

figlet Cross Site Tracing
green='\033[0;32m'
red='\033[0;31m'

echo -e "${green}Enter the url"
read url

new=`curl -i --silent  -H 'Via: <script>alert('XSS');</script>' -X TRACE $url | grep TRACE |cut -d "/" -f1`

if [ $new == TRACE ]; then
	echo -e "${red}[!] $url is vulnerable to Cross Site Tracing"
    echo $new
else 
	
    echo "[Not vulnerable]"
    echo $new
fi

