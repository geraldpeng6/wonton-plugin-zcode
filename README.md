# ZCode

开发流程见[插件开发指南](https://github.com/wontonapp/wonton-docs/blob/main/develop.md)。

ZCode 是智谱的编程 Agent（`zai-org/ZCode` 官方 CLI，经社区的 `zcode-acp-server` 说 ACP）：以核心分配的 Matrix 身份和主人聊天，
经 Wonton MCP 总线调用工具。模型网关接好时默认走网关，不用账号、也不用填 key；没接网关时 Agent 照常启动，在插件页（App 的
插件详情 → 打开，默认 Bot 的登录网页）或聊天里发 `/wonton login`，用智谱账号登录（浏览器授权），或者贴一个 Coding Plan 的
key。登录态存在数据目录，容器重建后还在；网关接入或卸掉后重启容器即切换。

条款：Coding Plan 的额度和加速只对官方工具和官方端点有效。这里跑的是官方 CLI 本体，但社区 ACP 桥拉起的会话算不算官方工具，
智谱没写明。账号登录的令牌过期后不会自动刷新，要重新登录。

## 登录

在插件页（App 的插件详情 → 打开，默认 Bot 的登录网页）或聊天里发 `/wonton login`，按提示挑一种：

- **智谱账号**：Z.ai 账号或 bigmodel.cn 账号，点登录后把打印的链接在浏览器打开并同意，登录进程自己轮询完成，不用回贴码。
- **Coding Plan key**：在智谱控制台生成 key，粘贴一行回车即可。

## 构建镜像

```bash
docker build -t ghcr.io/geraldpeng6/wonton-plugin-zcode:0.1.1 -f images/wonton-plugin-zcode/Dockerfile images/wonton-plugin-zcode
```

构建时从官方 CDN 下载 ZCode 桌面包并核对 sha256，只留下 CLI。桥镜像由主仓库维护，`scripts/publish.sh` 只构建本仓库 `images/` 下的 Agent 镜像。

## 图标

`icon.png` 取自上游 `packages/desktop/build/icons/512x512.png`，只把透明圆角补成本图的背景色、转成不含透明通道的图片。
ZCode 和智谱是智谱的商标；本插件不是智谱的官方出品。来源和许可证见 [NOTICE](NOTICE)。
