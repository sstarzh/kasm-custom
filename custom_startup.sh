#!/bin/bash
ready =`/usr/bin/desktop_ready`
if [ $ready != "0" ]; then
  exit 1
fi
URL=`echo $pac_file`
sed -i "s|Exec=chromium-browser[^ ]*|Exec=chromium-browser --proxy-pac-url=$URL|g" /home/kasm-user/Desktop/chromium-browser.desktop
certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n "Ericom Shield" -i /usr/local/share/ca-certificates/ericomshield.crt
exit 0