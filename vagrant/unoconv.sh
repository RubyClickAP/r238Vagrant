#!/usr/bin/env bash

# Chinese font
apt-get -y install fontconfig xfonts-utils
apt-get install ttf-wqy-microhei
# check-out: fc-list :lang=zh

# ref: https://docs.moodle.org/all/es/Universal_Office_Converter_(unoconv)
mkdir /var/www/.config
chown www-data:www-data /var/www/.config

# ubuntu upstart
#cp /vagrant/unoconvd /etc/init.d/unoconvd
wget -qO /etc/init.d/unoconvd https://gist.githubusercontent.com/RubyClickAP/47948257bfb419d86a79ddd2088cd4fa/raw/b6206ea178c875b75beb22a5984b6e61ab90876f/unoconv-bionic-upstart
chmod +x /etc/init.d/unoconvd
update-rc.d -f unoconvd defaults
systemctl daemon-reload
#service unoconvd enable
service unoconvd start
service unoconvd status
