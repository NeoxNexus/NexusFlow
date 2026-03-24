# NexusFlow Walkthroughs

本文件用于说明如何在真实工作中使用 NexusFlow，而不是只看设计文档。

---

## Walkthrough 1：记录一条新的工作样本

### 适用场景
当你完成了一项关键工作，或明显感觉这是一个可能重复出现的任务时。

### 操作步骤
1. 打开：`NexusFlow/logs/manual-journals/manual-journal-template.md`
2. 复制为一个新文件
3. 文件名建议：
   - `YYYY-MM-DD-sample-xx-<slug>.md`
4. 填写：
   - 任务标题
   - 背景 / 上下文
   - 目标
   - 主要步骤
   - 输出结果
   - 是否疑似重复任务
   - 推荐沉淀形态

### 最低要求
如果时间不够，至少记：
- 做了什么
- 为什么做
- 大概怎么做的
- 是否觉得它会重复出现

---

## Walkthrough 2：把一个重复任务加入候选池

### 适用场景
当你发现某类任务已经出现 2~3 次，或你非常确定它是高频重复任务。

### 操作步骤
1. 打开：`NexusFlow/analysis/candidates/candidate-evaluation-template.md`
2. 新建候选文件
3. 填写：
   - 候选名称
   - 典型场景
   - 最近出现频率
   - 单次耗时
   - 重复步骤
   - 推荐沉淀形态
   - 评分与综合判断
4. 更新 weekly review 时把它加入候选池排序

---

## Walkthrough 3：做一次 weekly review

### 适用场景
建议每周固定做一次。

### 操作步骤
1. 打开：`NexusFlow/logs/weekly-reviews/weekly-review-template.md`
2. 复制为本周 review 文件
3. 汇总本周关键样本
4. 填写：
   - Top 高频任务
   - 重复任务候选
   - 新增候选
   - 当前 Top 候选池优先级
   - 已有能力资产使用反馈
   - 下周建议动作
5. 对照：`NexusFlow/capabilities/checklists/weekly-review-checklist.md` 做检查

---

## Walkthrough 4：评估一个任务应该沉淀成什么

### 适用场景
当你确认某个候选值得做，但还没决定是 Skill、Prompt、Script 还是 Checklist。

### 快速判断
- **更像 Skill**：触发条件清晰、输入输出稳定、可重复执行
- **更像 Prompt**：更偏分析框架、过程灵活、输出结构相对稳定
- **更像 Script**：主要价值在固定命令或数据处理
- **更像 Checklist**：主要价值在避免遗漏、保留人工判断

### 推荐做法
优先从最轻的形态开始，不要一上来就做重 Skill。

---

## Walkthrough 5：落地一个新的能力资产

### 适用场景
当某个候选已经进入实施队列。

### 操作步骤
1. 先确认候选评估文件已完成
2. 选择最合适的能力形态
3. 在对应目录落文件：
   - Prompt → `NexusFlow/capabilities/prompts/`
   - Checklist → `NexusFlow/capabilities/checklists/`
   - Script → `NexusFlow/capabilities/scripts/`
   - Skill → `NexusFlow/capabilities/skills/`
4. 如是 Skill，先对照：`skill-launch-checklist.md`
5. 落地后，把这件事本身记回：
   - 工作日志
   - feedback
   - weekly review

---

## Walkthrough 6：判断是否该进入下一阶段

### 可以进入下一阶段的信号
- 已积累 10+ 条有效样本
- 已完成至少 2 次 weekly review
- 已有 1~2 个能力资产被真实使用多次
- 已能看出哪些候选确实值得继续做

### 暂时不要进入下一阶段的信号
- 样本还很少
- review 还没形成节奏
- 能力资产只是写了文件但没用过
- 还在持续调整最基本的模板和结构

---

## 一句话使用原则

> 先用 NexusFlow 记录真实工作并形成节奏，再决定该自动化什么，而不是先把系统做复杂。
