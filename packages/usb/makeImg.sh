#!/bin/bash

[ "$1" == "" ] && fname="out.bmp" || fname="$1.bmp"

(
###
# a b x x x x < file size = 54 + number of pixels - 5B6
#
# width
# height
cat <<END
42 4D B6 05 00 00 00 00 00 00 36 00 00 00
28 00 00 00 
16 00 00 00
15 00 00 00 
01 00 18 00
00 00 00 00 50 00 00 00
C4 0E 00 00 C4 0E 00 00
00 00 00 00 00 00 00 00
END
./get-pixgrab.ts | sed 's/data: //g; s/[ ,]/\n/g;' | for y in `seq 1 21`
do
    for x in `seq 1 22`
    do
        read l
        printf '%02x ' $l
        printf '%02x ' $l
        printf '%02x ' $l
    done
    printf '00\n'
    printf '00\n'
done
) > img.hex

xxd -r -p img.hex $fname


