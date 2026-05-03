#!/bin/bash
# Level 3: 网络连接关卡

echo "${BLUE}=== 关卡 3: 网络连接 ===${NC}"
echo ""
echo "${WHITE}目标：${NC}"
echo "  通过netcat连接到远程端口获取数据"
echo ""
echo "${YELLOW}提示：${NC}"
echo "  nc (netcat) 命令可以建立网络连接"
echo "  端口号很重要"
echo "  可能需要多次尝试"
echo ""
echo "${PURPLE}输入 'help' 查看帮助，输入 'hint' 获取更多提示${NC}"
echo ""

# 准备网络服务
echo "启动本地网络服务..."
PORT=12345
# 模拟网络服务
echo "Access granted: Level3-Password" > /tmp/level3_data

echo "${GREEN}网络服务准备完毕！端口: $PORT${NC}"
echo ""

attempts=0
while true; do
    echo "${CYAN}请输入命令：${NC}"
    read -p "$(echo -e "${WHITE}net-connect> ${NC}")" command
    
    case "$command" in
        help)
            echo "${GREEN}可用命令：${NC}"
            echo "  nc localhost 12345   连接本地端口"
            echo "  telnet localhost 12345 使用telnet连接"
            echo "  hint                  获取更多提示"
            echo "  quit                  退出关卡"
            ;;
        hint)
            echo "${YELLOW}更多提示：${NC}"
            echo "  尝试连接本地端口"
            echo "  端口号是 12345"
            echo "  连接成功后等待数据返回"
            ;;
        quit)
            echo "${YELLOW}退出关卡...${NC}"
            return 1
            ;;
        nc localhost 12345|telnet localhost 12345)
            echo "${GREEN}连接成功！接收到数据：${NC}"
            echo "Access granted: Level3-Password"
            echo ""
            echo "${BLUE}恭喜！关卡完成！${NC}"
            return 0
            ;;
        *)
            echo "${RED}连接失败！请检查端口号${NC}"
            attempts=$((attempts + 1))
            
            if [ $attempts -ge 5 ]; then
                echo "${RED}尝试次数过多！关卡失败${NC}"
                echo "${YELLOW}提示：使用 'nc localhost 12345'${NC}"
                return 1
            fi
            ;;
    esac
done