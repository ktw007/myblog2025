---
title: 'Codex 中转 API 配置教程'
description: '手把手配置 Codex 使用中转 API（自定义 provider、base_url、API Key 环境变量），含 Windows / macOS / Linux 设置示例。'
date: 2025-11-06T10:00:00+08:00
image: 'attachments/codex.webp'
tags: ['Codex','中转API','配置','教程']
hideTOC: false
---

> 本教程将指导你如何配置 Codex 使用中转 API 服务。

## 第一步：找到配置文件

- 路径：`~/.codex/config.toml`
- Windows：`C:\Users\你的用户名\.codex\config.toml`
- macOS/Linux：`~/.codex/config.toml`

## 第二步：编辑配置文件

清空 `config.toml` 原有内容，粘贴以下配置：

```toml
model = "gpt-5"
model_provider = "custom_provider"

# 这是我们为代理服务器定义的提供商
[model_providers.custom_provider]

# Provider 的名称，可自定义（建议英文）
name = "custom"  # 例如：custom、proxy、api

# 关键：在这里填入您代理服务器或第三方服务的 URL
base_url = "https://xxxx.xxxx/v1"

# 指定该 Provider 读取哪个环境变量来获取 API Key
env_key = "OPENAI_API_KEY"
```

> 注意：将 `base_url` 中的 `https://xxxx.xxxx/v1` 替换为你的实际中转 API 地址。

## 第三步：配置 API Key（环境变量）

你需要设置环境变量 `OPENAI_API_KEY`。可选临时或永久两种方式。

### 临时配置（关闭终端后失效）

- Windows（PowerShell）

```powershell
$env:OPENAI_API_KEY = "sk-xxxx"
```

- macOS/Linux（Bash/Zsh）

```bash
export OPENAI_API_KEY="sk-xxxx"
```

### 永久配置

- Windows（需要重启终端生效）

```powershell
[System.Environment]::SetEnvironmentVariable("OPENAI_API_KEY", "sk-xxxx", "User")
```

- macOS/Linux（以 Bash 为例）

```bash
echo -e '\nexport OPENAI_API_KEY="sk-xxxx"' >> ~/.bashrc
source ~/.bashrc
```

> 如果你使用的是 zsh，请将 `~/.bashrc` 替换为 `~/.zshrc`。

---

## 完成与排错

配置完成后，Codex 将使用你配置的中转 API 服务。请检查：

- API Key 是否正确无误；
- 中转 API 地址可正常访问；
- 环境变量是否已生效（永久配置通常需要重启终端）；
- `config.toml` 的 TOML 语法是否正确（引号、等号、缩进）。

如仍有问题，可将错误信息粘贴到评论或工单中以便进一步排查。
