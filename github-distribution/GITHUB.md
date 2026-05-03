# Git Escape - GitHub发布

## 游戏信息
- 版本: 2026.05.03-09.27
- 发布日期: Sun May  3 09:27:04 AM CST 2026
- 关卡数量: 3

## 如何使用
1. 下载游戏包: git-escape-2026.05.03-09.27.tar.gz
2. 解压: `tar -xzf git-escape-*.tar.gz`
3. 运行: `cd build && ./git-escape.sh start`

## 游戏内容

### 关卡1: 文件操作迷宫
- 使用 ls/cat 找到密码文件
- 学习基本的Linux文件操作

### 关卡2: Git侦探
- 使用 git log 找出可疑提交者
- 学习Git历史分析

### 关卡3: 网络连接
- 使用 nc 连接端口获取数据
- 学习网络命令使用

## 完整上传步骤

### 1. 创建GitHub仓库
1. 登录GitHub
2. 点击右上角'+' -> New repository
3. 仓库名: git-escape-game
4. 描述: A command-line puzzle game teaching Git and Linux commands
5. 选择Public
6. 点击Create repository

### 2. 上传文件到仓库
1. 打开仓库页面 (https://github.com/[yourusername]/git-escape-game)
2. 点击'Add file' -> Upload files
3. 上传以下文件:
   - git-escape-2026.05.03-09.27.tar.gz (游戏包)
   - README.md (游戏说明)
   - config.yaml (关卡配置)
   - .github/workflows/auto-github.yml (自动化脚本)
4. 点击Commit changes

### 3. 创建Release
1. 点击'Create a new release'
2. Tag版本: v2026.05.03-09.27
3. 标题: Git Escape v2026.05.03-09.27
4. 描述: 命令行解谜游戏 - 通过执行真实的Linux/Git命令来破解关卡
5. 上传游戏包作为附件
6. 点击Publish release

### 4. 配置自动化
1. GitHub会自动启用Actions
2. 每次代码提交会自动构建
3. 每天8点自动发布新版本
4. 可以在Actions页面查看构建状态

## 自动化构建流程
游戏已经配置了自动化构建系统:
- 自动测试关卡逻辑
- 自动打包游戏
- 自动创建版本号
- 自动上传到GitHub Releases

## 开发计划
- Level 4: 权限管理 (chmod/chown)
- Level 5: 脚本编写 (bash脚本)
- Level 6: 数据加密解密

## 源代码
游戏源代码包含在压缩包中，包括:
- 游戏主脚本 (git-escape.sh)
- 关卡配置文件 (config.yaml)
- 关卡实现脚本 (levels/)
- 构建脚本 (build.sh)
- 上传脚本 (upload.sh)

## 许可证
MIT License