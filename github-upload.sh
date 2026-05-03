#!/bin/bash
# Git Escape GitHub上传脚本

echo "=== Git Escape GitHub上传 ==="

# 获取最新版本包
LAST_BUILD=$(ls git-escape*.tar.gz | tail -n 1)
if [ -z "$LAST_BUILD" ]; then
    echo "错误：没有找到游戏包，请先运行 build.sh"
    exit 1
fi

VERSION=$(cat build/version.txt | cut -d= -f2)

echo "上传文件: $LAST_BUILD"
echo "版本: $VERSION"
echo "大小: $(du -h "$LAST_BUILD" | cut -f1)"

# 创建GitHub上传配置
echo "=== GitHub上传配置 ==="

# 检查git配置
echo "检查git配置..."
if [ -d ".git" ]; then
    echo "当前目录是git仓库"
    git status
else
    echo "当前目录不是git仓库"
fi

# 创建README和配置文件
echo "=== 准备GitHub上传 ==="

# 创建GitHub README
mkdir -p github_distribution

GITHUB_README="github_distribution/GITHUB.md"
echo "# Git Escape - GitHub发布" > "$GITHUB_README"
echo "" >> "$GITHUB_README"
echo "## 游戏信息" >> "$GITHUB_README"
echo "- 版本: $VERSION" >> "$GITHUB_README"
echo "- 发布日期: $(date)" >> "$GITHUB_README"
echo "- 关卡数量: 3" >> "$GITHUB_README"
echo "" >> "$GITHUB_README"
echo "## 如何使用" >> "$GITHUB_README"
echo "1. 下载游戏包" >> "$GITHUB_README"
echo "2. 解压: `tar -xzf git-escape-*.tar.gz`" >> "$GITHUB_README"
echo "3. 运行: `cd build && ./git-escape.sh start`" >> "$GITHUB_README"
echo "" >> "$GITHUB_README"
echo "## 游戏内容" >> "$GITHUB_README"
echo "### 关卡1: 文件操作迷宫" >> "$GITHUB_README"
echo "- 使用 ls/cat 找到密码文件" >> "$GITHUB_README"
echo "" >> "$GITHUB_README"
echo "### 关卡2: Git侦探" >> "$GITHUB_README"
echo "- 使用 git log 找出可疑提交者" >> "$GITHUB_README"
echo "" >> "$GITHUB_README"
echo "### 关卡3: 网络连接" >> "$GITHUB_README"
echo "- 使用 nc 连接端口获取数据" >> "$GITHUB_README"

# 复制游戏文件
cp "$LAST_BUILD" github_distribution/
cp README.md github_distribution/
cp config.yaml github_distribution/

echo "=== GitHub上传步骤 ==="
echo ""
echo "手动上传步骤："
echo ""
echo "1. 创建GitHub仓库："
echo "   - 登录GitHub"
echo "   - 点击右上角'+' -> New repository"
echo "   - 仓库名: git-escape-game"
echo "   - 描述: A command-line puzzle game teaching Git and Linux commands"
echo ""
echo "2. 上传文件到仓库："
echo "   - 打开仓库页面"
echo "   - 点击'Add file' -> Upload files"
echo "   - 上传文件: $LAST_BUILD"
echo "   - 上传README.md"
echo ""
echo "3. 创建Release："
echo "   - 点击'Create a new release'"
echo "   - Tag版本: v$VERSION"
echo "   - 标题: Git Escape v$VERSION"
echo "   - 描述: 命令行解谜游戏"
echo "   - 上传游戏包作为附件"
echo ""
echo "4. 配置自动化："
echo "   - 在.github/workflows中添加auto-build.yml"
echo "   - 启用Actions自动构建"

echo "=== 创建git仓库配置 ==="
echo ""
echo "如果要使用git直接上传："

# 创建.gitignore
GITIGNORE="github_distribution/.gitignore"
echo "# Git Escape" > "$GITIGNORE"
echo "build/" >> "$GITIGNORE"
echo "*.tar.gz" >> "$GITIGNORE"
echo "upload_history/" >> "$GITIGNORE"
echo "notifications/" >> "$GITIGNORE"

# 创建初始化脚本
GIT_INIT="github_distribution/git-init.sh"
echo "#!/bin/bash" > "$GIT_INIT"
echo "# Git初始化脚本" >> "$GIT_INIT"
echo "" >> "$GIT_INIT"
echo "echo '初始化git仓库...'" >> "$GIT_INIT"
echo "git init" >> "$GIT_INIT"
echo "git add ." >> "$GIT_INIT"
echo "git commit -m 'Initial commit: Git Escape v$VERSION'" >> "$GIT_INIT"
echo "git branch -M main" >> "$GIT_INIT"
echo "" >> "$GIT_INIT"
echo "echo '设置远程仓库...'" >> "$GIT_INIT"
echo "# 替换为你的GitHub仓库URL" >> "$GIT_INIT"
echo "git remote add origin https://github.com/username/git-escape-game.git" >> "$GIT_INIT"
echo "git push -u origin main" >> "$GIT_INIT"

echo "=== 上传准备完成 ==="
echo "所有文件已准备在 github_distribution 目录"
echo ""
echo "后续步骤："
echo "1. 将 github_distribution 目录复制到你的本地"
echo "2. 按照 GITHUB.md 中的步骤上传到GitHub"
echo "3. 或者使用 git-init.sh 自动初始化"

# 保存上传记录
mkdir -p upload_history
echo "$VERSION $(date) GitHub" >> upload_history/github.log