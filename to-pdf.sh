#!/bin/bash -ex

SOZI_OPTS="-W 30 -H 18"

mkdir pdf || true

sozi-to-pdf $SOZI_OPTS \
    --include 1,2 \
    -o pdf/0-Intro.pdf \
    Layers/0-Intro.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,4,6,7,10,11,12,23,25,27,29,31,33,35,37,46,47,48,49,51,52,53,54 \
    -o pdf/1-Basic.pdf \
    Layers/1-Basic.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,4,5,13,14,15,16,18,19,20,22,21,26,27,30,33,35,36,41,42,44,46,52,56,57,58,60,65,66,68,69,70,72,73,74,75,83,84,85,86,87,88 \
    -o pdf/2-Cluster.pdf \
    Layers/2-Cluster.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,4,5,6,7,9,10,11,12,13,15,18,19,22,23,25,26,28,29,32,33,35,37,38,42,43,44,45,46,50,51,52,54,55,57,58,59,60,66,68,70,71,72,84,85,86,87,88,89,90,91,92,93,94,99,100,101,105,107,108,109 \
    -o pdf/3-Network.pdf \
    Layers/3-Network.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,4,14,19,20,21,22,25,27,28,29,30,33,34,38,39,40 \
    -o pdf/4-Cloud.pdf \
    Layers/4-Cloud.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,4,5,13,14,16,17,25,27,29,30,32,33,34,36,40,41,43,44,45,46,48,49,50,51,52,53,55,93,94,95,96,97,98,100,101,102,103,104,106,107,108 \
    -o pdf/5-Linux.pdf \
    Layers/5-Linux.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,11,18,19,21,24,25,44,51,52,53 \
    -o pdf/6-Power.pdf \
    Layers/6-Power.sozi.html

sozi-to-pdf $SOZI_OPTS \
    --exclude 1,2,3,4 \
    -o pdf/7-Credits.pdf \
    Layers/7-Credits.sozi.html

# Join to final out
cd pdf
pdftk  \
    0-Intro.pdf \
    1-Basic.pdf \
    2-Cluster.pdf \
    3-Network.pdf \
    4-Cloud.pdf \
    5-Linux.pdf \
    6-Power.pdf \
    7-Credits.pdf \
    cat output Carson-Anderson_Kubernetes-Desconstructed.pdf
