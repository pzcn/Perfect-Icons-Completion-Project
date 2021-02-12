#!/bin/bash
XZ_OPT=-9 tar cJf icons.tar.xz ./icons
cd themes
mv lrone icons
XZ_OPT=-9 tar cJf themes/lrone.tar.xz icons
cd ..
zip -r MIUI_Icons-${{steps.tag_version.outputs.new_tag}}.zip ./common
zip -r MIUI_Icons-${{steps.tag_version.outputs.new_tag}}.zip ./META-INF
zip -r MIUI_Icons-${{steps.tag_version.outputs.new_tag}}.zip ./icons.tar.xz
zip -r MIUI_Icons-${{steps.tag_version.outputs.new_tag}}.zip ./module.prop