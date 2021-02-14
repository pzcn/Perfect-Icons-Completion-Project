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
		echo ${dir}
		mkdir -p 1/quiet
        mkdir -p 0/quiet
        mv 1.png 1/quiet/quietImage.png
        mv 0.png 0/quiet/quietImage.png
		cd ..
	fi
done
cd ../../..
rm -rf ./explore/explore1/layer_animating_icons/config.xml
mv explore icons
XZ_OPT=-9 tar cJf explore.tar.xz icons
rm -rf icons

cd lrone
mkdir -p lrone1/layer_animating_icons/
cp -r lrone_icons/miui_mod_icons/. lrone1/layer_animating_icons/
cp config.xml lrone1/layer_animating_icons/config.xml
cd lrone1/layer_animating_icons
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		cp config.xml ${dir}/config.xml
		cd ${dir}
		echo ${dir}
		mkdir -p 1/quiet
        mkdir -p 0/quiet
        mv 1.png 1/quiet/quietImage.png
        mv 0.png 0/quiet/quietImage.png
		cd ..
	fi
done
cd ../../..
rm -rf ./lrone/lrone1/layer_animating_icons/config.xml
mv lrone icons
XZ_OPT=-9 tar cJf lrone.tar.xz icons
rm -rf icons

cd luck7
mkdir -p luck71/layer_animating_icons/
cp -r luck7_icons/miui_mod_icons/. luck71/layer_animating_icons/
cp config.xml luck71/layer_animating_icons/config.xml
cd luck71/layer_animating_icons
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		cp config.xml ${dir}/config.xml
		cd ${dir}
		echo ${dir}
		mkdir -p 1/quiet
        mkdir -p 0/quiet
        mv 1.png 1/quiet/quietImage.png
        mv 0.png 0/quiet/quietImage.png
		cd ..
	fi
done
cd ../../..
rm -rf ./luck7/luck71/layer_animating_icons/config.xml
mv luck7 icons
XZ_OPT=-9 tar cJf luck7.tar.xz icons
rm -rf icons

cd ..
mkdir output
mv themes/*.tar.xz output