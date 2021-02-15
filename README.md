# MIUI-Adapted-Icons-Complement-Project
[Magisk] MIUI 完美图标补全计划

[![Subscribe](https://img.shields.io/badge/Telegram-Subscribe-blue.svg?logo=telegram)](https://t.me/miuiicons)
[![Chat](https://img.shields.io/badge/Telegram-Chat-blue.svg?logo=telegram)](https://t.me/miui_icons_dev)
[![Stars](https://img.shields.io/github/stars/pzcn/MIUI-Adapted-Icons-Complement-Project)](https://github.com/MIUI-Adapted-Icons-Complement-Projectreleases/Zhiliao)

使用 Magisk 模块的形式，补全/修复 MIUI12 中未适配以及适配不佳的图标。基于官方图标去除牛皮癣，制作成分层图标。

### 项目介绍

自 MIUI 12 起，MIUI 新增加了完美图标的特性。其依赖于 MIUI 绘制的部分图标以及图标自身的 Adapted Icon。除可以实现分层效果外，还可以去除部分图标的牛皮癣。但这需要APP按照标准适配 Adapted Icon，或者 MIUI 进行单独绘制。为了让更多 AP P获得这个特性，诞生了本项目。

在 MIUI12 的早期版本里，MIUI 绘制的第三方桌面图标有较高的优先级。但是某次更新后，若 APP 有了 Adapted Icon 则优先调用自带图标，这就造成了部分显示效果不佳，包括但不限于支付宝、淘宝等，表现为包含牛皮癣（双十一、购物节等）、不按照规则适配（整张图片只有一层，底层为纯色等）。为解决图标显示优先级问题，简化目录结构，本项目已采用 Github Action 自动生成模块，目前显示均为最高优先级。

目前包含了 MIUI默认主题、探·界主题、LRONE主题，未来可能会添加更多其他主题。

### 适配规则

对以下三种情况进行适配

1. MIUI完全没有对其进行适配的图标，且应用自身没有进行 Adapted Icon 的适配（即静态图标的效果）。

2. MIUI适配后不完美，整个图标都是前景的图标（移动图标即可看出），百度地图 前后景不分的图标

3. MIUI适配后有牛皮癣，比如 联通手机营业厅 包含有5G牛皮癣。


### 适配版本
Android 10 及以上的 MIUI 12

### 下载地址

[Release](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/releases)页面下载

[Telegram 频道](https://t.me/miuiicons) 获取最新的开发版本

[蓝奏云镜像](https://www.lanzoux.com/b06xxglhc) 包含手动同步的 Release 版本，同步可能不及时


### 申请/提交适配，参与讨论

申请适配 参考适配规则，带上包名、应用名 提交Issue

如果APP自己更换了图标，欢迎提出

在[酷安评论区](https://www.coolapk.com/feed/19929877)留言

加入[Telegram 群组](https://t.me/miui_icons_dev) 参与讨论，提出建议，申请适配

### 适配指南、提交适配

适配指南见 [Wiki](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/wiki/适配指南)

提交适配 提交PR或将文件发送至 [Telegram 群组](https://t.me/miui_icons_dev) 内

### 常见问题

1. Q：为什么应用锁/通知栏/设置等 APP 内不显示完美图标？

   A：完美图标逻辑仅在桌面内会调用，部分没有 Adapt Icon 的 APP也会显示在设置/通知栏中，但是除了桌面其他位置若无法显示，这是已知问题，暂时没有找到简单的解决方案。


2. Q：为什么xxx这个图标和原图标不太一样？

   A：一部分图标去除了活动banner，另外图标是手动修改的，为了保证良好的显示效果进行了重新绘制，无法保证和原图标完全一致。


3. Q：能把xx图标换成xx样式吗？

   A：不能，请自行修改。


### 致谢

[LRONE主题](http://zhuti.xiaomi.com/detail/share/41f02867-78b0-457c-a134-b9eab07d7ac9?miref=share&packId=fcc4e5ff-1667-4689-a399-c5538c60f349)授权：
[@江户川Conan](http://www.coolapk.com/u/1091207) 

图标绘制：
[@潮留美海かり](http://www.coolapk.com/u/3701042) [@Yife Playte](http://www.coolapk.com/u/2222314) @Eirperuier @Mastiff Li

技术支持：
[@相见即是缘](http://www.coolapk.com/u/1614257) [@dwhsmcb](http://www.coolapk.com/u/1662815) [@余空_YuK](http://www.coolapk.com/u/680367) [@薛定谔の鼠](http://www.coolapk.com/u/1261690)

@MIUI
