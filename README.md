# Pilot#
一个 iOS App 快速开发框架。

# 安装
前提：
1. cocoapods
2. xcode Version 9.4.1 (9F2000)
3. Swfit4.1

实施：
1. git clone 到本地
  
```  
    $ git clone --recursive  https://github.com/Rdxer/Pilot.git
    $ cd Pilot
    $ git checkout -b dev origin/feature/结构修改
    $ ./init.sh
    $ open App/App.xcworkspace
    
```


# 功能


## 1. App配置的管理

## 2. 网络

## 3. 本地数据库

## 4. 验证管理

## 5. UI层BaseClass

## 6. 模块代码生成

1. 均基于 一个 配置文件
    1. url path ,url 路径 
    2. parameter, 参数集合
    3. response, 响应返回的 json 字符串
    4. model keyPath,模型 或者 模型数组对应在 json 中的路径
    5. Model Name - className, 生成模型的类名
    6. 结果类型 , 响应结果类型 
        1. 如果是 bool 则不会生成模型,
        2. model 对应 单模型,ViewController
        3. modelList 生成 单模型,TableViewController
    7. 生成的的目标文件均基于此配置文件，但是生成的目标文件 根据 命令需要来生成
5. 生成文件类型
    1. 表单模板页面 - 用于提交
    2. TableViewController模板页面 - 展示列表
    3. ViewController模板页面 - 展示单模型
    4. API 代码生成
    6. Model 代码生成
 


## 7. 基础模板

### 1. 登陆模板页面
### 2. Tab模板页面
### 3. Tab模板页面

## 8. 日志组件

## 9. Snap布局扩展

## 10. UIKit扩展

## 11. Foundation扩展

## 12. 路由



