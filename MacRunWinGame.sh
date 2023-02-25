#!/bin/bash

echo "您是否想安装MacRunWinGame？"
echo "本项目基于Wine/DXVK 如有错误请纠正 E-MAIL:3256505404@qq.com"
select yn in "继续" "退出"; do
    case $yn in
        继续 ) break;;
        退出 ) exit;;
    esac
done

echo "正在安装brew，请等待..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "正在安装wine，请等待..."
brew install wine

echo "正在安装winetricks，请等待..."
brew install winetricks

echo "请等待winecfg窗口打开，然后关闭"
winecfg

echo "请确认已关闭winecfg窗口后，输入1继续"
read -p "输入1继续: " CONTINUE

echo "正在安装wget，请等待..."
brew install wget

echo "正在下载dxvk，请等待..."
wget https://github.com/doitsujin/dxvk/releases/download/v2.1/dxvk-2.1.tar.gz

echo "正在解压dxvk，请等待..."
tar -xvf dxvk-2.1.tar.gz

echo "正在替换dxvk文件夹中的文件，请等待..."
cp -r dxvk-2.1/x64/* ~/.wine/drive_c/windows/system32/
cp -r dxvk-2.1/x32/* ~/.wine/drive_c/windows/syswow64/

echo "请等待winecfg窗口打开，然后进行以下操作："
echo "- 找到函数库"
echo "- 找到新增函数库"
echo "- 输入d3d11"
echo "- 添加"
echo "- 输入d3d10core"
echo "- 添加"
echo "- 输入dxgi"
echo "- 添加"
echo "- 输入d3d9"
echo "- 添加"
echo "- 点击应用"
echo "- 点击确定"
winecfg

echo "请确认已完成以上操作后，输入1继续"
read -p "输入1继续: " CONTINUE

echo "安装完成！请打开终端使用指令 wine XXXX.exe "
read -p "按下Enter退出" CONTINUE
