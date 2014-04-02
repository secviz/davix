#!/bin/bash

function check_root() {
    if [[ "$USER" != "root" ]]; then
        echo "please run as: sudo $0"
        exit 1
    fi
}

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
