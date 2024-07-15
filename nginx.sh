#! /bin/bash
if pgrep nginx > /dev/null;then
    nginx_status=1
else
    nginx_status=0
fi
aws cloudwatch put-metric-data --namespace "NginxStatus" --metric-name "NginxRunning" --value $nginx_status --unit count
