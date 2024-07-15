#! /bin/bash

memory_info=$(free | grep Mem)

total_mem=$(echo "memory_info"|awk '{print $2}')
used_mem=$(echo "memory_info"|awk '{print $3}')
free_mem=$(echo "memory_info"|awk '{print $4}')

aws cloudwatch put-metric-data --namespace "Memory Utilization" --metric-name "TotalMemory" --value "$total_mem" --unit "bytes"
aws cloudwatch put-metric-data --namespace "Memory Utilization" --metric-name "UsedMemory" --value "$used_mem" --unit "bytes"
aws cloudwatch put-metric-data --namespace "Memory Utilization" --metric-name "FreeMemory" --value "$free_mem" --unit "bytes"

