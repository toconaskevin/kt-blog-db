CREATE TABLE posts (
  id           TEXT PRIMARY KEY,
  title        TEXT NOT NULL,
  slug         TEXT,
  excerpt      TEXT,
  content      TEXT,
  published_at TIMESTAMPTZ DEFAULT NOW(),
  created_at   TIMESTAMPTZ DEFAULT NOW()
);
