# NexusFlow

基于 OpenClaw 的个人工作效率提升系统骨架。

## 当前定位

这是一个用于验证“工作记录 → 重复识别 → 能力沉淀 → 反馈优化”闭环的最小系统。

当前目标不是建设通用平台，而是先证明最小闭环可行。

## 当前已落地

- 目录骨架
- SQLite 最小 schema
- 数据库初始化
- 架构设计文档
- roadmap
- 实施计划
- 决策记录
- session handoff 文档

## 核心文档

- `architecture.md`：架构设计细稿
- `roadmap.md`：阶段路线图
- `implementation-plan.md`：当前实施计划
- `decision-log.md`：关键决策记录
- `session-handoff.md`：后续 session 接手说明
- `sql/schema.sql`：SQLite 最小 schema

## 目录说明

- `data/`：SQLite 数据库与导出数据
- `logs/`：原始日志、手动日志、周回顾
- `analysis/`：规则、候选池、分析报告
- `capabilities/`：Skills、Prompts、Scripts、Checklists
- `feedback/`：执行反馈、评分、下线建议
- `sql/`：数据库初始化与迁移脚本

## 初始化

```bash
sqlite3 NexusFlow/data/workflow.db < NexusFlow/sql/schema.sql
```

## 建议下一步

1. 补模板层
2. 补规则层
3. 选择首个示范能力资产
4. 再进入脚本层和半自动化
