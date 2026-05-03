#!/bin/bash
# Git Escape - 演示版本

echo "================================================"
echo "   Git Escape - 程序员解谜游戏"
echo "================================================"
echo ""
echo "=== 关卡 1: 文件操作迷宫 ==="
echo ""
echo "目标：找到名为 'secret.txt' 的文件并读取密码"
echo ""
echo "提示："
echo "1. 使用 ls 查看目录内容"
echo "2. 密码文件藏在某个子目录里"
echo "3. 密码文件的名字是 secret.txt"
echo ""
echo "开始关卡..."

# 创建关卡环境
mkdir -p levels/level1
cd levels/level1
mkdir -p secret_files
echo "这不是密码文件" > not_the_password.txt
echo "Escape123" > secret_files/secret.txt

attempts=0
solved=false

while true; do
    echo ""
    echo "请输入命令："
    read command
    
    if [ "$command" = "quit" ]; then
        echo "退出关卡..."
        break
    fi
    
    if [ "$command" = "ls" ]; then
        ls
    elif [ "$command" = "ls -la" ]; then
        ls -la
    elif [ "$command" = "cd secret_files" ]; then
        cd secret_files
        echo "进入 secret_files 目录"
    elif [ "$command" = "cat secret.txt" ]; then
        if [ -f "secret.txt" ]; then
            cat secret.txt
            echo "恭喜！你找到了密码！"
            echo "密码是：Escape123"
            echo ""
            echo "=== 关卡完成！ ==="
            solved=true
            break
        else
            echo "文件不存在！你可能不在正确的目录"
        fi
    else
        echo "命令 '$command' 未识别"
        attempts=$((attempts + 1))
    fi
    
    if [ $attempts -ge 10 ]; then
        echo "尝试次数过多！关卡失败"
        break
    fi
    
    # 进度提示
    if [ $attempts -eq 3 ]; then
        echo "提示：使用 ls 查看当前目录有哪些文件和目录"
    elif [ $attempts -eq 6 ]; then
        echo "提示：密码文件藏在某个子目录里"
    fi
done

if [ "$solved" = true ]; then
    echo "恭喜完成关卡1！"
else
    echo "关卡失败，请重试"
fi

# 回到游戏目录
cd ..
echo "游戏结束"