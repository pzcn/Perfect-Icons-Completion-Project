#!/bin/bash
mkdir -p ./temp/res/drawable-xxhdpi/
cp -rf icons/icons/miui_mod_icons/* temp/res/drawable-xxhdpi/
cp -rf icons/MIUIdefault/miui_mod_icons/* temp/res/drawable-xxhdpi/
cp -rf icons/MIUIdefault/default/icons.zip ./temp
cd temp
zip -m -r -9 icons.zip res  >/dev/null
cd ..
mv ./temp/icons.zip ./mtz/icons
cd mtz
zip -m -r -9 MIUI_Icons.zip icons  >/dev/null
cd ..
cp -rf ./mtz/MIUI_Icons.zip ./MIUI_Icons_CI_latest.mtz