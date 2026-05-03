# Git Escape Android版本

## 游戏介绍
《Git 逃生室》是一款Android终端解谜游戏，通过在Termux中执行真实的Linux/Git命令来破解关卡。

## 安装要求
1. **Android设备**
2. **Termux应用**（从Google Play商店下载）
3. **网络连接**（下载游戏包）

## 安装步骤

### 第1步：安装Termux
从Google Play商店安装Termux应用：
- 搜索"Termux"
- 安装Termux应用
- 打开Termux

### 第2步：配置Termux
在Termux中运行：
```
pkg update && pkg upgrade
pkg install git tar wget
```

### 第3步：下载游戏
```
cd ~
wget https://github.com/3444614044/git-escape-game/releases/download/android/git-escape-android.tar.gz
tar -xzf git-escape-android.tar.gz
```

### 第4步：运行游戏
```
cd git-escape-android
./git-escape.sh start
```

## 游戏关卡

### Level 1：文件操作迷宫
- 学习命令：ls, cd, cat
- 目标：找到隐藏的密码文件

### Level 2：Git侦探
- 学习命令：git log, git show
- 目标：分析Git历史找出可疑提交

### Level 3：网络连接
- 学习命令：nc, telnet
- 目标：通过网络连接获取数据

## 常见问题

### Termux安装问题
1. 确保Android允许安装未知来源应用
2. 如果无法安装，可以尝试Termux的替代应用

### 命令无法执行
1. 确保安装了git和tar包
2. 确保Termux有足够的权限

### 游戏无法运行
1. 检查是否在正确的目录中
2. 运行chmod +x git-escape.sh赋予执行权限

## 技术支持
游戏开源项目：https://github.com/3444614044/git-escape-game
问题反馈：GitHub Issues

## 更新记录
- v1.0.0：Android版本发布
