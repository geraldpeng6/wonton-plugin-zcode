# zcode 是 Agent：没有网页入口、应用账号体系或插件自己的 MCP 服务。
# 通用插件冒烟只验证清单能装上；Matrix 加密私聊、模型回答和 Wonton MCP 在专项验收里实测。
#
# 数据：Bot 数据目录里是 Matrix 会话加密状态、对话历史和登录凭据；data 钩子只允许 SMOKE_* 变量和
# web_get / dweb（打插件网页的通道），Agent 插件没有网页，钩子够不到数据目录。
# 因此声明 DATA_NA=1，升级保数据、重装保数据按声明记 N/A，数据存活在专项验收里实测。
# shellcheck shell=bash disable=SC2034
IDENTITY_NA=1
DATA_NA=1
SMOKE_NOTE="zcode 没有网页入口、应用账号体系或插件自己的 MCP 服务；网页、主人身份、插件工具三项不适用。专项验收验证加密 Matrix 私聊、模型回答和 Wonton MCP 只读工具。"
