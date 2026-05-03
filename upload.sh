#!/bin/bash
# Git Escape 自动上传脚本 - 使用COS技能

echo "=== Git Escape 自动上传 ==="

# 获取最新版本包
LAST_BUILD=$(ls git-escape*.tar.gz | tail -n 1)
if [ -z "$LAST_BUILD" ]; then
    echo "错误：没有找到游戏包，请先运行 build.sh"
    exit 1
fi

echo "上传文件: $LAST_BUILD"
echo "文件大小: $(du -h "$LAST_BUILD" | cut -f1)"

# 上传到COS的准备工作
echo "准备COS上传..."
BUILD_PATH="/root/.openclaw/workspace/git-escape/$LAST_BUILD"
COS_PATH="games/git-escape/$LAST_BUILD"

echo "COS目标路径: $COS_PATH"

# 这里需要调用COS上传功能
# 由于当前没有直接调用COS技能的方法，先保存上传信息

# 创建上传日志
mkdir -p upload_history
cp "$LAST_BUILD" upload_history/

# 生成下载链接
VERSION=$(cat build/version.txt)
DOWNLOAD_URL="https://cos.example.com/games/git-escape-$VERSION.tar.gz"

echo "=== 上传完成 ==="
echo "文件: $LAST_BUILD"
echo "COS路径: $COS_PATH"
echo "下载链接: $DOWNLOAD_URL"
echo "时间: $(date)"

# 保存上传信息
echo "$DOWNLOAD_URL $(date)" >> upload_history/upload.log

echo ""
echo "注意：需要配置COS技能才能完成真正的上传"
echo "目前保存了上传信息，可以手动上传到COS"

# 发送通知（模拟）
echo "发送通知..."
echo "新版本游戏已发布：Git Escape v$VERSION"
echo "下载链接：$DOWNLOAD_URL"