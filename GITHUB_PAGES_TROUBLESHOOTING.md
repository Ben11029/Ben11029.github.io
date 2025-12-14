# GitHub Pages 更新故障排除指南

## 问题：git push 后 Pages 没有变化

### 1. 确认代码已推送到 GitHub

```bash
# 检查本地是否有未推送的提交
git status

# 如果有未推送的提交，执行推送
git push origin master
# 或者
git push origin main
```

### 2. 检查 GitHub Pages 构建状态

1. 访问你的 GitHub 仓库：`https://github.com/Ben11029/Ben11029.github.io`
2. 点击 **Actions** 标签页
3. 查看最新的构建工作流状态
   - ✅ 绿色 = 构建成功
   - ❌ 红色 = 构建失败（点击查看错误详情）
   - 🟡 黄色 = 正在构建中

### 3. 检查 GitHub Pages 设置

1. 进入仓库 **Settings** → **Pages**
2. 确认：
   - **Source**: 选择 `Deploy from a branch`
   - **Branch**: 选择 `master` 或 `main`，文件夹选择 `/ (root)`
   - **Custom domain**: 如果有自定义域名，确保配置正确

### 4. 等待构建完成

GitHub Pages 构建通常需要：
- **首次部署**: 5-10 分钟
- **后续更新**: 1-5 分钟

如果超过 10 分钟还没有更新，检查 Actions 中的错误信息。

### 5. 清除浏览器缓存

有时浏览器缓存了旧版本：

- **Chrome/Edge**: `Ctrl + Shift + Delete` → 清除缓存
- **Firefox**: `Ctrl + Shift + Delete` → 清除缓存
- 或使用**无痕模式**访问：`https://ben11029.github.io`

### 6. 强制重新构建

如果构建失败或卡住，可以：

1. 进入 **Settings** → **Pages**
2. 临时更改 **Source** 为其他分支，保存
3. 再改回 `master`，保存
4. 这会触发新的构建

### 7. 检查 Jekyll 构建错误

如果 Actions 显示构建失败，常见原因：

#### 7.1 语法错误
- 检查 `_config.yml` 的 YAML 语法
- 检查 Markdown 文件格式
- 检查 HTML/Liquid 模板语法

#### 7.2 插件问题
- 确保 `Gemfile` 中的插件在 GitHub Pages 支持列表中
- GitHub Pages 只支持特定插件，查看：[支持的插件](https://pages.github.com/versions/)

#### 7.3 文件路径问题
- 确保图片路径正确
- 确保所有引用的文件都存在

### 8. 本地测试构建

在推送前，本地测试构建：

```bash
# 安装依赖
bundle install

# 构建网站
bundle exec jekyll build

# 如果有错误，会显示详细信息
```

### 9. 检查文件是否被忽略

确保重要文件没有被 `.gitignore` 忽略：

```bash
# 检查 .gitignore
cat .gitignore

# 确保以下文件已提交：
# - _config.yml
# - index.html
# - _layouts/*.html
# - _posts/*.md
# - style.scss
# - images/logo.svg
```

### 10. 查看构建日志

在 GitHub Actions 中：
1. 点击失败的构建
2. 查看 **Build and deploy Jekyll site to GitHub Pages** 步骤
3. 展开查看详细错误信息

### 11. 常见错误和解决方案

#### 错误：`Liquid Exception`
- **原因**: Liquid 模板语法错误
- **解决**: 检查模板文件中的 `{% %}` 和 `{{ }}` 语法

#### 错误：`YAML Exception`
- **原因**: `_config.yml` 格式错误
- **解决**: 检查缩进、引号、冒号等

#### 错误：`404 Not Found`
- **原因**: 文件路径错误或文件不存在
- **解决**: 检查所有文件路径，确保文件已提交

### 12. 验证更新

更新后，验证方法：

1. **直接访问**: `https://ben11029.github.io`
2. **添加时间戳**: `https://ben11029.github.io?v=123456`（强制刷新）
3. **检查文件**: `https://ben11029.github.io/style.css`（查看更新时间）

### 13. 如果以上都不行

1. **检查仓库名称**: 确保是 `Ben11029.github.io`（用户名.github.io）
2. **检查分支**: 确保推送到正确的分支（通常是 `master` 或 `main`）
3. **联系 GitHub 支持**: 如果持续无法更新，可能是 GitHub 服务问题

---

## 快速检查清单

- [ ] 代码已推送到 GitHub（`git push` 成功）
- [ ] GitHub Actions 显示构建成功
- [ ] Pages 设置正确（Source = master/main）
- [ ] 等待了足够的时间（5-10 分钟）
- [ ] 清除了浏览器缓存
- [ ] 检查了构建日志中的错误
- [ ] 本地构建测试通过

---

## 有用的命令

```bash
# 查看未推送的提交
git log origin/master..HEAD

# 强制推送（谨慎使用）
git push origin master --force

# 查看远程仓库状态
git remote show origin

# 查看所有分支
git branch -a
```

