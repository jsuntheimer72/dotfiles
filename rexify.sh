#!/bin/bash

### installation
apt update
apt upgrade -y
apt install -y openbox tint2 
apt install -y gnupg apt-transport-https curl
apt install -y tmux unzip
apt install -y dmenu xsel xdotool xinput
#apt install -y git

cd /home/guest/Downloads
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list'
#echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list
apt update
apt install -y powershell
# Install-Package -Name AWSPowerShell.NetCore -AllowClobber
# https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up.html
cd ~

cd /home/guest/Downloads/
curl -L https://github.com/zyedidia/micro/releases/download/v1.3.4/micro-1.3.4-linux64.tar.gz > micro.tar.gz
tar xvf micro.tar.gz
cp micro-1.3.4/micro /usr/local/bin
cd ~

cd /home/guest/Downloads
wget http://fossil-scm.org/index.html/uv/fossil-linux-x64-2.4.tar.gz
tar xvf fossil-linux-x64-2.4.tar.gz
mv fossil /usr/local/bin
cd ~

#endotify & conflagration
update-alternatives --set x-terminal-emulator /usr/bin/xterm
cd /home/guest/Downloads
curl -L https://github.com/jsuntheimer72/dotfiles/archive/master.zip > dotfiles.zip
unzip dotfiles.zip
if [ ! -d "/root/.config" ]; then
  mkdir /root/.config
fi
cp -r dotfiles-master/* /root/.config
echo "xrdb -merge ~/.config/Xresources/.Xresources &" > /root/.xinitrc
echo "exec openbox-session" >> /root/.xinitrc
mv /root/.config/preferences /etc/apt/preferences
echo "deb http://deb.debian.org/debian unstable main non-free contrib" > /etc/apt/sources.list.d/sid.list
apt update
apt -t unstable install -y tcl8.6 tk8.6 tcl-expect tcllib tklib tkcon
apt -t unstable install -y fonts-oxygen fonts-font-awesome 
#mv ubuntu-font-family-0.83 /usr/share/fonts/truetype
fc-cache -v
mkdir -p /root/.themes/Windows-10
mkdir /root/.themes/Windows-10-Dark
cd /root/.config
unzip Windows-10-master.zip
unzip Windows-10-Dark-master.zip
cp -r Windows-10-master/openbox-3 /root/.themes/Windows-10/
cp -r Windows-10-Dark-master/openbox-3 /root/.themes/Windows-10-Dark/
cp -r Windows-10-master/tint2 /root/.themes/Windows-10
cp -r Windows-10-Dark-master/tint2 /root/.themes/Windows-10-Dark/
cd ~


###conflagration

ln -s /home/guest/Downloads/ /root/dl

##TODO##
# [ ] use sid for latest tcl, delete repository

