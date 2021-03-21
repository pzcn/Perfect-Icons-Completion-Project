#!/bin/bash
# pack icons
mkdir -p ./addition/default/res/drawable-xxhdpi/
cp -rf icons/* ./addition/default/res/drawable-xxhdpi/
cd ./addition/default/
zip -r -9 icons.zip *  >/dev/null
cd ..

# pack module
cp -rf ./default/icons.zip ./module/icons
cd module
XZ_OPT=-9 tar cJf icons.tar.xz icons
rm -rf icons
zip -r -9 MIUI_Icons.zip *  >/dev/null
cd ..

# pack default mtz
cp -rf ./default/icons.zip ./mtz/default/icons
cd mtz/default
zip -r -9 Default.mtz *  >/dev/null
cd ../..
mv mtz/default/Default.mtz mtz/Default.mtz

# pack addon
cd Icons_Addon
zip -r -9 Icons_Addon.zip *  >/dev/null
cd ..

# pack archiving
cd Icons_Archiving
zip -r -9 Icons_Archiving.zip *  >/dev/null
cd ../..

# pack explore  mtz
mkdir -p mtztemp/explore/res/drawable-xxhdpi/
cp -rf icons/* mtztemp/explore/res/drawable-xxhdpi/
cp -rf themes/explore/icons/* mtztemp/explore/res/drawable-xxhdpi/
cp -rf themes/explore/layer_animating_icons mtztemp/explore/
cd mtztemp/explore/
zip -r -9 icons.zip *  >/dev/null
cd ../..

# pack explore mtz
cp -rf ./mtztemp/explore/icons.zip ./addition/mtz/explore/icons
cd addition/mtz/explore
zip -r -9 Explore.mtz *  >/dev/null
cd ../..
mv mtz/explore/Explore.mtz mtz/Explore.mtz
cd ..

# pack flyme9  mtz
mkdir -p mtztemp/flyme9/res/drawable-xxhdpi/
cp -rf icons/* mtztemp/flyme9/res/drawable-xxhdpi/
cp -rf themes/flyme9/icons/* mtztemp/flyme9/res/drawable-xxhdpi/
cp -rf themes/flyme9/layer_animating_icons mtztemp/flyme9/
cd mtztemp/flyme9/
zip -r -9 icons.zip *  >/dev/null
cd ../..

# pack flyme9 mtz
cp -rf ./mtztemp/flyme9/icons.zip ./addition/mtz/flyme9/icons
cd addition/mtz/flyme9
zip -r -9 flyme9.mtz *  >/dev/null
cd ../..
mv mtz/flyme9/flyme9.mtz mtz/Flyme9.mtz
cd ..