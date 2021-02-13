#!/bin/bash
cd themes/lrone
mkdir -p lrone1/layer_animating_icons/
cp -r lrone_icons/miui_mod_icons/. lrone1/layer_animating_icons/
cp config.xml lrone1/layer_animating_icons/config.xml
cd lrone1/layer_animating_icons
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		cp config.xml ${dir}/config.xml
		cd ${dir}
		mkdir -p 1/quiet
        mkdir -p 0/quiet
        mv 1.png 1/quiet/quietImage.png
        mv 0.png 0/quiet/quietImage.png
		cd ..
	fi
done
cd ../../../..

rm -rf ./themes/lrone/lrone1/layer_animating_icons/config.xml

cd themes
mv lrone icons
XZ_OPT=-9 tar cJf lrone.tar.xz icons