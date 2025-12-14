# 本地预览指南

## 方法一：使用 Jekyll（推荐）

### 1. 安装 Ruby

**Windows 用户：**
- 下载并安装 [RubyInstaller](https://rubyinstaller.org/)
- 选择 Ruby+Devkit 版本（推荐 3.1.x 或更高版本）
- 安装完成后，重启命令行窗口

**macOS 用户：**
```bash
# 使用 Homebrew
brew install ruby
```

**Linux 用户：**
```bash
# Ubuntu/Debian
sudo apt-get install ruby-full build-essential

# CentOS/RHEL
sudo yum install ruby ruby-devel
```

### 2. 安装 Jekyll 和依赖

在项目根目录下运行：

```bash
# 安装 Bundler（如果还没有）
gem install bundler

# 安装项目依赖
bundle install
```

### 3. 启动本地服务器

```bash
# 启动 Jekyll 服务器
bundle exec jekyll serve
```

或者：

```bash
jekyll serve
```

### 4. 访问网站

打开浏览器访问：**http://localhost:4000**

服务器会监听文件变化，修改文件后自动重新生成网站（可能需要刷新浏览器）。

### 停止服务器

按 `Ctrl + C` 停止服务器。

---

## 方法二：使用 Docker（无需安装 Ruby）

如果你已经安装了 Docker，可以使用以下命令：

```bash
# 构建并运行
docker run --rm \
  -p 4000:4000 \
  -v "%cd%":/srv/jekyll \
  -it jekyll/jekyll:latest \
  jekyll serve --force_polling
```

然后在浏览器访问：**http://localhost:4000**

---

## 方法三：使用 GitHub Codespaces（在线预览）

1. 在 GitHub 仓库页面点击 "Code" → "Codespaces"
2. 创建新的 Codespace
3. 在终端运行：`bundle install && bundle exec jekyll serve`
4. 点击端口转发，访问预览

---

## 常见问题

### 问题：`bundle install` 失败

**解决方案：**
- Windows 用户确保安装了 Ruby+Devkit 版本
- 尝试更新 bundler：`gem update bundler`
- 如果遇到 SSL 证书问题，运行：`gem sources --add https://rubygems.org/ --remove https://rubygems.org/`

### 问题：端口 4000 已被占用

**解决方案：**
```bash
# 使用其他端口
jekyll serve --port 4001
```

### 问题：修改后页面没有更新

**解决方案：**
- 确保服务器正在运行
- 强制重新生成：`jekyll serve --force_polling`
- 清除缓存：删除 `.jekyll-cache` 文件夹后重新启动

### 问题：Windows 上 `bundle install` 很慢

**解决方案：**
- 使用国内镜像源：
```bash
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```

---

## 快速命令参考

```bash
# 安装依赖
bundle install

# 启动服务器（开发模式）
bundle exec jekyll serve

# 启动服务器（生产模式）
JEKYLL_ENV=production bundle exec jekyll serve

# 仅构建网站（不启动服务器）
bundle exec jekyll build

# 查看帮助
bundle exec jekyll help
```

---

## 提示

- 修改 `_config.yml` 后需要重启服务器才能生效
- 修改其他文件（HTML、Markdown、CSS）会自动重新生成
- 生成的网站文件在 `_site` 目录（已添加到 .gitignore）

