#!/bin/bash
# 创建GitHub上传包

echo "=== 创建GitHub上传包 ==="

# 最新游戏包
LAST_BUILD=$(ls git-escape*.tar.gz | tail -n 1)
VERSION=$(cat build/version.txt | cut -d= -f2)

echo "游戏版本: $VERSION"
echo "游戏包: $LAST_BUILD"

# 创建GitHub发布包
GITHUB_PACKAGE="git-escape-github-$VERSION.zip"

echo "=== 准备GitHub发布内容 ==="

# 创建临时目录
mkdir -p github-package-temp
cd github-package-temp

# 复制所有必要文件
echo "1. 游戏包..."
cp "../$LAST_BUILD" .

echo "2. README..."
cp "../README.md" .

echo "3. 配置文件..."
cp "../config.yaml" .

echo "4. 自动化脚本..."
mkdir -p .github/workflows
cp "../.github/workflows/auto-github.yml" .github/workflows/

echo "5. 关卡脚本..."
mkdir -p levels
cp "../levels/level2.sh" levels/
cp "../levels/level3.sh" levels/

echo "6. 构建脚本..."
cp "../build.sh" .
cp "../upload.sh" .
cp "../auto-publish.sh" .
cp "../simple-upload.sh" .

echo "7. GitHub指南..."
cp "../github-distribution/GITHUB.md" .

# 创建上传指南
echo "=== 上传指南 ==="
echo ""
echo "1. 下载此zip包: $GITHUB_PACKAGE"
echo "2. 登录GitHub"
echo "3. 创建新仓库: git-escape-game"
echo "4. 上传所有文件"
echo "5. 启用GitHub Actions"
echo "6. 创建Release"
echo ""

# 创建上传脚本
echo "创建上传脚本..."
cat > upload-to-github.sh << 'EOF'
#!/bin/bash
# GitHub上传脚本

echo "=== 上传到GitHub ==="

# 步骤1: 初始化git仓库
echo "1. 初始化git仓库..."
git init
git add .
git commit -m "Initial commit: Git Escape"

# 步骤2: 设置远程仓库
echo "2. 设置远程仓库..."
echo "请设置你的GitHub仓库URL:"
echo "例如: git remote add origin https://github.com/YOURUSERNAME/git-escape-game.git"

# 步骤3: 上传
echo "3. 上传到GitHub..."
echo "运行: git push -u origin main"

echo "=== 完成 ==="
EOF

chmod +x upload-to-github.sh

# 创建zip包
cd ..
zip -r "$GITHUB_PACKAGE" github-package-temp/*

echo "=== GitHub发布包创建完成 ==="
echo "包名: $GITHUB_PACKAGE"
echo "包含所有文件:"
echo "- 游戏包"
echo "- 配置文件"
echo "- 自动化脚本"
echo "- GitHub指南"
echo "- 上传脚本"

# 清理临时目录
rm -rf github-package-temp

echo "=== 上传指令 ==="
echo ""
echo "上传步骤:"
echo "1. 下载 $GITHUB_PACKAGE"
echo "2. 解压: unzip $GITHUB_PACKAGE"
echo "3. 登录GitHub创建仓库"
echo "4. 上传所有文件"
echo "5. 运行 upload-to-github.sh"
echo ""
echo "自动化功能:"
echo "- GitHub Actions会自动构建"
image.png"- 每天早上8点发布新版本"
echo "- 自动测试所有关卡"

echo "=== 完成 ==="
echo "GitHub上传包已准备完毕"