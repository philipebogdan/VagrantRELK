#!/bin/bash

counter=600
host=$(hostname)
while [ $counter -gt 0 ]; do
    if [[ x$host == xcontroller ]]; then
        printf "warning: $counter seconds left\n" >> /var/log/controller_test.log
        sleep 1
        let counter=$counter-1
    elif [[ x$host == xnode01 ]]; then
        printf "error: $counter seconds left\n" >> /var/log/node01_test.log
        sleep 1
        let counter=$counter-1
    elif [[ x$host == xnode02 ]]; then
        printf "message: $counter seconds left\n" >> /var/log/node02_test.log
        sleep 1
        let counter=$counter-1
    else
        printf "This is no valid test machine: $host. EXITING NOW...\n"
        exit 99;
    fi
done