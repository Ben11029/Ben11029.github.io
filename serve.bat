@echo off
echo ====================================
echo Jekyll 本地服务器启动脚本
echo ====================================
echo.

REM 检查是否安装了 Ruby
where ruby >nul 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Ruby！
    echo.
    echo 请先安装 Ruby：
    echo 1. 访问 https://rubyinstaller.org/
    echo 2. 下载并安装 Ruby+Devkit 版本
    echo 3. 安装完成后重新运行此脚本
    echo.
    pause
    exit /b 1
)

echo [信息] 检测到 Ruby 已安装
echo.

REM 检查是否安装了 Bundler
where bundle >nul 2>nul
if %errorlevel% neq 0 (
    echo [信息] 正在安装 Bundler...
    gem install bundler
    if %errorlevel% neq 0 (
        echo [错误] Bundler 安装失败！
        pause
        exit /b 1
    )
)

REM 检查是否已安装依赖
if not exist "Gemfile.lock" (
    echo [信息] 首次运行，正在安装依赖...
    bundle install
    if %errorlevel% neq 0 (
        echo [错误] 依赖安装失败！
        pause
        exit /b 1
    )
)

echo [信息] 正在启动 Jekyll 服务器...
echo [信息] 服务器地址: http://localhost:4000
echo [信息] 按 Ctrl+C 停止服务器
echo.
echo ====================================
echo.

REM 启动 Jekyll 服务器
bundle exec jekyll serve

pause

