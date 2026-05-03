#!/bin/bash
# Git Escape 自动构建脚本

echo "=== Git Escape 自动构建 ==="

# 清理构建目录
rm -rf build
mkdir -p build

# 复制必要文件
echo "复制游戏文件..."
cp -r levels build/
cp git-escape.sh build/
cp config.yaml build/
cp README.md build/

# 创建版本信息
VERSION=$(date +"%Y.%m.%d-%H.%M")
echo "版本号: $VERSION"
echo "version=$VERSION" > build/version.txt

# 打包游戏
echo "打包游戏..."
tar -czf "git-escape-$VERSION.tar.gz" build/

# 生成构建报告
echo "=== 构建完成 ==="
echo "游戏版本: $VERSION"
echo "构建时间: $(date)"
echo "文件大小: $(du -h "git-escape-$VERSION.tar.gz" | cut -f1)"
echo ""
echo "已打包的文件:"
tar -tzf "git-escape-$VERSION.tar.gz"

# 运行测试
echo "=== 运行测试 ==="
cd tests
./test_level1.sh

echo "构建完成！游戏包: git-escape-$VERSION.tar.gz"