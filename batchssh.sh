#!/bin/bash
CMD="iptables -L -n"
SSH(){
        ./sshpass -p $3 ssh -F ./ssh_config -p $2 root@$1 $CMD
}
for I in $(seq $(wc -l ips | awk '{print $1}')) ; do
        SSH $(sed -n "${I}p" ips)
done &> $(date +%H%M%S).log
