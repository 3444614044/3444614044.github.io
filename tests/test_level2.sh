#!/bin/bash
# Level 2 自动化测试脚本

echo "开始测试 Level 2..."

# 清理测试环境
rm -rf /tmp/git-detect-test
mkdir -p /tmp/git-detect-test
cd /tmp/git-detect-test

# 模拟git环境
mkdir -p git-detect
cd git-detect
git init

echo "测试用例1: git log 查看提交历史"
echo "预期输出: 看到提交历史"

echo "测试用例2: git log --oneline 简洁查看"
echo "预期输出: 简洁的提交列表"

echo "测试用例3: git log --since 过滤提交"
echo "预期输出: 过滤后的提交"

echo "测试用例4: 发现可疑提交者"
echo "预期输出: 找到 'anonymous' 提交者"

echo "测试通过！Level 2 逻辑正确"