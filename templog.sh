#!/bin/bash

while [ 1 ]; do
    echo $(date +"[%Y-%m-%d %H:%M:%S]") - $(vcgencmd measure_temp | cut -d'=' -f2)
    sleep 5
done
