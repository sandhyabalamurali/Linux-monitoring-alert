#!/bin/bash
##################################
#version:v0.0.1
#author:Sandhya
####################################
LOG_FILE="monitor.csv"

# Thresholds
CPU_THRESHOLD=60
MEMORY_THRESHOLD=60  
DISK_THRESHOLD=60                                               
# Create CSV header only once   
if [ ! -f "$LOG_FILE" ]; 
then   
echo "Date,CPU(%),Memory(%),Disk(%),RX(Bytes),TX(Bytes)" > "$LOG_FILE"
fi                                                              
while true                                                      
do                                                             
#to check the cpu usage batch wise                              
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{printf  "%.2f" , 100 - $8}')
echo "CPU Usage: $cpu"
#to check the memory usage
memory=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
echo "Memory Usage: $memory%"
#to check the disk usgae
# df -h
disk=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Disk Usage: $disk%"
#network
# ip addr
#to check the logs
# sar
rx=$(cat /proc/net/dev | awk '/eth0/ {print $2}')
tx=$(cat /proc/net/dev | awk '/eth0/ {print $10}')

echo "RX Bytes: $rx"
echo "TX Bytes: $tx"
echo "$current_time,$cpu,$memory,$disk,$rx,$tx" >> "$LOG_FILE"
# storing in csv
echo "$(date),$cpu,$memory,$disk,$rx,$tx" >> monitor.csv
#Threshold Check
threshold=60
if (( ${cpu%.*} >= CPU_THRESHOLD || \
          ${memory%.*} >= MEMORY_THRESHOLD || \
          disk >= DISK_THRESHOLD ))
then
{
    echo "LINUX MONITORING ALERT!"
    echo
    echo "Time : $(date)"
    echo "CPU :$cpu%"
    echo  "MEMORY : $memory%"
    echo "Disk: $disk%"
    echo
    echo "Last 10 log entries:"
    tail -10 monitor.csv
} | mail -s "Linux monitoring alert" sandhyabala2705@gmail.com
fi
echo " execution is completed and waiting for next check"
sleep 60
done
