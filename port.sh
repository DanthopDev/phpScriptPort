#!/bin/sh
while true
do
 #sudo fuser -n tcp -k 3000
 #original_value=$(cat /proc/sys/net/ipv4/tcp_max_orphans)
 #echo 0 > /proc/sys/net/ipv4/tcp_max_orphans
 #echo $original_value > /proc/sys/net/ipv4/tcp_max_orphans
  esta=$(sudo lsof -i:3000)
 #sudo nohup php tcp.php &
 if [[ -z "$esta" ]]
 then
  sudo nohup php tcp.php &
  sleep 3600
 else
  sudo fuser -n tcp -k 3000
  original_value=$(cat /proc/sys/net/ipv4/tcp_max_orphans)
  echo 0 > /proc/sys/net/ipv4/tcp_max_orphans
  echo $original_value > /proc/sys/net/ipv4/tcp_max_orphans 
 fi
done
