#!/bin/bash
cd themes/explore
mkdir -p explore1/layer_animating_icons/
cp -r explore_icons/miui_mod_icons/. explore1/layer_animating_icons/
cp config.xml explore1/layer_animating_icons/config.xml
cd explore1/layer_animating_icons
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

rm -rf ./themes/explore/explore1/layer_animating_icons/config.xml

cd themes
mv explore icons
XZ_OPT=-9 tar cJf explore.tar.xz icons