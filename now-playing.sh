#!/bin/bash

p=''
p2=''
max=`echo $RANDOM| cut -c1,2`
counter=1

while [ $counter -lt $max ]
do
  ((counter++))
  p="$p "
done

max=`echo $RANDOM| cut -c2`
counter=1

while [ $counter -lt $max ]
do
  ((counter++))
  p2="$p2 "
done

st=`mpc status | grep play`

if [ ${#st} -gt 5 ] ; then
  echo 
  cur=`echo $st|cut -d' ' -f2- |sed -e 's/ /    /g'`
  figlet -t -r -f thick "$cur"

  #echo "`mpc current`"| sed -e 's/ /    /g' | figlet -t -c -ok
  cur=`mpc current | sed -e 's/ /  /g'`
  font=`ls /usr/share/figlet/*.flf|egrep -v 'smkeyboard|chess|ivrit|term|digit|mnemonic|bubble|snakey|pyramid|relief|tinker|relief|hex|decimal|binary|mirror|runic|runyc' | shuf -n1|cut -d/ -f5|cut -d. -f1`
  figlet -t -c -ok -f $font $cur
  echo 

  echo "$p2 `hostname``uptime` $font"
  sleep 5
else
  echo "$p |  |" | figlet -t
  echo "$p  paused"

  echo "$p `hostname` `uptime`"
  sleep 60
fi
