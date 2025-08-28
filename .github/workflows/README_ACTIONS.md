# GitHub Actions 自动打包说明

本项目提供了两个自动打包 GitHub Actions workflow：

## 1. 基础版 (`auto_pack_module.yml`)

### 功能特点
- 自动打包所有模块和主题
- 支持手动触发和自动触发
- 生成构建信息
- 上传 artifacts
- 可选的 Release 发布

### 触发条件
- Push 到 `main` 或 `master` 分支，且修改了以下路径：
  - `icons/**`
  - `themes/**`
  - `addition/module/**`
- 手动触发（可选择是否创建 Release）

### 生成的文件
- `MIUI_Icons_Module.zip` - Magisk/KernelSU 模块
- `Default.mtz` - 默认主题包
- `Icons_Addon.zip` - 图标插件
- `Icons_Archiving.zip` - 归档图标
- `Explore.mtz` - Explore 主题包（如果存在）
- `Flyme9.mtz` - Flyme9 主题包（如果存在）
- `build_info.txt` - 构建信息

## 2. 高级版 (`auto_pack_module_advanced.yml`)

### 功能特点
- **并行构建**：使用矩阵策略并行打包不同的模块
- **缓存优化**：缓存依赖和中间文件，加快构建速度
- **Pull Request 支持**：在 PR 中也可以触发构建
- **云存储上传**：支持上传到配置的云存储
- **SHA256 校验**：生成文件校验和
- **推送通知**：构建完成后发送通知
- **自动 Release**：支持通过提交信息触发

### 触发条件
- Push 到主分支
- Pull Request（修改相关文件）
- 手动触发（可选择是否创建 Release 和上传云存储）
- 提交信息包含 `[release]` 时自动创建 Release

### 并行构建任务
- module（Magisk 模块）
- default-mtz（默认主题）
- addon（图标插件）
- archiving（归档图标）
- explore-mtz（Explore 主题）
- flyme9-mtz（Flyme9 主题）

## 使用方法

### 1. 配置 Secrets

在仓库设置中添加以下 Secrets（根据需要）：

- `GIT_TOKEN` - Git 访问令牌（如果需要推送到其他仓库）
- `GIT_USERS` - Git 用户名
- `PUSH_TOKEN` - 推送通知令牌
- `RCLONE_CONFIG` - rclone 配置（base64 编码）
- `coding_password` - Coding 仓库密码（如果使用）

### 2. 手动触发构建

1. 进入 Actions 页面
2. 选择对应的 workflow
3. 点击 "Run workflow"
4. 选择选项：
   - `release`: 是否创建 Release
   - `upload_to_cloud`: 是否上传到云存储（仅高级版）

### 3. 自动触发

修改以下文件会自动触发构建：
- `icons/` 目录下的图标文件
- `themes/` 目录下的主题文件
- `addition/module/` 目录下的模块文件

### 4. 创建 Release

#### 方法一：手动触发时选择
在手动触发时将 `release` 选项设置为 `true`

#### 方法二：提交信息触发（仅高级版）
在提交信息中包含 `[release]` 关键字，例如：
```bash
git commit -m "更新图标 [release]"
```

## 自定义配置

### 修改模块信息

编辑 `addition/module/module.prop` 文件：
```properties
id=MIUIiconsplus
name=MIUI完美图标补全
versionCode=1
author=@PedroZ
```

### 添加新的主题

1. 在 `themes/` 目录下创建新的主题文件夹
2. 在 workflow 中添加对应的打包逻辑
3. 如果使用高级版，在矩阵中添加新的任务

### 修改构建选项

- 压缩等级：修改 `zip -r -9` 中的 `-9` 参数
- XZ 压缩：修改 `XZ_OPT=-9` 的值
- 保留天数：修改 `retention-days` 的值

## 故障排除

### 构建失败
1. 检查文件路径是否正确
2. 确认所需的目录和文件存在
3. 查看 Actions 日志获取详细错误信息

### Release 创建失败
1. 确认有创建 Release 的权限
2. 检查 tag 名称是否已存在
3. 确认 workflow 有 `contents: write` 权限

### 云存储上传失败
1. 检查 `RCLONE_CONFIG` 是否正确配置
2. 确认云存储有足够的空间
3. 验证网络连接是否正常

## 最佳实践

1. **使用缓存**：高级版自动缓存依赖，可以显著提升构建速度
2. **并行构建**：高级版的并行构建可以减少总体构建时间
3. **定期清理**：Artifacts 默认保留 30 天，可根据需要调整
4. **版本管理**：使用语义化版本号，便于追踪更新
5. **测试 PR**：在合并前通过 PR 触发构建，确保没有问题

## 扩展功能

可以根据需要添加以下功能：
- 自动更新 changelog
- 发布到其他平台
- 生成更新日志
- 图标预览生成
- 自动化测试