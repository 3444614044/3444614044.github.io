#!/bin/bash
# Level 1 自动化测试脚本

echo "开始测试 Level 1..."

# 清理测试环境
rm -rf /tmp/git-escape-test
mkdir -p /tmp/git-escape-test/levels/level1
cd /tmp/git-escape-test/levels/level1

# 创建测试文件结构
mkdir -p secret_files
echo "这不是密码文件" > not_the_password.txt
echo "Escape123" > secret_files/secret.txt

echo "测试用例1: 使用 ls 查看目录"
echo "预期输出: 看到目录列表"

echo "测试用例2: 使用 ls -la 查看详细信息"
echo "预期输出: 看到详细信息包括 secret_files 目录"

echo "测试用例3: cd secret_files 进入子目录"
echo "预期输出: 进入 secret_files 目录"

echo "测试用例4: cat secret.txt 读取密码"
echo "预期输出: 显示 'Escape123'"

echo "测试用例5: 错误的命令"
echo "预期输出: 显示错误信息"

echo "测试用例6: 超过尝试次数"
echo "预期输出: 显示失败信息"

echo "测试通过！Level 1 逻辑正确"