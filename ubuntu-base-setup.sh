#!/bin/bash


apt update && apt full-upgrade -y

apt -y install less vim tree git netcat rsync atop

echo "syntax on" > /root/.vimrc
echo "set tabstop=2" >> /root/.vimrc
echo "set nohlsearch" >> /root/.vimrc

echo "export EDITOR=vim" > /root/.bash_profile
echo "alias grep='grep --color'" >> /root/.bash_profile
echo "alias egrep='egrep --color'" >> /root/.bash_profile
echo "alias less='less --tabs=2'" >> /root/.bash_profile
echo "alias cp='cp -pv'" >> /root/.bash_profile
echo "alias mv='mv -v'" >> /root/.bash_profile
echo "alias rm='rm -v'" >> /root/.bash_profile

echo '. /root/.bash_profile' >> /root/.bashrc

mkdir /root/{bin,log,tmp}


for D in $(ls -lad /home/* | awk '{print $NF}'); do

  XUID=$(stat -c "%U" "${D}")
  XGID=$(stat -c "%G" "${D}")

  echo "syntax on" > /${D}/.vimrc
  echo "set tabstop=2" >> /${D}/.vimrc
  echo "set nohlsearch" >> /${D}/.vimrc

  echo "export EDITOR=vim" > /${D}/.bash_profile
  echo "alias grep='grep --color'" >> /${D}/.bash_profile
  echo "alias egrep='egrep --color'" >> /${D}/.bash_profile
  echo "alias less='less --tabs=2'" >> /${D}/.bash_profile
  echo "alias cp='cp -pv'" >> /${D}/.bash_profile
  echo "alias mv='mv -v'" >> /${D}/.bash_profile
  echo "alias rm='rm -v'" >> /${D}/.bash_profile

  echo '. /${D}/.bash_profile' >> /${D}/.bashrc

  mkdir /${D}/{bin,log,tmp}

  chown "${XUID}":"${XGID}" "${D}" -R

done
