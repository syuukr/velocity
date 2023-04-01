#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run this as root"
  exit
fi

modprobe ip_conntrack

# Apply sysctl
cp ./sysctl.conf /etc
sysctl -p

cp ./thewar/thewar.service /etc/systemd/system
cp ./thepvp/thepvp.service /etc/systemd/system

systemctl daemon-reload
systemctl restart thewar
systemctl restart thepvp
systemctl enable thewar
systemctl enable thepvp


echo "Done."

exit 0;
