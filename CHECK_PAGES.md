# GitHub Pages 更新检查步骤

## 当前状态

根据检查，你的本地仓库有 **1 个未推送的提交**。

## 立即执行

### 1. 推送代码到 GitHub

```bash
git push origin master
```

### 2. 检查 GitHub Actions 构建状态

推送后，访问以下链接检查构建状态：

🔗 **Actions 页面**: https://github.com/Ben11029/Ben11029.github.io/actions

查看最新的工作流：
- ✅ **绿色** = 构建成功，等待几分钟后访问网站
- ❌ **红色** = 构建失败，点击查看错误详情
- 🟡 **黄色** = 正在构建中，请等待

### 3. 检查 Pages 设置

访问：https://github.com/Ben11029/Ben11029.github.io/settings/pages

确认：
- **Source**: `Deploy from a branch`
- **Branch**: `master` 或 `main`
- **Folder**: `/ (root)`

### 4. 等待构建完成

- **首次部署**: 5-10 分钟
- **后续更新**: 1-5 分钟

### 5. 清除缓存后访问

构建完成后，清除浏览器缓存或使用无痕模式访问：

🌐 **网站地址**: https://ben11029.github.io

---

## 如果仍然没有更新

### 检查构建日志

1. 进入 Actions 页面
2. 点击最新的工作流
3. 查看 "Build and deploy Jekyll site" 步骤
4. 如果有错误，会显示红色并显示错误信息

### 常见问题

1. **Jekyll 构建错误**
   - 检查 `_config.yml` 语法
   - 检查模板文件语法
   - 查看详细错误信息

2. **文件路径错误**
   - 确保所有图片路径正确
   - 确保引用的文件都存在

3. **插件不兼容**
   - GitHub Pages 只支持特定插件
   - 检查 `Gemfile` 中的插件

### 强制重新构建

如果构建卡住，可以：
1. 进入 Settings → Pages
2. 临时更改 Source
3. 保存后再改回来
4. 这会触发新的构建

---

## 验证更新

更新后，可以通过以下方式验证：

1. 直接访问网站
2. 查看 CSS 文件更新时间：`https://ben11029.github.io/style.css`
3. 添加时间戳参数：`https://ben11029.github.io?v=123456`

