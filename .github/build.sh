#!/bin/bash
cd icons/
mkdir -p 0/layer_animating_icons/
cp -r icons/miui_mod_icons/. 0/layer_animating_icons/
cp config.xml 0/layer_animating_icons/config.xml
cd 0/layer_animating_icons
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
cd ../../..

rm -rf ./icons/0/layer_animating_icons/config.xml