PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS workflow_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created_at TEXT NOT NULL,
  source TEXT NOT NULL CHECK (source IN ('openclaw_chat', 'manual_log', 'script_hook')),
  title TEXT NOT NULL,
  raw_input TEXT,
  context_summary TEXT,
  output_type TEXT,
  duration_minutes INTEGER,
  tags TEXT,
  status TEXT DEFAULT 'recorded'
);

CREATE INDEX IF NOT EXISTS idx_workflow_events_created_at
  ON workflow_events(created_at);

CREATE INDEX IF NOT EXISTS idx_workflow_events_source
  ON workflow_events(source);

CREATE TABLE IF NOT EXISTS workflow_annotations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id INTEGER NOT NULL,
  is_repeat_candidate INTEGER NOT NULL DEFAULT 0 CHECK (is_repeat_candidate IN (0, 1)),
  task_category TEXT,
  pain_points TEXT,
  manual_steps TEXT,
  reuse_signal TEXT,
  notes TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (event_id) REFERENCES workflow_events(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_workflow_annotations_event_id
  ON workflow_annotations(event_id);

CREATE INDEX IF NOT EXISTS idx_workflow_annotations_is_repeat_candidate
  ON workflow_annotations(is_repeat_candidate);

CREATE TABLE IF NOT EXISTS workflow_candidates (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT,
  source_event_ids TEXT,
  frequency_score INTEGER DEFAULT 0,
  stability_score INTEGER DEFAULT 0,
  time_saving_score INTEGER DEFAULT 0,
  maintenance_risk_score INTEGER DEFAULT 0,
  recommended_form TEXT CHECK (recommended_form IN ('skill', 'prompt', 'script', 'checklist')),
  priority TEXT CHECK (priority IN ('low', 'medium', 'high')),
  status TEXT DEFAULT 'proposed' CHECK (status IN ('proposed', 'reviewing', 'approved', 'deferred', 'implemented', 'retired')),
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_workflow_candidates_status
  ON workflow_candidates(status);

CREATE INDEX IF NOT EXISTS idx_workflow_candidates_priority
  ON workflow_candidates(priority);

CREATE TABLE IF NOT EXISTS capability_executions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  capability_name TEXT NOT NULL,
  capability_type TEXT NOT NULL CHECK (capability_type IN ('skill', 'prompt', 'script', 'checklist')),
  executed_at TEXT NOT NULL,
  trigger_source TEXT,
  result_status TEXT CHECK (result_status IN ('success', 'partial', 'failed')),
  time_saved_estimate INTEGER,
  feedback_rating INTEGER CHECK (feedback_rating BETWEEN 1 AND 5),
  feedback_note TEXT
);

CREATE INDEX IF NOT EXISTS idx_capability_executions_executed_at
  ON capability_executions(executed_at);

CREATE INDEX IF NOT EXISTS idx_capability_executions_capability_name
  ON capability_executions(capability_name);

CREATE TABLE IF NOT EXISTS weekly_reviews (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  week_start TEXT NOT NULL,
  week_end TEXT NOT NULL,
  top_tasks TEXT,
  candidate_summary TEXT,
  new_recommendations TEXT,
  retirement_recommendations TEXT,
  notes TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_weekly_reviews_week_start
  ON weekly_reviews(week_start);

COMMIT;
