#!/bin/bash
# GitHub上传脚本

echo "=== GitHub上传 ==="

# 检查是否在git目录
if [ ! -d ".git" ]; then
    echo "初始化git仓库..."
    git init
fi

# 添加文件到git
echo "添加文件..."
git add .

# 提交
echo "提交更改..."
git commit -m "Git Escape v$(cat build/version.txt | cut -d= -f2)"

# 检查是否连接到远程仓库
REMOTE_URL=$(git remote get-url origin 2>/dev/null)
if [ -z "$REMOTE_URL" ]; then
    echo "没有设置远程仓库"
    echo "请先创建GitHub仓库: https://github.com/new"
    echo "仓库名: git-escape-game"
    echo "然后运行: git remote add origin https://github.com/YOURUSERNAME/git-escape-game.git"
    exit 1
fi

# 推送到GitHub
echo "推送到GitHub..."
git push origin main

# 创建release
echo "创建GitHub release..."
VERSION=$(cat build/version.txt | cut -d= -f2)
LAST_BUILD=$(ls git-escape*.tar.gz | tail -n 1)

echo "版本: v$VERSION"
echo "文件: $LAST_BUILD"

echo "=== GitHub操作步骤 ==="
echo ""
echo "手动操作步骤:"
echo ""
echo "1. 登录GitHub: https://github.com"
echo "2. 创建仓库: https://github.com/new"
echo "   - 仓库名: git-escape-game"
echo "   - 描述: 命令行解谜游戏"
echo "   - Public仓库"
echo ""
echo "3. 上传文件:"
echo "   - 下载 github-package.tar.gz"
echo "   - 解压: tar -xzf github-package.tar.gz"
echo "   - 上传到GitHub仓库"
echo ""
echo "4. 创建release:"
echo "   - 点击Create a new release"
echo "   - Tag版本: v$VERSION"
echo "   - 标题: Git Escape v$VERSION"
echo "   - 附件上传游戏包: $LAST_BUILD"
echo ""
echo "=== GitHub CLI配置 ==="
echo ""
echo "如需使用GitHub CLI:"
echo "1. 安装GitHub CLI: sudo apt install gh"
echo "2. 登录: gh auth login"
echo "3. 创建仓库: gh repo create git-escape-game"
echo "4. 推送代码: git push origin main"
echo "5. 创建release: gh release create v$VERSION --title 'Git Escape v$VERSION'"

echo "=== 完成 ==="
echo "GitHub上传准备就绪"