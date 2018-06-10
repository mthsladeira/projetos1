#! /bin/bash
cat $1 | sed '/[a-zA-Z]/d' | sed '/^[- ]*$/d' | sort -k1 -n > $(echo $1 | egrep -o '^[^\.]+').sort.dat

