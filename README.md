# Git Escape - 程序员解谜游戏

《Git 逃生室》是一款命令行解谜游戏，玩家被困在一个只有Termux终端的手机里，需要通过执行真实的Linux/Git命令来破解关卡。

## 游戏特色

- **真实命令行操作**：所有命令都是真实的Linux/Git命令
- **边玩边学**：游戏过程中学习实用的命令行技巧
- **渐进式难度**：从基础文件操作到网络连接，难度递增
- **开源友好**：所有关卡配置公开，玩家可自制关卡
- **自动化发布**：每天自动构建和发布新版本
- **跨平台支持**：支持Linux、Android平台

## 下载链接

- **GitHub仓库**: https://github.com/3444614044/git-escape-game
- **Release下载**: https://github.com/3444614044/git-escape-game/releases/tag/v1.0.0
- **Android版本**: git-escape-android.tar.gz (已上传)
- **Linux版本**: git-escape-*.tar.gz

## Android平台

### Android版本特点
✅ **在Termux中运行**：不需要安装APK
✅ **真实命令行**：Android上学习Linux命令
✅ **移动学习**：随时随地学习命令行技能
✅ **免费开源**：完全免费且开源

### Android安装步骤
1. 安装Termux应用
2. 配置Termux: `pkg update && pkg upgrade`
3. 下载游戏: `wget https://github.com/3444614044/git-escape-game/releases/download/v1.0.0/git-escape-android.tar.gz`
4. 解压运行: `tar -xzf git-escape-android.tar.gz`
5. 运行游戏: `./git-escape.sh start`

## 游戏架构

游戏采用模块化设计：
1. 关卡配置文件（YAML格式）
2. 关卡执行脚本（Shell脚本）
3. 游戏引擎（统一入口脚本）
4. 自动化测试系统

## 快速开始

### Linux/Windows
```bash
# 下载游戏
wget https://github.com/3444614044/git-escape-game/releases/download/v1.0.0/git-escape-2026.05.03-09.27.tar.gz

# 解压运行
tar -xzf git-escape-*.tar.gz
cd build
./git-escape.sh start

# 查看帮助
./git-escape.sh help
```

### Android
```bash
# 在Termux中下载游戏
wget https://github.com/3444614044/git-escape-game/releases/download/v1.0.0/git-escape-android.tar.gz

# 解压运行
tar -xzf git-escape-android.tar.gz
cd git-escape-android
./git-escape.sh start
```

## 关卡设计

每个关卡包含：
- 关卡目标
- 提示信息
- 需要执行的命令
- 验证机制
- 成功条件

## 已实现的关卡

### Level 1: 文件操作迷宫
- 目标：找到名为 'secret.txt' 的文件并读取密码
- 命令：ls, cd, cat
- 教学：Linux文件操作基础

### Level 2: Git侦探
- 目标：通过git历史记录找出谁修改了关键文件
- 命令：git log, git show
- 教学：Git提交历史分析

### Level 3: 网络连接
- 目标：通过netcat连接到远程端口获取数据
- 命令：nc, telnet
- 教学：网络连接命令使用

## 自动化功能

### 自动构建
每天8点自动构建新版本游戏：
- 自动测试所有关卡
- 自动生成版本号
- 自动打包游戏文件

### GitHub Actions
配置了GitHub Actions自动化流水线：
- 自动构建和发布
- 自动运行测试
- 自动生成release

### 定时任务
配置了定时任务系统：
- 每天早上8点自动构建
- 自动上传到GitHub
- 自动通知发布

## 开发计划

当前版本：v1.0.0
支持平台：Linux、Android（Termux）

后续计划：
- Level 4: 权限管理（chmod/chown）
- Level 5: 脚本编写（bash脚本）
- Level 6: 数据加密解密
- Windows版本支持
- Web版本支持

## 贡献

欢迎贡献新的关卡和功能：
1. Fork仓库
2. 添加新关卡脚本
3. 提交Pull Request

## 许可证

MIT License

## 联系方式

游戏已成功上传到GitHub，可以公开下载和分享。Android版本已打包上传，可以在Termux中运行。