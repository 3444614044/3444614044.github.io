#!/bin/bash
# Git Escape 简化自动构建和发布

echo "=== Git Escape 自动构建系统 ==="
echo "开始时间: $(date)"

# 检查是否需要构建
echo "检查上次构建时间..."
LAST_BUILD_TIME=$(cat upload_history/publish.log | tail -n1 | cut -d' ' -f2-3)
if [ -n "$LAST_BUILD_TIME" ]; then
    echo "上次构建: $LAST_BUILD_TIME"
else
    echo "首次构建"
fi

# 运行构建
echo "=== 构建游戏 ==="
./build.sh

# 简化上传
echo "=== 本地分发 ==="
./simple-upload.sh

# 创建发布通知
echo "=== 创建发布通知 ==="
mkdir -p notifications

NOTIFICATION="notifications/$(date +%Y%m%d).txt"
echo "Git Escape v$(cat build/version.txt | cut -d= -f2) 已构建完成" > "$NOTIFICATION"
echo "构建时间: $(date)" >> "$NOTIFICATION"
echo "文件位置: $(ls git-escape*.tar.gz | tail -n 1)" >> "$NOTIFICATION"
echo "关卡数量: 3" >> "$NOTIFICATION"
echo "运行命令: ./git-escape.sh start" >> "$NOTIFICATION"
echo "" >> "$NOTIFICATION"
echo "本地HTTP服务器: python3 -m http.server 8000" >> "$NOTIFICATION"

echo "=== 构建完成 ==="
echo "游戏已构建完成并准备分发"
echo "查看 notifications/$(date +%Y%m%d).txt 获取详细信息"

# 显示构建统计
echo "=== 统计信息 ==="
echo "版本: $(cat build/version.txt | cut -d= -f2)"
echo "文件大小: $(du -h git-escape*.tar.gz | tail -n 1 | cut -f1)"
echo "构建耗时: $(date)"
echo ""
echo "下一步:"
echo "1. 测试游戏: ./git-escape.sh start"
echo "2. 分发游戏: 使用 simple-upload.sh"
echo "3. 添加更多关卡: 创建新的level文件"