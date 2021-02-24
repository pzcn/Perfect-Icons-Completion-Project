#!/bin/bash
mkdir -p ./temp/res/drawable-xxhdpi/
cp -rf icons/icons/miui_mod_icons/* temp/res/drawable-xxhdpi/
cp -rf icons/MIUIdefault/miui_mod_icons/* temp/res/drawable-xxhdpi/
cp -rf icons/MIUIdefault/default/icons.zip ./temp
cd temp
zip -r -9 icons.zip res  >/dev/null
cd ..
mv ./temp/icons.zip ./modules/icons
cd modules
echo "version=${{ env.version }}" >> ./module.prop
echo "ver=${{ env.version }}" >> ./module.prop
zip -r -9 MIUI_Icons.zip *  >/dev/null
cd ..
cp -rf ./modules/MIUI_Icons.zip ./MIUI_Icons.zip