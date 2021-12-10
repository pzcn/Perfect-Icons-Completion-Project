# MIUI 完美图标补全计划

使用 Magisk 模块和 mtz 主题包的形式，补全/修复 MIUI12 中未适配以及适配不佳的图标。基于官方图标去除牛皮癣，制作成分层图标。本项目现已采用 Github Action 自动生成主题包。

[![Subscribe](https://img.shields.io/badge/Telegram-Subscribe-blue.svg?logo=telegram)](https://t.me/miuiicons)
[![Chat](https://img.shields.io/badge/Telegram-Chat-blue.svg?logo=telegram)](https://t.me/miui_icons_dev) 
[![Stars](https://img.shields.io/github/stars/pzcn/MIUI-Adapted-Icons-Complement-Project)](https://github.com/MIUI-Adapted-Icons-Complement-Projectreleases/)
[![Download](https://img.shields.io/github/downloads/pzcn/MIUI-Adapted-Icons-Complement-Project/total)](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/releases)
[![GitHub release](https://img.shields.io/github/v/release/pzcn/MIUI-Adapted-Icons-Complement-Project)](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/releases)
[![](https://data.jsdelivr.com/v1/package/gh/pzcn/IconsCDN/badge?style=rounded)](https://www.jsdelivr.com/package/gh/pzcn/IconsCDN)

----

### 项目介绍
自 MIUI 12 起，系统启动器新增了完美图标特性。其依赖于 MIUI 系统内置的部分图标以及图标自身的 Adapted Icon 特性。除可以实现分层效果外，还可以去除部分图标的牛皮癣。但这需要 APP 本身按照标准适配 Adapted Icon 或者 MIUI 系统对相应图标进行单独绘制来实现。为了让更多 APP 获得这个特性，诞生了本项目。

在 MIUI 12 早期版本中，MIUI 绘制的第三方桌面图标有着较高的优先级。但是某次更新后，若 APP 自身拥有 Adapted Icon，则会优先调用。这就造成了部分图标显示效果不佳，包括但不限于支付宝、淘宝等，表现为包含牛皮癣（双十一、购物节等）、不按照标准适配（整张图片只有一层、底层为纯色等）。

>  图标数量：![](https://img.shields.io/badge/dynamic/json?color=brightgreen&label=Icon%20count&query=%24.count&url=https%3A%2F%2Fmiui.netlify.app%2Fcount.json)

>  适配版本：Android 10 及以上的 MIUI 12

>  目前已包含 MIUI默认主题、探·界主题、Flyme9主题、LRONE主题，Luck7主题、完美曲线主题、EMUI主题、鸿蒙主题、ColorOS12主题，未来可能会添加更多其他主题。

----

### 使用方法
#### 1、Magisk 模块（推荐）

> 需使用 [安装器](https://www.coolapk.com/apk/dev.miuiicons.pedroz) ，支持自主选择主题包，联网下载最新资源后通过 `Magisk 模块`方式安装。还包含`检测更新`、`更新日志`、`图标预览`、`自定义图标`、`导出 Mtz 主题包`等多项功能。

#### 2、 Mtz 主题包（不推荐）

>  同其他 Mtz 主题一样，MIUI 国内版需要`设计师账号`或`主题破解`才可以正常使用。Mtz 使用相关问题请自行解决。
>  *注意：使用 Mtz 主题包方式部分机型和 MIUI 版本可能出现手势问题，参考下方`常见问题`。*

----

### 其他特性

##### 自定义图标

> 优先使用自己绘制的图标（仅支持`Magisk 模块`方式）。 [详细说明](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/wiki/%E9%99%84%E5%8A%A0%E6%A8%A1%E5%9D%97)

##### 图标存档

> 提供部分图标的其他样式，有需要的话解压后放入`自定义图标`使用。 [详细说明](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/wiki/%E5%9B%BE%E6%A0%87%E5%AD%98%E6%A1%A3) 

----

### 下载地址

安装器： [酷安下载](https://www.coolapk.com/apk/dev.miuiicons.pedroz) 
> `Magisk 模块`安装方式已经更改为使用`安装器`，旧版本模块不再提供更新。

----

### 常见问题

1. Q：mtz主题包出现了返回手势结束时直角变圆角现象，如何解决？

>   A：似乎是MIUI系统版本问题，目前发现的两种解决方法：①使用稳定版桌面，卸载内测桌面（部分机型依然无效）②不使用mtz，换用magisk模块。

2. Q：为什么xxx这个图标和原图标不太一样？

>  A：一部分图标去除了活动 Banner，另外图标则是手动修改的。为了保证良好的显示效果进行了重新绘制，我们无法保证与原图标完全一致。


3. Q：能把xx图标换成xx样式吗？

>  A：参考适配指南自行绘制，使用 [自定义图标](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/wiki/%E9%99%84%E5%8A%A0%E6%A8%A1%E5%9D%97) （仅支持 `Magisk 模块`方式）。

----

### 参与建设

您可以依据适配规则，申请适配或自行适配后提交。欢迎加入群组讨论参与模块建设。

#### 适配规则

对以下三种情况进行适配

> 1. MIUI 完全没有对其进行适配的，且应用自身没有进行 Adapted Icon 的适配（即静态图标的效果）。

> 2. MIUI 适配后不完美的，整个图标都是前景的图标（移动图标即可看出）,或如`百度地图`前后景不分的图标。

> 3. MIUI 适配后有牛皮癣的，比如`联通手机营业厅`包含有5G牛皮癣。

#### 申请适配

目前采用 `免费` +`付费` 的方式进行适配。

> 热门应用免费适配，其他应用按照0.5元/个的方式收费适配。
> 热门应用指`酷安`下载量高于10万的 APP。
> 在 QQ 群私聊群主进行适配 先适配后付款。

#### 适配指南、提交适配

适配指南见 [Wiki](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/wiki/适配指南)。

提交至 PR 或将文件发送至 [Telegram 群组](https://t.me/miui_icons_dev) / QQ 群内。

#### 参与讨论

[![Subscribe](https://img.shields.io/badge/Telegram-Subscribe-blue.svg?logo=telegram)](https://t.me/miuiicons)
[![Chat](https://img.shields.io/badge/Telegram-Chat-blue.svg?logo=telegram)](https://t.me/miui_icons_dev)

QQ群：561180493

----

### 致谢

#### 主题授权：

##### [LRONE主题](http://zhuti.xiaomi.com/detail/share/41f02867-78b0-457c-a134-b9eab07d7ac9?miref=share&packId=fcc4e5ff-1667-4689-a399-c5538c60f349) 授权：
[@江户川Conan](http://www.coolapk.com/u/1091207)

##### [Luck7主题](http://zhuti.xiaomi.com/detail/share/508a77a8-11ee-448c-9a1a-b51b0253de76?miref=share&packId=ca2c0d02-f34e-464b-818e-35063507afc2) 授权：
[@JellyBeans](http://www.coolapk.com/u/1375535) 

##### [完美曲线主题](http://zhuti.xiaomi.com/detail/share/6b9b4e54-9c13-4ee3-b5db-66daf0928bcf?miref=share&packId=fceeed6a-45dc-4a58-be11-12b2d370c315) 授权：
[@栗子汤圆Ria](http://www.coolapk.com/u/1375535)

#### 图标绘制：

[@潮留美海かり](http://www.coolapk.com/u/3701042) 自项目雏形起，合作绘制了大量图标。

[@Yife Playte](http://www.coolapk.com/u/2222314) 绘制了大量图标，校对了之前历史遗留的问题图标。

[@Eirperuier](http://www.coolapk.com/u/1780934) Luck7、完美曲线申请授权，累计自动化绘制了3000+图标。

[@Mastiff Li](http://www.coolapk.com/u/1305926) [@世界第一小莲儿](http://www.coolapk.com/u/1780934) @Shahzaib Ahmed

#### 技术支持：

[@相见即是缘](http://www.coolapk.com/u/1614257) [@dwhsmcb](http://www.coolapk.com/u/1662815) [@YuKongA](http://www.coolapk.com/u/680367) [@薛定谔の鼠](http://www.coolapk.com/u/1261690)
