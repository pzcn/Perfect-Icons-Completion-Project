#!/bin/bash
mkdir -p ./temp/res/drawable-xxhdpi/
cp -rf icons/* ./temp/res/drawable-xxhdpi/
cd temp
zip -r -9 icons.zip *  >/dev/null
mv icons.zip icons
XZ_OPT=-9 tar cJf icons.tar.xz icons
cd ..
cd addition/default
XZ_OPT=-9 tar cJf default.tar.xz *
cd ../..

cd themes/explore
XZ_OPT=-9 tar cJf explore.tar.xz *
cd ../..

cd themes/lrone
XZ_OPT=-9 tar cJf lrone.tar.xz *
cd ../..

cd themes/luck7
XZ_OPT=-9 tar cJf luck7.tar.xz *
cd ../..

cd themes/perfectcurve
XZ_OPT=-9 tar cJf perfectcurve.tar.xz *
cd ../..

cd themes/flyme9
XZ_OPT=-9 tar cJf flyme9.tar.xz *
cd ../..

mkdir output
cp -rf ./temp/icons.tar.xz ./output
cp -rf ./addition/default/default.tar.xz ./output
cp -rf ./themes/explore/explore.tar.xz ./output
cp -rf ./themes/lrone/lrone.tar.xz ./output
cp -rf ./themes/luck7/luck7.tar.xz ./output
cp -rf ./themes/perfectcurve/perfectcurve.tar.xz ./output
cp -rf ./themes/flyme9/flyme9.tar.xz ./output
