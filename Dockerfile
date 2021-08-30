FROM kalilinux/kali-bleeding-edge

RUN nuser=NUSER && npass=NPASS && \
   echo "deb http://kali.download/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
   echo "deb http://kali.download/kali kali-bleeding-edge main contrib non-free" > /etc/apt/sources.list.d/kali-bleeding-edge.list && \
   apt-get -y update && \
   apt-get -y dist-upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y netcat wget nano curl sudo net-tools git openssh-server tmux dbus-x11 pciutils iproute2 iputils-ping bash-completion && \
   useradd -rm -d /home/$nuser -s /bin/bash -G sudo -u 1000 $nuser && \
   echo "$nuser:$npass" | chpasswd && \
   echo 'Defaults !fqdn' >> /etc/sudoers && \
   sed -i "s/#Port\ 22/Port\ 33322/g" /etc/ssh/sshd_config && \
   mkdir -p /run/sshd && \
   apt-get -y autoremove && \
   apt-get -y clean && \
   rm -rf /var/lib/apt/lists/* && \
   mkdir -p /usr/local/bin && \
   echo '#!/bin/bash' > /usr/local/bin/gui && \
   echo '$@ &>/dev/null &' >> /usr/local/bin/gui && \
   chmod +x /usr/local/bin/gui && \   
   wget https://raw.githubusercontent.com/thirdbyte/kalidock/master/home/.bashrc -O /home/$nuser/.bashrc && \
   wget https://raw.githubusercontent.com/thirdbyte/kalidock/master/home/.bashrc -O /root/.bashrc && \
   touch /home/$nuser/.hushlogin && \
   touch /root/.hushlogin && \
   echo 'set -g history-limit 10000' > /home/$nuser/.tmux.conf && \
   echo 'set -g history-limit 10000' > /root/.tmux.conf && \
   touch /home/$nuser/.Xauthority && \
   chown $nuser:$nuser /home/$nuser/.Xauthority && \
   chmod 0600 /home/$nuser/.Xauthority && \
   ln -s /home/$nuser/.Xauthority /root/.Xauthority

CMD [ "/usr/sbin/sshd", "-D" ]
