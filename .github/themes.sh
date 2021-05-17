#!/bin/bash

XZ_OPT=-9 tar cJf icons.tar.xz icons

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
cp -rf ./icons.tar.xz ./output
cp -rf ./addition/default/default.tar.xz ./output
cp -rf ./themes/explore/explore.tar.xz ./output
cp -rf ./themes/lrone/lrone.tar.xz ./output
cp -rf ./themes/luck7/luck7.tar.xz ./output
cp -rf ./themes/perfectcurve/perfectcurve.tar.xz ./output
cp -rf ./themes/flyme9/flyme9.tar.xz ./output

cd ./output
:> icons.ini
:> default.ini
:> lrone.ini
:> explore.ini
:> luck7.ini
:> perfectcurve.ini
:> flyme9.ini
echo "file_size=`ls -l ./icons.tar.xz | awk '{print $5}'`" >> ./icons.ini
echo "file_size=`ls -l ./default.tar.xz | awk '{print $5}'`" >> ./default.ini
echo "file_size=`ls -l ./explore.tar.xz | awk '{print $5}'`" >> ./explore.ini
echo "file_size=`ls -l ./luck7.tar.xz | awk '{print $5}'`" >> ./luck7.ini
echo "file_size=`ls -l ./lrone.tar.xz | awk '{print $5}'`" >> ./lrone.ini
echo "file_size=`ls -l ./perfectcurve.tar.xz | awk '{print $5}'`" >> ./perfectcurve.ini
echo "file_size=`ls -l ./flyme9.tar.xz | awk '{print $5}'`" >> ./flyme9.ini
echo "URL=https://gitee.com/pedroz/MIUIicons/raw/main/icons.tar.xz" >> ./icons.ini
echo "URL=https://gitee.com/pedroz/MIUIicons/raw/main/default.tar.xz" >> ./default.ini
echo "URL=https://gitee.com/pedroz/MIUIicons/raw/main/flyme9.tar.xz" >> ./flyme9.ini
echo "URL=https://gitee.com/pedroz/MIUIicons/raw/main/lrone.tar.xz" >> ./lrone.ini
echo "URL=https://gitee.com/pedroz/MIUIicons/raw/main/luck7.tar.xz" >> ./luck7.ini
echo "URL=https://gitee.com/pedroz/MIUIicons/raw/main/explore.tar.xz" >> ./explore.ini
echo "URL=https://gitee.com/pedroz/MIUIicons/raw/main/perfectcurve.tar.xz" >> ./perfectcurve.ini
echo "md5=`md5sum ./icons.tar.xz|cut -d ' ' -f1`" >> ./icons.ini
echo "md5=`md5sum ./default.tar.xz|cut -d ' ' -f1 " >> ./default.ini
echo "md5=`md5sum ./explore.tar.xz|cut -d ' ' -f1 " >> ./explore.ini
echo "md5=`md5sum ./luck7.tar.xz|cut -d ' ' -f1 " >> ./luck7.ini
echo "md5=`md5sum ./lrone.tar.xz|cut -d ' ' -f1 " >> ./lrone.ini
echo "md5=`md5sum ./perfectcurve.tar.xz|cut -d ' ' -f1 " >> ./perfectcurve.ini
echo "md5=`md5sum ./flyme9.tar.xz|cut -d ' ' -f1 " >> ./flyme9.ini