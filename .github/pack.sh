#!/bin/bash
XZ_OPT=-9 tar cJf icons.tar.xz ./icons
cd themes
mv lrone icons
XZ_OPT=-9 tar cJf lrone.tar.xz icons