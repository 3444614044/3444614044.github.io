# GitHub Token使用指南

## 如何获取GitHub Token

### 步骤1: 登录GitHub
访问: https://github.com → Settings → Developer settings

### 步骤2: 生成Token
1. 点击 "Personal access tokens"
2. 点击 "Tokens (classic)"
3. 点击 "Generate new token"
4. Token name: "Git Escape Upload"
5. 选择权限:
   - repo (所有仓库权限)
   - workflow (工作流程权限)
6. 点击 "Generate token"
7. 复制生成的token

### 步骤3: 使用Token登录
```bash
gh auth login

# 选择:
# 1. GitHub.com
# 2. HTTPS
# 3. Paste an authentication token
# 4. 粘贴你的token
```

### 步骤4: 上传游戏
```bash
cd /root/.openclaw/workspace/git-escape

# 创建GitHub仓库
gh repo create git-escape-game \
  --public \
  --description "A command-line puzzle game teaching Git and Linux commands"

# 推送代码
git push origin main
```

## 自动化上传脚本

我已经创建了完整的游戏和上传系统。以下是完整流程：

### 已完成的准备工作
✅ Git仓库初始化完成
✅ 所有文件已提交
✅ GitHub Actions配置完成
✅ 游戏包已打包完成

### 需要你的操作
1. **生成GitHub Token** (按上述步骤)
2. **登录GitHub CLI**
3. **运行上传命令**

### 完整上传命令
```bash
# 登录GitHub CLI
gh auth login --with-token
# 粘贴你的token

# 创建仓库
gh repo create git-escape-game --public --description "命令行解谜游戏"

# 设置远程仓库
git remote add origin https://github.com/3444614044/git-escape-game.git

# 推送代码
git push -u origin main

# 创建Release
gh release create v1.0.0 \
  --title "Git Escape v1.0.0" \
  --notes "命令行解谜游戏 - 通过执行真实的Linux/Git命令来破解关卡"
```

## 备用方案

如果不想使用GitHub CLI，可以：

### 方案A: 手动上传网页版
1. 下载github-package.tar.gz
2. 解压: tar -xzf github-package.tar.gz
3. 访问: https://github.com/new
4. 上传所有文件

### 方案B: 直接分享游戏包
游戏包已准备好分发：
- git-escape-2026.05.03-09.27.tar.gz

可以使用HTTP服务器分享：
```bash
python3 -m http.server 8000 --directory local_distribution
```

## 自动化已配置

游戏已经配置了以下自动化：
✅ 定时构建: 每天8点自动构建
✅ GitHub Actions: 自动构建和发布
✅ 版本管理: 自动生成版本号
✅ 测试系统: 验证所有关卡逻辑

## 游戏特点

🎮 **教育性**: 每个关卡教授实用的命令行技能
🤖 **自动化**: 完全自动化开发流程
📦 **开源**: GitHub开源分享
🚀 **持续更新**: 定时任务确保游戏不断改进

## 立即上传

GitHub上传系统已经准备完毕。只需要提供GitHub Token，即可立即上传游戏！

GitHub Token比密码更安全：
✅ 有限权限
✅ 可随时撤销
✅ 有详细记录
✅ 通过GitHub CLI使用