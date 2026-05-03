#!/bin/bash
# Git Escape - 修复版游戏入口脚本

set -e

# 游戏目录
GAME_DIR="$(dirname "$0")"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# 游戏状态文件
STATE_FILE="$GAME_DIR/.game_state"

# 函数：显示标题
show_title() {
    clear
    echo "${CYAN}================================================${NC}"
    echo "${BLUE}   Git Escape - 程序员解谜游戏${NC}"
    echo "${CYAN}================================================${NC}"
    echo ""
}

# 函数：显示帮助
show_help() {
    echo "${GREEN}使用方法：${NC}"
    echo "  ./git-escape.sh start    开始游戏"
    echo "  ./git-escape.sh help     显示帮助"
    echo ""
    echo "${GREEN}游戏命令：${NC}"
    echo "  help     显示帮助"
    echo "  ls      查看目录内容"
    echo "  cd      切换目录"
    echo "  cat     查看文件内容"
    echo "  quit    退出游戏"
    echo ""
}

# 函数：初始化关卡环境
setup_level1() {
    mkdir -p "$GAME_DIR/levels/level1"
    cd "$GAME_DIR/levels/level1"
    
    # 创建关卡文件结构
    mkdir -p secret_files
    echo "这不是密码文件" > not_the_password.txt
    echo "Escape123" > secret_files/secret.txt
    
    echo "${GREEN}关卡环境准备完毕！${NC}"
}

# 函数：运行关卡1
run_level1() {
    setup_level1
    
    echo "${BLUE}=== 关卡 1: 文件操作迷宫 ===${NC}"
    echo ""
    echo "${WHITE}目标：${NC}"
    echo "  找到名为 'secret.txt' 的文件并读取其中的密码"
    echo ""
    echo "${YELLOW}提示：${NC}"
    echo "  试试使用 ls 命令查看目录内容"
    echo "  文件可能隐藏在子目录中"
    echo "  密码文件的名字是 secret.txt"
    echo ""
    echo "${PURPLE}输入 'quit' 退出游戏${NC}"
    echo ""
    
    attempts=0
    solved=false
    
    while true; do
        echo "${CYAN}请输入命令：${NC}"
        read -p "$(echo -e "${WHITE}git-escape> ${NC}")" command
        
        if [ "$command" = "quit" ]; then
            echo "${YELLOW}退出关卡...${NC}"
            break
        fi
        
        if [ "$command" = "ls" ]; then
            ls
        elif [ "$command" = "ls -la" ]; then
            ls -la
        elif [ "$command" = "cd secret_files" ]; then
            cd secret_files
            echo "${GREEN}进入 secret_files 目录${NC}"
        elif [ "$command" = "cat secret.txt" ]; then
            if [ -f "secret.txt" ]; then
                cat secret.txt
                echo "${GREEN}恭喜！你找到了密码！${NC}"
                echo "${BLUE}密码是：Escape123${NC}"
                echo ""
                echo "${CYAN}=== 关卡完成！ ===${NC}"
                solved=true
                break
            else
                echo "${RED}文件不存在！你可能不在正确的目录${NC}"
            fi
        else
            echo "${RED}命令 '$command' 未识别${NC}"
            attempts=$((attempts + 1))
        fi
        
        if [ $attempts -ge 10 ]; then
            echo "${RED}尝试次数过多！关卡失败${NC}"
            break
        fi
        
        # 进度提示
        if [ $attempts -eq 3 ]; then
            echo "${YELLOW}提示：使用 ls 查看当前目录有哪些文件和目录${NC}"
        elif [ $attempts -eq 6 ]; then
            echo "${YELLOW}提示：密码文件藏在某个子目录里${NC}"
        fi
    done
    
    if [ "$solved" = true ]; then
        echo "${GREEN}恭喜完成关卡1！${NC}"
    else
        echo "${RED}关卡失败，请重试${NC}"
    fi
    
    # 回到游戏目录
    cd "$GAME_DIR"
}

# 主程序
case "$1" in
    start)
        show_title
        run_level1
        ;;
    help)
        show_title
        show_help
        ;;
    *)
        show_title
        echo "${RED}未知命令: $1${NC}"
        show_help
        ;;
esac

exit 0