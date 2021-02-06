#!/bin/bash
cp -r 4/miui_mod_icons/* 1/layer_animating_icons/
mv config.xml 1/layer_animating_icons/config.xml
cd 1/layer_animating_icons
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		echo $dir
		cp config.xml ${dir}/config.xml
		cd ${dir}
		pwd
		mkdir -p 1/quiet
        mkdir -p 0/quiet
        mv 1.png 1/quiet/quietImage.png
        mv 0.png 0/quiet/quietImage.png
		cd ..
	fi
done
rm -rf /1/layer_animating_icons/config.xml