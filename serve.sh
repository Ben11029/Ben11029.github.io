#!/bin/bash

echo "===================================="
echo "Jekyll 本地服务器启动脚本"
echo "===================================="
echo ""

# 检查是否安装了 Ruby
if ! command -v ruby &> /dev/null; then
    echo "[错误] 未检测到 Ruby！"
    echo ""
    echo "请先安装 Ruby："
    echo "  macOS: brew install ruby"
    echo "  Ubuntu/Debian: sudo apt-get install ruby-full"
    echo "  CentOS/RHEL: sudo yum install ruby"
    echo ""
    exit 1
fi

echo "[信息] 检测到 Ruby 已安装"
echo ""

# 检查是否安装了 Bundler
if ! command -v bundle &> /dev/null; then
    echo "[信息] 正在安装 Bundler..."
    gem install bundler
    if [ $? -ne 0 ]; then
        echo "[错误] Bundler 安装失败！"
        exit 1
    fi
fi

# 检查是否已安装依赖
if [ ! -f "Gemfile.lock" ]; then
    echo "[信息] 首次运行，正在安装依赖..."
    bundle install
    if [ $? -ne 0 ]; then
        echo "[错误] 依赖安装失败！"
        exit 1
    fi
fi

echo "[信息] 正在启动 Jekyll 服务器..."
echo "[信息] 服务器地址: http://localhost:4000"
echo "[信息] 按 Ctrl+C 停止服务器"
echo ""
echo "===================================="
echo ""

# 启动 Jekyll 服务器
bundle exec jekyll serve

