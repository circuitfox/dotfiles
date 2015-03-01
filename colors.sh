#!/bin/bash

T="gYw"

printf "              "
for b in {40..47}; do
    printf "  %sm   " $b
done
echo

for B in 0 1; do
    printf "   %sm " $B
    printf "\\e[%sm  %s  \\e[0m " $B $T
    for b in {40..47}; do
        printf "\\e[%s;%sm  %s  \\e[0m " $B $b $T
    done
    echo
done

for f in {30..37}; do
    for B in 0 1; do
        printf "%s;%sm " $B $f
        printf "\\e[%s;%sm  %s  \\e[0m " $B $f $T
        for b in {40..47}; do
            printf "\\e[%s;%s;%sm  %s  \\e[0m " $B $f $b $T
        done
        echo
    done
done

