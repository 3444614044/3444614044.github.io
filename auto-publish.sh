#!/bin/bash
# Git Escape 自动发布脚本

echo "=== Git Escape 自动发布 ==="

# 1. 自动构建
echo "步骤1: 自动构建..."
./build.sh

# 2. 检查构建结果
LAST_BUILD=$(ls git-escape*.tar.gz | tail -n 1)
if [ -z "$LAST_BUILD" ]; then
    echo "错误：构建失败"
    exit 1
fi

echo "构建成功：$LAST_BUILD"

# 3. 自动上传（模拟）
echo "步骤2: 准备上传..."
./upload.sh

# 4. 发送发布通知
echo "步骤3: 发送发布通知..."

VERSION=$(cat build/version.txt)
DOWNLOAD_URL="https://cos.example.com/games/git-escape-$VERSION.tar.gz"

echo "=== 发布信息 ==="
echo "游戏名称: Git Escape"
echo "版本: $VERSION"
echo "关卡数量: 3"
echo "发布时间: $(date)"
echo "下载链接: $DOWNLOAD_URL"
echo "文件大小: $(du -h "$LAST_BUILD" | cut -f1)"

# 5. 保存发布记录
mkdir -p publish_history
echo "$VERSION $(date)" >> publish_history/publish.log

echo "=== 自动发布完成 ==="
echo "游戏已准备好发布！"
echo ""
echo "实际发布流程："
echo "1. 配置COS技能 - 自动上传到云存储"
echo "2. 配置定时任务 - 每天自动构建"
echo "3. 配置消息通知 - 发布时自动通知"

# 创建定时任务配置
echo "=== 定时任务配置 ==="
echo "创建cron任务自动构建和发布："
echo "0 8 * * * cd /root/.openclaw/workspace/git-escape && ./auto-publish.sh"
echo ""
echo "如需真正自动化发布，请配置COS上传和消息通知"