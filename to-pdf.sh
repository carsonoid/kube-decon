#!/bin/bash -ex

SOZI_OPTS="-W 24 -H 18"

mkdir pdf || true

sozi-to-pdf $SOZI_OPTS \
    --include 1,2 \
    -o pdf/0-Intro.pdf \
    Layers/0-Intro.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,4,6,7,10,11,12,23,27,29,31,33,35,37,46,47,48,49,51,52,53,54 \
    -o pdf/1-Basic.pdf \
    Layers/1-Basic.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,4,5,13,14,15,16,18,19,20,22,21,26,27,30,33,35,36,41,42,44,46,52,56,57,58,60,65,66,68,69,70,72,73,74,75,83,84,85,86,87,88 \
    -o pdf/2-Cluster.pdf \
    Layers/2-Cluster.sozi.html
