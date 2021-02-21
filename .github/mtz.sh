#!/bin/bash
mkdir -p ./temp/res/drawable-xxhdpi/
cp -rf icons/icons/miui_mod_icons/* temp/res/drawable-xxhdpi/
cp -rf icons/MIUIdefault/default/icons.zip ./
cp -rf icons/MIUIdefault/miui_mod_icons/* temp/res/drawable-xxhdpi/
cd temp
zip -m -r -9 /home/runner/work/MIUI-Adapted-Icons-Complement-Project/MIUI-Adapted-Icons-Complement-Project/temp/icons.zip *  >/dev/null
cd ..
mv ./icons.zip ./mtz/icons
cd mtz
zip -m -r -9 /home/runner/work/MIUI-Adapted-Icons-Complement-Project/MIUI-Adapted-Icons-Complement-Project/mtz/MIUI_Icons.zip icons  >/dev/null
cd ..
cp -rf ./mtz/MIUI_Icons.zip ./MIUI_Icons_CI_latest.mtz