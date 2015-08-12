#!/bin/bash

cat /root/modules.txt | while read line; do cpanm -n $line ; done

