#!/bin/bash
# Git Escape Android安装脚本
# 需要在Termux中运行

echo "Git Escape Android版本安装"
echo "=========================="
echo ""
echo "注意：此游戏需要在Termux环境中运行"
echo "Termux是Android上的Linux终端模拟器"
echo ""

echo "1. 安装Termux"
echo "   从Google Play商店下载Termux"
echo ""
echo "2. 在Termux中运行以下命令："
echo "   pkg update && pkg upgrade"
echo "   pkg install git tar wget"
echo ""
echo "3. 下载游戏"
echo "   cd ~"
echo "   wget https://github.com/3444614044/git-escape-game/releases/download/android/git-escape-android.tar.gz"
echo "   tar -xzf git-escape-android.tar.gz"
echo ""
echo "4. 运行游戏"
echo "   cd git-escape-android"
echo "   ./git-escape.sh start"
