#!/bin/bash
# Git Escape - 命令行解谜游戏入口脚本

set -e

# 游戏目录
GAME_DIR="$(dirname "$0")"
CONFIG_FILE="$GAME_DIR/config.yaml"

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
SCORE_FILE="$GAME_DIR/.score"

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
    echo "  ./git-escape.sh level N  进入第N关"
    echo "  ./git-escape.sh status    查看游戏状态"
    echo "  ./git-escape.sh reset    重置游戏"
    echo "  ./git-escape.sh help     显示帮助"
    echo ""
    echo "${GREEN}关卡命令：${NC}"
    echo "  help     显示当前关卡的帮助"
    echo "  hint     获取提示"
    echo "  quit     退出当前关卡"
    echo ""
}

# 函数：初始化游戏
init_game() {
    if [ ! -f "$STATE_FILE" ]; then
        echo "${GREEN}初始化游戏...${NC}"
        mkdir -p "$GAME_DIR/levels"
        echo "current_level=1" > "$STATE_FILE"
        echo "attempts=0" >> "$STATE_FILE"
        echo "score=0" >> "$STATE_FILE"
        echo "${GREEN}游戏初始化完成！${NC}"
    fi
}

# 函数：读取游戏状态
read_state() {
    if [ -f "$STATE_FILE" ]; then
        current_level=$(grep "current_level" "$STATE_FILE" | cut -d= -f2)
        attempts=$(grep "attempts" "$STATE_FILE" | cut -d= -f2)
        score=$(grep "score" "$STATE_FILE" | cut -d= -f2)
    else
        current_level=1
        attempts=0
        score=0
    fi
}

# 函数：更新游戏状态
update_state() {
    echo "current_level=$current_level" > "$STATE_FILE"
    echo "attempts=$attempts" >> "$STATE_FILE"
    echo "score=$score" >> "$STATE_FILE"
}

# 函数：保存分数
save_score() {
    if [ -f "$SCORE_FILE" ]; then
        echo "$score" > "$SCORE_FILE"
    fi
}

# 函数：开始关卡
start_level() {
    level=$1
    show_title
    
    echo "${BLUE}=== 关卡 $level: 文件操作迷宫 ===${NC}"
    echo ""
    echo "${WHITE}目标：${NC}"
    echo "  找到名为 'secret.txt' 的文件并读取其中的密码"
    echo ""
    echo "${YELLOW}提示：${NC}"
    echo "  试试使用 ls 命令查看目录内容"
    echo "  文件可能隐藏在子目录中"
    echo "  密码文件的名字是 secret.txt"
    echo ""
    echo "${PURPLE}输入 'help' 查看帮助，输入 'hint' 获取更多提示${NC}"
    echo ""
    
    # 准备关卡环境
    mkdir -p "$GAME_DIR/levels/level$level"
    cd "$GAME_DIR/levels/level$level"
    
    # 创建关卡文件结构
    mkdir -p secret_files
    echo "这不是密码文件" > not_the_password.txt
    echo "Escape123" > secret_files/secret.txt
    
    echo "${GREEN}关卡环境准备完毕！输入命令开始探索...${NC}"
    echo ""
    
    # 关卡交互循环
    while true; do
        echo "${CYAN}请输入命令：${NC}"
        read -p "$(echo -e "${WHITE}git-escape> ${NC}")" command
        
        case "$command" in
            help)
                echo "${GREEN}关卡命令：${NC}"
                echo "  ls        查看目录内容"
                echo "  ls -la    查看详细目录信息"
                echo "  cd        切换目录"
                echo "  cat       查看文件内容"
                echo "  hint      获取更多提示"
                echo "  quit      退出当前关卡"
                ;;
            hint)
                echo "${YELLOW}提示：${NC}"
                echo "  使用 ls 查看当前目录有哪些文件和目录"
                echo "  进入子目录看看有什么"
                echo "  密码文件藏在某个子目录里"
                ;;
            quit)
                echo "${YELLOW}退出关卡...${NC}"
                return 1
                ;;
            ls)
                ls
                ;;
            ls -la)
                ls -la
                ;;
            cd secret_files)
                cd secret_files
                echo "${GREEN}进入 secret_files 目录${NC}"
                ;;
            cat secret.txt)
                if [ -f "secret.txt" ]; then
                    cat secret.txt
                    echo "${GREEN}恭喜！你找到了密码！${NC}"
                    echo "${BLUE}密码是：Escape123${NC}"
                    echo ""
                    echo "${CYAN}=== 关卡完成！ ===${NC}"
                    score=$((score + 100))
                    current_level=$((current_level + 1))
                    update_state
                    save_score
                    return 0
                else
                    echo "${RED}文件不存在！你可能不在正确的目录${NC}"
                fi
                ;;
            *)
                echo "${RED}命令 '$command' 未识别${NC}"
                attempts=$((attempts + 1))
                update_state
                ;;
        esac
        
        if [ $attempts -ge 10 ]; then
            echo "${RED}尝试次数过多！关卡失败${NC}"
            return 1
        fi
    done
}

# 函数：显示游戏状态
show_status() {
    read_state
    echo "${BLUE}游戏状态：${NC}"
    echo "  当前关卡: $current_level"
    echo "  尝试次数: $attempts"
    echo "  当前分数: $score"
    echo ""
    
    if [ -f "$SCORE_FILE" ]; then
        best_score=$(cat "$SCORE_FILE")
        echo "${GREEN}最佳分数: $best_score${NC}"
    fi
}

# 函数：重置游戏
reset_game() {
    echo "${YELLOW}重置游戏...${NC}"
    rm -f "$STATE_FILE"
    rm -f "$SCORE_FILE"
    rm -rf "$GAME_DIR/levels"
    echo "${GREEN}游戏已重置！${NC}"
}

# 主程序
case "$1" in
    start)
        init_game
        read_state
        start_level $current_level
        ;;
    level)
        if [ -z "$2" ]; then
            echo "${RED}请指定关卡号，例如: ./git-escape.sh level 1${NC}"
            exit 1
        fi
        start_level "$2"
        ;;
    status)
        show_status
        ;;
    reset)
        reset_game
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