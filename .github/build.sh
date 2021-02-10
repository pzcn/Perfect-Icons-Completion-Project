#!/bin/bash
cd icons/
mkdir -p 0/layer_animating_icons/
mkdir -p 4b/layer_animating_icons/
cp -r 1/miui_mod_icons/. 0/layer_animating_icons/
cp -r 4a/miui_mod_icons/. 4b/layer_animating_icons/
mv config.xml 0/layer_animating_icons/config.xml
mv config.xml 4b/layer_animating_icons/config.xml

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
cd ../..

cd 4b/layer_animating_icons
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
cd ../..

cd ..
rm -rf ./icons/0/layer_animating_icons/config.xml
rm -rf ./icons/4b/layer_animating_icons/config.xml