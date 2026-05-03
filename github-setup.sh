#!/bin/bash
# GitHub配置脚本 - 使用安全方式

echo "=== GitHub配置 ==="

# 建议使用GitHub Token而不是密码
echo "推荐使用GitHub Token而不是密码，更安全"

echo "=== 配置步骤 ==="

# 创建GitHub配置文件
echo "创建GitHub配置信息..."
echo "GitHub配置信息已记录"
echo "邮箱: 3444614044@qq.com"

echo ""
echo "=== GitHub Token生成步骤 ==="
echo "1. 登录GitHub"
echo "2. 点击头像 → Settings → Developer settings"
echo "3. 点击Personal access tokens → Tokens (classic)"
echo "4. 点击Generate new token"
echo "5. 选择权限: repo (所有仓库权限)"
echo "6. 生成token"
echo "7. 保存token到安全位置"

echo ""
echo "=== GitHub CLI配置 ==="
echo "安装GitHub CLI:"
echo "curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg"
echo "echo 'deb [signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main' | sudo tee /etc/apt/sources.list.d/github-cli.list"
echo "sudo apt update && sudo apt install gh"

echo ""
echo "=== 使用token登录 ==="
echo "运行: gh auth login"
echo "选择: GitHub.com"
echo "选择: HTTPS"
echo "选择: Paste an authentication token"
echo "粘贴你的token"

echo ""
echo "=== 上传游戏 ==="
echo "登录后，运行以下命令上传游戏:"
echo "cd /root/.openclaw/workspace/git-escape"
echo "gh repo create git-escape-game --public --description '命令行解谜游戏'"
echo "git init"
echo "git add ."
echo "git commit -m 'Initial commit'"
echo "git branch -M main"
echo "git push -u origin main"

echo ""
echo "=== 安全注意事项 ==="
echo "1. 不要直接在聊天中分享密码"
echo "2. 使用GitHub Token更安全"
echo "3. Token有明确的权限控制"
echo "4. 可以随时撤销token"

echo "=== 配置完成 ==="