#!/bin/bash
# 关卡自动生成器

echo "=== 关卡生成器 ==="

# 读取关卡配置
LEVEL_CONFIG="$GAME_DIR/config.yaml"

if [ ! -f "$LEVEL_CONFIG" ]; then
    echo "错误：配置文件不存在"
    exit 1
fi

echo "读取关卡配置..."
# 这里应该解析YAML文件，但为了方便，我们手动生成

generate_level() {
    level_num=$1
    title=$2
    description=$3
    
    echo "生成关卡 $level_num: $title"
    
    # 创建关卡文件
    LEVEL_FILE="$GAME_DIR/levels/level${level_num}.sh"
    
    cat > "$LEVEL_FILE" << 'EOF'
#!/bin/bash
# Level ${level_num}: ${title}

echo "${BLUE}=== 关卡 ${level_num}: ${title} ===${NC}"
echo ""
echo "${WHITE}目标：${NC}"
echo "  ${description}"
EOF
    
    echo "关卡 $level_num 生成完成"
}

# 生成所有关卡
echo "生成关卡文件..."
mkdir -p "$GAME_DIR/levels"

generate_level 1 "文件操作迷宫" "找到名为 'secret.txt' 的文件并读取其中的密码"
generate_level 2 "Git侦探" "通过git历史记录找出谁修改了关键文件"
generate_level 3 "网络连接" "通过netcat连接到远程端口获取数据"

echo "=== 关卡生成完成 ==="
echo "已生成关卡："
ls -la "$GAME_DIR/levels/"