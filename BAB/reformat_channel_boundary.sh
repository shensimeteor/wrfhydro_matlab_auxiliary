#!/bin/bash
if [ $# -ne 1 ]; then
    echo "usage, $0  <XX_channel_boundary.txt, copy from KML file>"
    exit 2
fi

sed 's/ /\n/g' $1 | sed '/^ *$/d' | sed 's/,0$//g' > "reformated_$1"

