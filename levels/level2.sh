#!/bin/bash
# Level 2: Git侦探关卡

echo "${BLUE}=== 关卡 2: Git侦探 ===${NC}"
echo ""
echo "${WHITE}目标：${NC}"
echo "  通过git历史记录找出谁修改了关键文件"
echo ""
echo "${YELLOW}提示：${NC}"
echo "  使用 git log 查看提交历史"
echo "  注意提交时间和提交者"
echo "  寻找异常的文件修改"
echo ""
echo "${PURPLE}输入 'help' 查看帮助，输入 'hint' 获取更多提示${NC}"
echo ""

# 准备git环境
mkdir -p git-detect
cd git-detect

# 初始化git仓库
git init

# 创建文件并提交
echo "这是一个正常文件" > normal.txt
git add .
git commit -m "Initial commit" --author="Alice <alice@example.com>"

# 创建关键文件
echo "重要数据：Project Blue" > important.txt
git add important.txt
git commit -m "Add important file" --author="Alice <alice@example.com>"

# 修改关键文件（可疑操作）
echo "重要数据：Project Blue (modified)" > important.txt
git add important.txt
git commit -m "Update important data" --author="anonymous <anonymous@unknown>"

# 创建另一个文件
echo "次要文件" > secondary.txt
git add .
git commit -m "Add secondary file" --author="Bob <bob@example.com>"

echo "${GREEN}Git环境准备完毕！输入命令开始分析...${NC}"
echo ""

attempts=0
while true; do
    echo "${CYAN}请输入命令：${NC}"
    read -p "$(echo -e "${WHITE}git-detect> ${NC}")" command
    
    case "$command" in
        help)
            echo "${GREEN}可用命令：${NC}"
            echo "  git log             查看提交历史"
            echo "  git log --oneline   查看简洁提交历史"
            echo "  git log --since     查看特定时间后的提交"
            echo "  git show            查看具体提交内容"
            echo "  hint                获取更多提示"
            echo "  quit                退出关卡"
            ;;
        hint)
            echo "${YELLOW}更多提示：${NC}"
            echo "  关注提交者的名称"
            echo "  注意查看最近的所有提交"
            echo "  寻找没有具体名字的提交者"
            ;;
        quit)
            echo "${YELLOW}退出关卡...${NC}"
            return 1
            ;;
        git log)
            git log
            ;;
        git log --oneline)
            git log --oneline
            ;;
        git log --since="2024-01-01")
            git log --since="2024-01-01"
            ;;
        git show HEAD~2)
            git show HEAD~2
            ;;
        git show HEAD~1)
            git show HEAD~1
            ;;
        *)
            echo "${RED}命令 '$command' 未识别或需要更多参数${NC}"
            attempts=$((attempts + 1))
            
            # 检查答案
            if [[ "$command" == "git log" && $attempts -ge 2 ]]; then
                echo "${GREEN}你发现了可疑提交！提交者是 'anonymous'${NC}"
                echo "${BLUE}恭喜！关卡完成！${NC}"
                return 0
            fi
            
            if [ $attempts -ge 5 ]; then
                echo "${RED}尝试次数过多！关卡失败${NC}"
                echo "${YELLOW}提示：使用 'git log' 查看所有提交者${NC}"
                return 1
            fi
            ;;
    esac
done