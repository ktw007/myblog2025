---
title: 'Claude Code 常用 MCP 工具推荐'
description: '推荐两款实用的 Claude Code MCP 工具：BrightData MCP 用于网络爬取搜索，Context7 MCP 用于获取最新开发文档。'
date: 2025-11-06T22:00:00+08:00
image: 'attachments/mcp.png'
tags: ['Claude Code', 'MCP', '工具推荐', '开发工具']
hideTOC: false
---

> MCP (Model Context Protocol) 是 Claude Code 的扩展协议，可以为 AI 助手添加更多实用功能。本文介绍两款常用的 MCP 工具。

## 什么是 MCP？

MCP (Model Context Protocol) 允许你为 Claude Code 添加外部工具和数据源，扩展其能力范围。通过安装 MCP 服务器，Claude Code 可以访问网络数据、查询文档、操作数据库等。

## 推荐工具一：BrightData MCP

### 功能特点

BrightData MCP 专注于**网络爬取与搜索**，让 Claude Code 能够：
- 实时爬取网页内容
- 搜索最新的网络信息
- 获取动态加载的数据

### 安装步骤

1. **注册账号获取密钥**

访问 [BrightData 文档](https://docs.brightdata.com/mcp-server/remote/quickstart) 注册免费账号，获取你的 API Token。

2. **安装 MCP 服务器**

```bash
claude mcp add --transport http brightdata https://mcp.brightdata.com/mcp?token=YOUR_API_TOKEN
```

> 请将 `YOUR_API_TOKEN` 替换为你实际获取的密钥。

### 使用方式

在对话末尾添加：
```
use brightdata
```

Claude Code 将自动调用 BrightData 进行网络数据抓取。

---

## 推荐工具二：Context7 MCP

### 功能特点

Context7 MCP 用于**获取最新开发文档**，支持：
- 实时访问各种框架和库的官方文档
- 获取最新 API 参考
- 查询代码示例和最佳实践

### 安装步骤

安装非常简单，只需一行命令：

```bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp
```

### 使用方式

在对话中提及：
```
use context7
```

Claude Code 会自动从 Context7 获取相关技术文档。

---

## 使用技巧

### 组合使用

你可以同时安装多个 MCP 工具，Claude Code 会根据上下文智能选择合适的工具：

```bash
# 同时安装两个工具
claude mcp add --transport http brightdata https://mcp.brightdata.com/mcp?token=YOUR_API_TOKEN
claude mcp add --transport http context7 https://mcp.context7.com/mcp
```

### 明确指定工具

如果需要明确使用某个工具，在对话中添加：

- `use brightdata` - 使用 BrightData 爬取网络数据
- `use context7` - 使用 Context7 查询开发文档

### 查看已安装的 MCP

```bash
claude mcp list
```

### 移除 MCP 工具

```bash
claude mcp remove <mcp-name>
```

---

## 实际应用场景

### 场景一：实时网络数据分析

使用 BrightData MCP 爬取最新的技术新闻、市场数据或竞品分析：

```
帮我爬取 Hacker News 首页的热门文章标题和链接 use brightdata
```

### 场景二：查询最新框架文档

使用 Context7 MCP 获取最新的 API 文档和使用示例：

```
帮我查询 Next.js 15 的最新路由 API 文档 use context7
```

### 场景三：开发辅助

结合两个工具进行全面的技术调研：

```
1. 帮我查询 React 19 的新特性文档 use context7
2. 再爬取一些实际项目中的应用案例 use brightdata
```

---

## 注意事项

1. **API 限制**：免费账号通常有调用次数限制，请合理使用
2. **数据隐私**：不要通过 MCP 工具传输敏感信息
3. **网络要求**：MCP 工具需要稳定的网络连接
4. **合法使用**：使用爬虫工具时请遵守目标网站的 robots.txt 规则

---

## 总结

BrightData MCP 和 Context7 MCP 是 Claude Code 的两大实用扩展：

- **BrightData**：专注网络数据爬取，适合需要实时信息的场景
- **Context7**：专注技术文档查询，适合开发学习和问题排查

合理使用这些工具，可以大大提升 Claude Code 的实用性和工作效率。

需要更多 MCP 工具推荐？访问 [MCP 官方仓库](https://github.com/modelcontextprotocol) 探索更多可能性。
