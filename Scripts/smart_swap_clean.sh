#!/bin/bash

echo "Drop caches"
echo 3 > /proc/sys/vm/drop_caches

./LogProcesses.sh

MemFree=`cat /proc/meminfo | grep MemFree | awk {'print $2'}`
SwapFree=`cat /proc/meminfo | grep SwapFree | awk {'print $2'}`
SwapTotal=`cat /proc/meminfo | grep SwapTotal | awk {'print $2'}`

let MemFree=$MemFree-51200
let SwapThreshold=$SwapTotal/2


echo "Realistic Free Memory " $MemFree " KB"

if [ $MemFree -gt $SwapTotal ]
then
	echo "Enough free ram to clear swap";
	echo "Starting Swap cleanup."
	swapoff -a && dphys-swapfile swapon && echo "Cleanup succeded"
	./LogProcesses.sh
fi


