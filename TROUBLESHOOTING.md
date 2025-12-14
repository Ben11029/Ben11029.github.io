# 故障排除指南

## 归档和标签页面显示 404

如果归档（`/archive/`）和标签（`/tags/`）页面显示 404，请按以下步骤排查：

### 1. 重启 Jekyll 服务器

如果正在运行本地服务器，需要重启：

1. 停止当前服务器（按 `Ctrl + C`）
2. 重新运行 `bundle exec jekyll serve` 或 `serve.bat`

**原因**：Jekyll 在启动时扫描文件，新添加的页面需要重启才能识别。

### 2. 清除缓存

删除以下目录和文件后重新启动：

```bash
# 删除缓存目录
rm -rf .jekyll-cache
rm -rf _site
```

Windows 用户：
```cmd
rmdir /s /q .jekyll-cache
rmdir /s /q _site
```

### 3. 检查文件位置

确保以下文件在项目根目录：
- `archive.html` ✓
- `tags.html` ✓
- `about.md` ✓

### 4. 检查 permalink 配置

确保导航链接与 permalink 匹配：

**导航链接**（在 `_layouts/default.html` 中）：
- `/archive/` ✓
- `/tags/` ✓
- `/about/` ✓

**页面 permalink**（在各自文件中）：
- `permalink: /archive/` ✓
- `permalink: /tags/` ✓
- `permalink: /about/` ✓

### 5. 强制重新构建

使用以下命令强制重新构建：

```bash
bundle exec jekyll build --force
bundle exec jekyll serve
```

### 6. 检查 Jekyll 版本

确保使用兼容的 Jekyll 版本：

```bash
bundle exec jekyll --version
```

应该显示 4.x 版本。

### 7. 查看构建日志

启动服务器时查看是否有错误信息：

```bash
bundle exec jekyll serve --verbose
```

### 8. 验证文件格式

确保 `archive.html` 和 `tags.html` 文件：
- 有正确的 front matter（`---` 开头和结尾）
- 使用 `.html` 扩展名
- 在项目根目录

### 常见问题

**Q: 页面显示空白内容**
A: 检查是否有文章数据。如果没有文章，页面会显示"暂无文章"或"暂无标签"。

**Q: 本地正常，GitHub Pages 上 404**
A: 确保文件已提交到 GitHub，并等待几分钟让 GitHub Pages 重新构建。

**Q: 某些链接仍然 404**
A: 清除浏览器缓存，或使用无痕模式访问。

---

如果以上方法都无法解决问题，请检查：
1. Jekyll 日志中的错误信息
2. 文件权限是否正确
3. `_config.yml` 中是否有配置冲突

