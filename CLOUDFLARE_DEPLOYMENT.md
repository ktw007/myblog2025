# Cloudflare Pages 部署指南

## 前置条件

- GitHub 账号
- Cloudflare 账号（免费即可）
- 项目代码已推送到 GitHub

## 步骤 1：准备项目

已完成的配置：
- ✅ 部署平台设置为 `vercel`（Cloudflare Pages 兼容 Vercel 格式）
- ✅ 构建命令：`npm run build`
- ✅ 输出目录：`dist`

## 步骤 2：创建 GitHub 仓库

1. 在 GitHub 创建新仓库
2. 将代码推送到 GitHub：

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

## 步骤 3：连接 Cloudflare Pages

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 进入 **Workers & Pages**
3. 点击 **Create application**
4. 选择 **Pages** 标签页
5. 点击 **Connect to Git**
6. 授权 GitHub 并选择你的仓库

## 步骤 4：配置构建设置

在 Cloudflare Pages 设置页面填写：

### 构建配置

```
框架预设：        Astro
构建命令：        npm run build
构建输出目录：    dist
根目录：          /（留空）
Node.js 版本：    18 或更高
```

### 环境变量（如需要）

可以在 **Settings** → **Environment variables** 中添加环境变量。

## 步骤 5：部署

1. 点击 **Save and Deploy**
2. Cloudflare 会自动：
   - 安装依赖（`npm install`）
   - 运行构建（`npm run build`）
   - 部署到全球 CDN

## 步骤 6：配置自定义域名（可选）

1. 在项目设置中选择 **Custom domains**
2. 添加你的域名
3. 按照提示配置 DNS 记录

## 自动部署

每次推送到 `main` 分支，Cloudflare Pages 会自动触发构建和部署。

## 本地构建测试

在部署前，建议先本地测试构建：

```bash
npm run build
npm run preview
```

访问 http://localhost:5000 查看构建后的效果。

## 注意事项

1. **图片同步**：确保 `src/content/posts/attachments/` 中的图片已提交到 Git
2. **Node 版本**：Cloudflare Pages 默认使用 Node 18，如需更高版本可在环境变量中设置 `NODE_VERSION=20`
3. **构建时间**：首次构建可能需要 3-5 分钟
4. **缓存**：如遇到问题，可以在 Cloudflare 控制台清除缓存重新部署

## 故障排查

### 构建失败

1. 检查 Cloudflare Pages 的构建日志
2. 确认 `package.json` 中的依赖版本正确
3. 本地运行 `npm run build` 测试

### 图片不显示

1. 确认图片在 `src/content/posts/attachments/` 目录
2. 确认图片已推送到 GitHub
3. 重新触发部署

### 404 错误

1. 确认路由配置正确
2. 检查 Astro 配置中的 `site` 地址

## 有用的链接

- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
- [Astro 部署指南](https://docs.astro.build/en/guides/deploy/cloudflare/)
- [项目配置文件](./src/config.ts)
