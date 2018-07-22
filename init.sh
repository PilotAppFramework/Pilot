#!/bin/sh

echo 开始初始化项目

echo 创建启动文件 🆕

cp App/App/Env/LauchMode.ini.example   App/App/Env/LauchMode.ini

echo 创建启动文件  ✅  App/App/Env/LauchMode.ini


echo 开始构建 CLI 工具 🆕

cd Tools/PilotCLI

echo 创建 xcodeproj

swift package generate-xcodeproj

echo 更新 CLI 工具  

swift package update

echo 编译 CLI 工具

swift build 

echo 构建 CLI 工具 结束 ✅

echo 开始执行 pod install 🆕

cd ../../App
pod install

echo 执行 pod install ✅

