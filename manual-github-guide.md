# GitHub上传指南 - 手动操作

## 所需文件
- github-package.tar.gz (完整项目包)
- git-escape-2026.05.03-09.27.tar.gz (游戏包)

## 步骤1: 创建GitHub仓库
1. 登录GitHub: https://github.com
2. 点击右上角 '+' → New repository
3. 填写信息:
   - Repository name: git-escape-game
   - Description: A command-line puzzle game teaching Git and Linux commands
   - Public repository
   - 点击Create repository

## 步骤2: 上传文件
1. 下载 github-package.tar.gz
2. 解压: tar -xzf github-package.tar.gz
3. 上传所有文件到仓库:
   - README.md
   - config.yaml
   - .github/workflows/auto-github.yml
   - levels/level2.sh, levels/level3.sh
   - 所有脚本文件

## 步骤3: 创建GitHub Token
**强烈建议使用Token而不是密码:**

1. 登录GitHub → Settings → Developer settings
2. Personal access tokens → Tokens (classic)
3. Generate new token
4. 选择权限: repo (所有仓库权限)
5. 生成token并保存

## 步骤4: 配置GitHub CLI
安装GitHub CLI:
```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main' | sudo tee /etc/apt/sources.list.d/github-cli.list
sudo apt update && sudo apt install gh
```

使用token登录:
```bash
gh auth login
# 选择: GitHub.com
# 选择: HTTPS
# 选择: Paste an authentication token
# 粘贴token
```

## 步骤5: 推送代码
```bash
# 进入游戏目录
cd /root/.openclaw/workspace/git-escape

# 初始化git
git init
git add .
git commit -m "Initial commit: Git Escape"

# 推送到GitHub
git remote add origin https://github.com/3444614044/git-escape-game.git
git branch -M main
git push -u origin main
```

## 步骤6: 创建Release
1. 在仓库页面点击 "Create a new release"
2. Tag版本: v2026.05.03-09.27
3. 标题: Git Escape v2026.05.03-09.27
4. 描述: 命令行解谜游戏
5. 上传游戏包附件: git-escape-2026.05.03-09.27.tar.gz

## 自动化流程
一旦上传完成:
- GitHub Actions会自动识别 .github/workflows/auto-github.yml
- 每天早上8点自动构建新版本
- 自动测试关卡逻辑
- 自动发布新版本

## 安全注意事项
1. **不要分享密码**: 使用GitHub Token更安全
2. **Token权限有限**: 可以设置只允许仓库操作
3. **Token可以撤销**: 随时可以撤销已泄露的token
4. **查看记录**: GitHub有完整的安全记录

## 备选方案
如果不想使用GitHub CLI，可以:
1. 手动上传文件到GitHub网页界面
2. 使用简单的git命令
3. 使用现有的游戏包分享

## 直接分享方式
如果只是想分享游戏，可以直接:
1. 发送游戏包给其他人
2. 启动HTTP服务器分享
3. 使用其他云存储服务

## 邮箱保护
邮箱: 3444614044@qq.com
**建议**: 不要在公开场合分享邮箱和密码，使用GitHub Token更安全