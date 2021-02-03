# 安装时显示的模块名称
mod_name="探•界主题&MIUI完美图标补全"
# 模块介绍
mod_install_desc="基于官方对完美图标进行补全/修复，可选MIUI探•界图标，补全图标来源酷安@PedroZ @潮留美海かり，可选MIUI探·界主题，感谢酷安@相见即是缘 @dwhsmcb协助制作此模块 "
# 安装时显示的提示
mod_install_info="是否安装$mod_name"
# 按下[音量+]选择的功能提示
mod_select_yes_text="使用MIUI经典主题并补全完美图标"
# 按下[音量+]后加入module.prop的内容
mod_select_yes_desc="使用MIUI经典主题并补全完美图标"
# 按下[音量-]选择的功能提示
mod_select_no_text="使用探界主题主题并补全完美图标"
# 按下[音量-]后加入module.prop的内容
mod_select_no_desc="使用探界主题主题并补全完美图标"
# 支持的设备，支持正则表达式
# mod_require_device="cancro|shamu|viper|keyaki_dsds|raphael"
# 支持的系统版本，持正则表达式
# mod_require_version="7.[0-1].[0-2]|9" #(7.0.0-7.1.2,9)

# 按下[音量+]时执行的函数
# 如果不需要，请保留函数结构和return 0

mod_install_yes()
{
	ui_print "   正在安装"
    mkdir -p $MODPATH/system/media/theme/miui_mod_icons/
    mkdir -p $MODPATH/system/media/theme/default/
    tar -xzvf $MODPATH/mods.tar.gz
    rm -rf $MODPATH/mods.tar.gz
    cp -r $MOD_FILES_DIR/2/* $MODPATH/system/media/theme/
    cd $MOD_FILES_DIR/1/
    $zip -m -r $MODPATH/system/media/theme/default/icons *  >/dev/null
    mv $MODPATH/system/media/theme/default/icons.zip $MODPATH/system/media/theme/default/icons
    set_perm_recursive  $MODPATH  0  0  0755  0644
    return 0
}

# 按下[音量-]时执行的函数
# 如果不需要，请保留函数结构和return 0
mod_install_no()
{
	ui_print "   正在安装"
    mkdir -p $MODPATH/system/media/theme/miui_mod_icons/
    mkdir -p $MODPATH/system/media/theme/default/
    tar -xzvf $MODPATH/mods.tar.gz
    rm -rf $MODPATH/mods.tar.gz
    cp -r $MOD_FILES_DIR/3/* $MODPATH/system/media/theme/
    cd $MOD_FILES_DIR/1/
    $zip -m -r $MODPATH/system/media/theme/default/icons *  >/dev/null
    mv $MODPATH/system/media/theme/default/icons.zip $MODPATH/system/media/theme/default/icons
    set_perm_recursive  $MODPATH  0  0  0755  0644
    return 0
}

# 对权限的附加说明
# 只有一些特殊文件需要特定的权限
# 下面是 set_perm 函数的一些示例:

# set_perm_recursive  <目录>                <所有者> <用户组> <目录权限> <文件权限> <上下文> (默认值是: u:object_r:system_file:s0)
# set_perm_recursive  $MODPATH/system/lib       0       0       0755        0644

# set_perm  <文件名>                         <所有者> <用户组> <文件权限> <上下文> (默认值是: u:object_r:system_file:s0)
# set_perm  $MODPATH/system/bin/app_process32   0       2000      0755       u:object_r:zygote_exec:s0
# set_perm  $MODPATH/system/bin/dex2oat         0       2000      0755       u:object_r:dex2oat_exec:s0
# set_perm  $MODPATH/system/lib/libart.so       0       0         0644

