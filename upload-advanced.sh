#!/bin/bash
# Git Escape 高级上传脚本 - 支持多种上传方式

echo "=== Git Escape 高级上传 ==="

# 获取最新版本包
LAST_BUILD=$(ls git-escape*.tar.gz | tail -n 1)
if [ -z "$LAST_BUILD" ]; then
    echo "错误：没有找到游戏包，请先运行 build.sh"
    exit 1
fi

echo "上传文件: $LAST_BUILD"
echo "文件大小: $(du -h "$LAST_BUILD" | cut -f1)"

VERSION=$(cat build/version.txt | cut -d= -f2)

echo "=== 可选上传方式 ==="

# 方式1：COS上传（需要配置）
echo "1. 腾讯云COS上传"
echo "  需要配置COS技能"
echo "  目标路径: games/git-escape/$LAST_BUILD"
echo "  配置方法: 请查看 cos-config-guide.md"

# 方式2：GitHub Releases上传
echo "2. GitHub Releases上传"
echo "  需要GitHub API token"
echo "  可以使用gh命令行工具"
echo "  命令示例: gh release upload '$LAST_BUILD'"

# 方式3：本地HTTP服务器
echo "3. 本地HTTP服务器分发"
echo "  启动HTTP服务器分享"
echo "  命令示例: python3 -m http.server 8000"

# 方式4：直接发送文件
echo "4. 直接发送文件"
echo "  可以通过聊天工具直接发送文件"
echo "  文件位置: $LAST_BUILD"

echo ""
echo "=== 上传准备工作 ==="

# 创建详细的上传信息
mkdir -p upload_info

# 生成下载链接（假设配置了COS）
COS_URL="https://cos.example.com/games/git-escape/$LAST_BUILD"

# 创建上传记录
echo "=== 上传记录 ==="
echo "文件: $LAST_BUILD"
echo "版本: $VERSION"
echo "COS目标路径: games/git-escape/$LAST_BUILD"
echo "文件内容:"
tar -tzf "$LAST_BUILD" | head -10
echo ""
echo "游戏配置:"
cat config.yaml | grep -A5 "game:"

# 保存上传信息
mkdir -p upload_history
echo "$VERSION $(date)" >> upload_history/publish.log
echo "文件路径: $LAST_BUILD" >> upload_history/publish.log
echo "COS路径: games/git-escape/$LAST_BUILD" >> upload_history/publish.log

echo "=== 上传完成（模拟） ==="
echo ""
echo "实际上传需要："
echo "1. 配置腾讯云COS凭证"
echo "2. 或使用其他云存储服务"
echo "3. 或使用GitHub Releases"
echo ""
echo "上传信息已保存，可以手动上传"
echo "查看 cos-config-guide.md 获取配置指南"