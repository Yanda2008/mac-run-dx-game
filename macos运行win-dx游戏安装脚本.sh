#!/bin/bash

echo "是否继续安装 Macos 运行 Win-dx 游戏？"
echo "1. 继续gogogo"
echo "2. 退出qwq"
echo "本程序由FastRom制作 仅供学习使用 email:3256505404@qq.com"

read -p "请选择： " choice

if [ $choice -eq 2 ]
then
    exit 1
fi

# 安装 Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 安装 Wine
brew install wine

# 安装 Wine Tricks
brew install winetricks

# 配置 Wine
echo "请等待窗口打开初始化然后自行关闭即可"
winecfg

read -p "请输入 1 继续安装 DXVK： " choice

if [ $choice -ne 1 ]
then
    exit 1
fi

# 安装 Wget
brew install wget

# 下载 DXVK
wget https://objects.githubusercontent.com/github-production-release-asset-2e65be/106558568/0357d2ef-b0ae-4071-abae-70a22bd33f03?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230225%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230225T050624Z&X-Amz-Expires=300&X-Amz-Signature=7502d54e1ecbb452cc9cb7f31879513d59cd506c892ef7a5f37005b8a41f0fd5&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=106558568&response-content-disposition=attachment%3B%20filename%3Ddxvk-2.1.tar.gz&response-content-type=application%2Foctet-stream

# 解压 DXVK
tar -xzf dxvk-2.1.tar.gz

# 将 DXVK 文件夹中的 x64 文件夹内的所有文件替换到用户文件夹中的 .wine/drive_c/windows/system32
cp -r dxvk-2.1/x64/* ~/.wine/drive_c/windows/system32

# 将 DXVK 文件夹中的 x32 文件夹内的所有文件替换到用户文件夹中的 .wine/drive_c/windows/system32/syswow64
cp -r dxvk-2.1/x32/* ~/.wine/drive_c/windows/system32/syswow64

# 配置 Wine
echo "请在新打开的窗口里找到函数库，然后找到新增函数库顶替："
echo "1. 输入 d3d11，然后添加"
echo "2. 输入 d3d10core，然后添加"
echo "3. 输入 dxgi，然后添加"
echo "4. 输入 d3d9，然后添加"
echo "最后请点击应用，然后确定"
winecfg

echo "安装成功！请打开终端 输入 wine 游戏.exe 来打开"
read -p "按下 Enter 退出" choice
