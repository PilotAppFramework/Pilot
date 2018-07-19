#!/bin/sh

echo 开始初始化项目

cd Tools/PilotCLI

echo 创建 xcodeproj

swift package generate-xcodeproj

echo 更新 CLI 工具

swift package update

echo 构建 CLI 工具

swift build 

