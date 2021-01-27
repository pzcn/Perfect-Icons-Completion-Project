##########################################################################################
#
# Magisk多合一模块安装脚本
#
##########################################################################################

VERSION="1.1.4"

# 调试模式标记
DEBUG_FLAG=false

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

var_device="`grep_prop ro.product.*device`"
var_version="`grep_prop ro.build.version.release`"

##########################################################################################
#
# Function Callbacks
#
# The following functions will be called by the installation framework.
# You do not have the ability to modify update-binary, the only way you can customize
# installation is through implementing these functions.
#
# When running your callbacks, the installation framework will make sure the Magisk
# internal busybox path is *PREPENDED* to PATH, so all common commands shall exist.
# Also, it will make sure /data, /system, and /vendor is properly mounted.
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! DO NOT use any Magisk internal paths as those are NOT public API.
# ! DO NOT use other functions in util_functions.sh as they are NOT public API.
# ! Non public APIs are not guranteed to maintain compatibility between releases.
#
# Available variables:
#
# MAGISK_VER (string): the version string of current installed Magisk
# MAGISK_VER_CODE (int): the version code of current installed Magisk
# BOOTMODE (bool): true if the module is currently installing in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module's installation zip
# ARCH (string): the architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device
#
# Availible functions:
#
# ui_print <msg>
#     print <msg> to console
#     Avoid using 'echo' as it will not display in custom recovery's console
#
# abort <msg>
#     print error message <msg> to console and terminate installation
#     Avoid using 'exit' as it will skip the termination cleanup steps
#
# set_perm <target> <owner> <group> <permission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     this function is a shorthand for the following commands
#       chown owner.group target
#       chmod permission target
#       chcon context target
#
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context
#
##########################################################################################
##########################################################################################
# If you need boot scripts, DO NOT use general boot scripts (post-fs-data.d/service.d)
# ONLY use module scripts as it respects the module status (remove/disable) and is
# guaranteed to maintain the same behavior in future Magisk releases.
# Enable boot scripts by setting the flags in the config section above.
##########################################################################################

print_modname() {
  # 在这里设置你想要在模块安装过程中显示的信息
  ui_print "*******************************"
  ui_print "*******************************"
  ui_print "  你的设备: $var_device"
  ui_print "  系统版本: $var_version"
  ui_print "  多合一模板: $VERSION"
}
  
initmods()
{
  mod_name=""
  mod_install_info=""
  mod_select_yes_text=""
  mod_select_yes_desc=""
  mod_select_no_text=""
  mod_select_no_desc=""
  mod_require_device=""
  mod_require_version=""
  INSTALLED_FUNC="`trim $INSTALLED_FUNC`"
  MOD_SKIP_INSTALL=false
  cd $TMPDIR/mods
}

keytest() {
  ui_print "- 音量键测试 -"
  ui_print "   请按下 [音量+] 键："
  ui_print "   无反应或传统模式无法正确安装时，请触摸一下屏幕后继续"
  (/system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > $TMPDIR/events) || return 1
  return 0
}

chooseport() {
  #note from chainfire @xda-developers: getevent behaves weird when piped, and busybox grep likes that even less than toolbox/toybox grep
  while (true); do
    /system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > $TMPDIR/events
    if (`cat $TMPDIR/events 2>/dev/null | /system/bin/grep VOLUME >/dev/null`); then
      break
    fi
  done
  if (`cat $TMPDIR/events 2>/dev/null | /system/bin/grep VOLUMEUP >/dev/null`); then
    return 0
  else
    return 1
  fi
}

chooseportold() {
  # Calling it first time detects previous input. Calling it second time will do what we want
  $KEYCHECK
  $KEYCHECK
  SEL=$?
  $DEBUG_FLAG && ui_print "  DEBUG: chooseportold: $1,$SEL"
  if [ "$1" == "UP" ]; then
    UP=$SEL
  elif [ "$1" == "DOWN" ]; then
    DOWN=$SEL
  elif [ $SEL -eq $UP ]; then
    return 0
  elif [ $SEL -eq $DOWN ]; then
    return 1
  else
    abort "   未检测到音量键!"
  fi
}

on_install() {
  # 解压文件
  unzip -o "$ZIPFILE" 'mods/*' -d "$TMPDIR/" >&2
  # 公用函数
  source $TMPDIR/util_funcs.sh

  # Keycheck binary by someone755 @Github, idea for code below by Zappo @xda-developers
  KEYCHECK=$TMPDIR/keycheck
  chmod 755 $KEYCHECK
  zip=$TMPDIR/zip
  chmod 755 $zip
  # 测试音量键
  if keytest; then
    VOLKEY_FUNC=chooseport
    ui_print "*******************************"
  else
    VOLKEY_FUNC=chooseportold
    ui_print "*******************************"
    ui_print "- 检测到遗留设备！使用旧的 keycheck 方案 -"
    ui_print "- 进行音量键录入 -"
    ui_print "   录入：请按下 [音量+] 键："
    $VOLKEY_FUNC "UP"
    ui_print "   已录入 [音量+] 键。"
    ui_print "   录入：请按下 [音量-] 键："
    $VOLKEY_FUNC "DOWN"
    ui_print "   已录入 [音量-] 键。"
  ui_print "*******************************"
  fi

  # 替换文件夹列表
  REPLACE="/system/media/theme/miui_mod_icons
  "

  # 已安装模块
  MODS_SELECTED_YES=""
  MODS_SELECTED_NO=""
  
  # 加载可用模块
  initmods
  for MOD in $(ls)
  do
    if [ -f $MOD/mod_info.sh ]; then
      MOD_FILES_DIR="$TMPDIR/mods/$MOD/files"
      source $MOD/mod_info.sh
      $DEBUG_FLAG && ui_print "  DEBUG: load $MOD"
      $DEBUG_FLAG && ui_print "  DEBUG: mod's name: $mod_name"
      $DEBUG_FLAG && ui_print "  DEBUG: mod's device requirement: $mod_require_device"
      $DEBUG_FLAG && ui_print "  DEBUG: mod's version requirement: $mod_require_version"
      if [ -z $mod_require_device ]; then
        mod_require_device=$var_device
        $DEBUG_FLAG && ui_print "  DEBUG: replace mod's device requirement: $mod_require_device"
      fi
      if [ -z $mod_require_version ]; then
        mod_require_version=$var_version
        $DEBUG_FLAG && ui_print "  DEBUG: replace mod's version requirement: $mod_require_version"
      fi
      if $MOD_SKIP_INSTALL ; then
        ui_print "  跳过[$mod_name]安装"
        initmods
        continue
      fi
      if [ "`echo $var_device | egrep $mod_require_device`" = "" ]; then
        ui_print "   [$mod_name]不支持你的设备。"
      elif [ "`echo $var_version | egrep $mod_require_version`" = "" ]; then
        ui_print "   [$mod_name]不支持你的系统版本。"
      else
        ui_print "  [$mod_name]安装"
        ui_print "  - 介绍: $mod_install_desc"
        ui_print "  - 请按音量键选择$mod_install_info -"
        ui_print "   [音量+]：$mod_select_yes_text"
        ui_print "   [音量-]：$mod_select_no_text"
        if $VOLKEY_FUNC; then
          ui_print "   已选择[$mod_select_yes_text]。"
          mod_install_yes
          run_result=$?
          if [ $run_result -eq 0 ]; then
            MODS_SELECTED_YES="$MODS_SELECTED_YES ($MOD)"
            INSTALLED_FUNC="$mod_select_yes_desc $INSTALLED_FUNC"
          else
            ui_print "   失败。错误: $run_result"
          fi
        else
          ui_print "   已选择[$mod_select_no_text]。"
          mod_install_no
          run_result=$?
          if [ $run_result -eq 0 ]; then
            MODS_SELECTED_NO="$MODS_SELECTED_NO ($MOD)"
            INSTALLED_FUNC="$mod_select_no_desc $INSTALLED_FUNC"
          else
            ui_print "   失败。错误: $run_result"
          fi
        fi
      fi
    else
      $DEBUG_FLAG && ui_print "  DEBUG: could not found $MOD's mod_info.sh"
    fi
    initmods
  done

  if [ -z "$INSTALLED_FUNC" ]; then
    ui_print "未安装任何功能 即将退出安装..."
    rm -rf $TMPDIR
    exit 1
  fi
  ui_print "*******************************"
  ui_print "   注意"
  ui_print "   仅在MIUI默认主题下才有效果"
  ui_print "   即使选择探界也需要切换到默认主题"
  ui_print "   进入桌面后需要几秒时间进行加载"
  ui_print "*******************************"

  echo "description=安装的功能：$INSTALLED_FUNC" >> $TMPDIR/module.prop
}
