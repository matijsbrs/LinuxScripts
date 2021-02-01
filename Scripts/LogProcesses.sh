#!/bin/bash

mUID=`date "+%s"`
BasePath="/tmp"
TopMemoryFile=$BasePath"/TopMemoryUsage."$mUID".dump"
TopCpuFile=$BasePath"/TopCpuUsage."$mUID".dump"
TotalProcessFile=$BasePath"/Processes."$mUID".dump"

ps aux --sort -%mem | head -n 20 > $TopMemoryFile
ps aux --sort -%cpu | head -n 20 > $TopCpuFile
ps auxf > $TotalProcessFile

echo "Process dump ("$mUID") made.}"
echo "+-{Top 5 Memory usage}"
cat $TopMemoryFile | head -n 5 | sed s/^/"| "/g
echo "+-"
echo ""
echo "+--{Top 5 Cpu usage}"
cat $TopCpuFile | head -n 5 | sed s/^/"| "/g
echo "+-"
echo ""
