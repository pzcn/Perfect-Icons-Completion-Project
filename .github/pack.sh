#!/bin/bash
# pack icons
mkdir -p ./addition/default/res/drawable-xxhdpi/
cp -rf icons/* ./addition/default/res/drawable-xxhdpi/
cd ./addition/default/
zip -r -9 icons.zip *  >/dev/null
cd ..
cp -rf ./default/icons.zip ./module/icons
cp -rf ./default/icons.zip ./mtz/icons

# pack module
cd module
echo version=${env.version} >> ./module.prop
echo ver=${env.version} >> ./module.prop
XZ_OPT=-9 tar cJf icons.tar.xz icons
rm -rf icons
zip -r -9 MIUI_Icons.zip *  >/dev/null
cd ..

# pack mtz
cd mtz
zip -r -9 MIUI_Icons.mtz *  >/dev/null
cd ..

# pack addon
cd Icons_Addon
zip -r -9 Icons_Addon.zip *  >/dev/null
cd ..

# pack archiving
cd Icons_Archiving
zip -r -9 Icons_Archiving.zip *  >/dev/null
cd ../..