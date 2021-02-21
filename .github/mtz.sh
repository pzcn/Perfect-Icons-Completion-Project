#!/bin/bash
mkdir -p temp/res/drawable-xxhdpi/
cp -rf icons/icons/miui_mod_icons/* temp/res/drawable-xxhdpi/
cp -rf icons/MIUIdefault/default/icons.zip ./
cp -rf icons/MIUIdefault/miui_mod_icons/* temp/res/drawable-xxhdpi/
zip -m -r ./icons.zip ./temp/*  >/dev/null
mv ./icons.zip ./mtz/icons
zip -m -r ./mtz/MIUI_Icons.zip ./mtz/icons  >/dev/null
mv ./mtz/MIUI_Icons.zip ./mtz/MIUI_Icons.mtz