#!/usr/bin/env python

import os
import sys
from bs4 import BeautifulSoup

fontlink = BeautifulSoup('<link href="https://fonts.googleapis.com/css?family=Roboto+Mono" rel="stylesheet">', 'html.parser')

for file in sys.argv[1:]:
    print("Preparing {} for publish".format(file))
    with open(file) as fh:
        soup = BeautifulSoup(fh, 'html.parser')
        soup.html.head.insert(0,fontlink)
    print("Writing updated {}".format(file))
    with open(file, "w") as fh:
        fh.write(str(soup))