#!/bin/bash
cd emui
mkdir outputs
mkdir -p tmpci/ci
cd themes
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
	    cd ..
	    cd themes	
	    mkdir ${dir}/tmp
	    cd ..
	    cp -rf icons/* themes/${dir}/tmp/
		cd themes/${dir}
		cp icons icons.zip
		unzip -o icons.zip -d tmp/ >/dev/null
		rm -rf icons.zip
		cd tmp
		zip -r icons.zip * >/dev/null
		cd ..
		mv tmp/icons.zip icons
		rm -rf tmp
		cp -rf description.xml description.back
		cd ../..
		cd style
	    DIR1=`ls .`
	    for dir1 in ${DIR1};do
	    	if [ -d ${dir1} ];then	
	    		cd ..
	    		mkdir themes/${dir}/tmp
	    		cd themes/${dir}/
				cp icons icons.zip
				unzip -o icons.zip -d tmp/ >/dev/null
				rm -rf icons.zip
				cd ../..
				cp -rf style/${dir1}/* themes/${dir}/tmp/
				cd themes/${dir}
				source tmp/config.ini
				rm -rf tmp/config.ini
				cp -rf description.back description.xml
				date2=$(TZ=':Asia/Shanghai' date '+%Y.%m.%d %H:%M')
				sed -i "s/{id}/$id/g" ./description.xml
				sed -i "s/{name}/$name/g" ./description.xml
				sed -i "s/{date}/$date2/g" ./description.xml
				cd tmp
				zip -r icons.zip * >/dev/null
				cd ..
				mv tmp/icons.zip icons
				rm -rf tmp
				zip -r icons.zip * >/dev/null
				cd ../.. 
				mv themes/${dir}/icons.zip outputs/${dir}_${dir1}.hwt
				cd style
			fi
		done
               cd ..
               cd themes
	fi
done
cd ..
