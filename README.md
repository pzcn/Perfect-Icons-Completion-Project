# MIUI-Adapted-Icons-Complement-Project
[Magisk] MIUI 完美图标补全计划

使用Magisk 模块的形式，补全/修复 MIUI12中未适配以及适配不佳的图标。基于官方图标去除牛皮癣，制作成分层图标。

### 项目介绍

自 MIUI 12 起，MIUI 新增加了完美图标的特性。其依赖于MIUI绘制的部分图标以及图标自身的Adapted Icon。除可以实现分层效果外，还可以去除部分图标的牛皮癣。但这需要APP按照标准适配Adapted Icon，或者MIUI进行单独绘制。为了让更多APP获得这个特性，诞生了本项目。

在MIUI12的早期版本里，MIUI绘制的第三方桌面图标有较高的优先级。但是某次更新后，若APP有了Adapted Icon则优先调用，这就造成了部分显示效果不佳，包括但不限于支付宝、淘宝等，表现为包含牛皮癣（双十一、购物节等）、不按照规则适配（整张图片只有一层，底层为纯色等）。后发现将图标放入MIUI动画图标内则会获得最高优先级，此问题得以修复。

### 适配规则

对以下三种情况进行适配

1. MIUI完全没有对其进行适配的图标，且应用自身没有进行 Adapted Icon 的适配（即静态图标的效果）。

2. MIUI适配后不完美，整个图标都是前景的图标（移动图标即可看出），百度地图 前后景不分的图标

3. MIUI适配后有牛皮癣，比如 联通手机营业厅 包含有5G牛皮癣。


### 适配版本
Android 10 及以上的 MIUI 12

### 下载地址

[Release](https://github.com/pzcn/MIUI-Adapted-Icons-Complement-Project/releases)页面下载

### 申请/提交适配
申请适配 参考适配规则，带上包名、应用名 提交Issue，或在[酷安评论区](https://www.coolapk.com/feed/19929877)留言

提交适配，提交PR即可

### 适配指南
待补充

### 感谢
酷安  [@潮留美海かり](http://www.coolapk.com/u/3701042) 绘制补充了大量图标

酷安 [@相见即是缘](http://www.coolapk.com/u/1614257) [@dwhsmcb](http://www.coolapk.com/u/1662815) 协助制作了Magisk模块
