# NexusFlow

NexusFlow 是一个基于 OpenClaw 的个人工作效率提升系统骨架，用来验证并沉淀这样一条闭环：

**工作记录 → 重复识别 → 能力沉淀 → 反馈优化**

它的目标不是一开始就做成一个大而全的自动化平台，而是先用最小可行方式，找到那些真正高频、重复、值得固化的工作流，并把它们逐步沉淀为可复用的能力资产。

---

## 项目目标

NexusFlow 主要解决 4 个问题：

1. **如何低成本记录日常工作**
2. **如何识别高频重复任务**
3. **如何判断任务应沉淀为哪种能力形态**
4. **如何对已沉淀能力做反馈、迭代和治理**

这里的“能力形态”包括：
- OpenClaw Skill
- Prompt 模板
- Script
- Checklist

---

## 当前设计原则

- **先闭环，再自动化**
- **先单场景，再通用化**
- **先人工识别，后自动识别**
- **数据层与能力层解耦**
- **OpenClaw 做交互与编排，脚本做重数据处理**

---

## 当前架构

NexusFlow 采用 4 层结构：

1. **采集层**
   - OpenClaw 会话输入
   - 手动工作日志
   - 可选脚本钩子

2. **数据 / 分析层**
   - SQLite 事件记录
   - 周统计
   - 候选识别
   - 候选评分

3. **能力沉淀层**
   - Skills
   - Prompts
   - Scripts
   - Checklists

4. **反馈治理层**
   - 执行反馈
   - ROI 评估
   - 下线 / 重构建议

---

## 当前已落地内容

目前仓库中已经包含：

- 项目目录骨架
- SQLite 最小 schema
- 数据库初始化文件
- 架构设计文档
- Roadmap
- 实施计划
- 决策记录
- Session handoff 文档
- 工作日志模板
- Weekly review 模板
- 候选评估模板
- 候选识别规则
- Skill 上线 checklist
- Weekly review checklist

---

## 目录结构

```text
NexusFlow/
  README.md
  architecture.md
  roadmap.md
  implementation-plan.md
  decision-log.md
  session-handoff.md

  data/
    workflow.db

  logs/
    inbox-captures/
    manual-journals/
    weekly-reviews/

  analysis/
    rules/
    reports/
    candidates/

  capabilities/
    skills/
    prompts/
    scripts/
    checklists/

  feedback/
    executions/
    ratings/
    retirement/

  sql/
    schema.sql
```

---

## 数据模型（当前最小版）

SQLite 当前包含 5 张核心表：

- `workflow_events`
- `workflow_annotations`
- `workflow_candidates`
- `capability_executions`
- `weekly_reviews`

它们分别负责：
- 原始工作事件
- 人工标注
- 候选任务池
- 能力执行反馈
- 周期性回顾

---

## 如何初始化

如果本机已安装 `sqlite3`：

```bash
sqlite3 NexusFlow/data/workflow.db < NexusFlow/sql/schema.sql
```

---

## 推荐使用顺序

### Phase 0
先做基础文档、目录、数据库、模板落地。

### Phase 1
开始记录真实工作样本，并每周做一次回顾。

### Phase 2
从候选池里选 1 个高价值场景，沉淀为第一个示范能力资产。

### Phase 3
在真实数据足够后，再考虑候选识别自动化。

---

## 当前不做的事

当前阶段明确不做：

- 大而全平台化建设
- 多用户 / 团队协作扩展
- 复杂 ML / 向量数据库识别
- 多个能力资产并行孵化
- 自动更新与复杂版本治理

---

## 核心文档

- `architecture.md`：架构设计细稿
- `roadmap.md`：阶段路线图
- `implementation-plan.md`：当前实施计划
- `decision-log.md`：关键决策记录
- `session-handoff.md`：后续 session 接手说明
- `sql/schema.sql`：SQLite 最小 schema

---

## 建议下一步

建议继续按这个顺序推进：

1. 开始记录第一批真实工作样本
2. 形成第一版 weekly review
3. 生成候选池
4. 选择首个示范能力资产
5. 再补最小脚本层

---

## 当前状态

NexusFlow 目前已经具备：
- 架构骨架
- 数据骨架
- 文档骨架
- 模板骨架

下一步的重点不再是继续空谈设计，而是开始积累真实数据并验证闭环。
