#!/bin/bash
# Git Escape 简化上传脚本 - 无需COS配置

echo "=== Git Escape 简化上传 ==="

# 获取最新版本包
LAST_BUILD=$(ls git-escape*.tar.gz | tail -n 1)
if [ -z "$LAST_BUILD" ]; then
    echo "错误：没有找到游戏包，请先运行 build.sh"
    exit 1
fi

VERSION=$(cat build/version.txt | cut -d= -f2)

echo "文件: $LAST_BUILD"
echo "版本: $VERSION"
echo "大小: $(du -h "$LAST_BUILD" | cut -f1)"

# 创建简单的HTTP服务器目录
echo "=== 创建本地分发 ==="
mkdir -p local_distribution
cp "$LAST_BUILD" local_distribution/

# 生成下载信息
DOWNLOAD_INFO="local_distribution/download-info.md"
mkdir -p local_distribution
echo "### Git Escape v$VERSION" > "$DOWNLOAD_INFO"
echo "发布日期: $(date)" >> "$DOWNLOAD_INFO"
echo "关卡数量: 3" >> "$DOWNLOAD_INFO"
echo "" >> "$DOWNLOAD_INFO"
echo "### 下载方式" >> "$DOWNLOAD_INFO"
echo "1. 直接下载: 游戏文件位置: $LAST_BUILD" >> "$DOWNLOAD_INFO"
echo "2. 本地HTTP服务器:" >> "$DOWNLOAD_INFO"
echo "   ```bash" >> "$DOWNLOAD_INFO"
echo "   python3 -m http.server 8000" >> "$DOWNLOAD_INFO"
echo "   ```" >> "$DOWNLOAD_INFO"
echo "3. 手动分发: 可以发送给其他人" >> "$DOWNLOAD_INFO"
echo "" >> "$DOWNLOAD_INFO"
echo "### 游戏运行" >> "$DOWNLOAD_INFO"
echo "解压后运行: ./git-escape.sh start" >> "$DOWNLOAD_INFO"

# 启动HTTP服务器（可选）
echo "=== 可选HTTP服务器 ==="
echo "如果要启动HTTP服务器分享游戏，运行:"
echo "python3 -m http.server 8000 --directory local_distribution"

# 保存上传记录
mkdir -p upload_history
echo "$VERSION $(date) LOCAL" >> upload_history/publish.log

echo "=== 完成 ==="
echo "游戏文件已准备好分发"
echo "文件位置: $LAST_BUILD"
echo "可以使用以下方式分享:"
echo "1. 直接发送文件"
echo "2. 启动HTTP服务器"
echo "3. 手动复制到其他位置"

# 显示文件内容
echo "=== 游戏包内容 ==="
tar -tzf "$LAST_BUILD"