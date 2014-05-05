#!/bin/bash

## Turning off services by default
# byeybe apache
update-rc.d apache2 disable
# goodbye mysql
echo manual >> /etc/init/mysql.override
# gone is ssh and some more
echo manual >> /etc/init/ssh.override
echo manual >> /etc/init/cups.override
mv /etc/inetd.conf /etc/inetd.disabled
update-rc.d tor disable
# turn off samba
echo manual >> /etc/init/winbind

# turn off new DAVIX installed services
# turn off snort
update-rc.d snort disable
# turn off pads
update-rc.d pads disable
# turn off prads
update-rc.d prads disable
# turn off logstash
echo manual >> /etc/init/logstash.override
echo manual >> /etc/init/logstash-web.override
# turn off mrtg
sed -i -e 's/^/#/' /etc/cron/mrtg/ 
