INSERT INTO posts (id, title, slug, excerpt, content, published_at)
VALUES
  ('1', 'Designing a Portfolio Platform', 'designing-a-portfolio-platform', 'How I structured services and a gateway for a personal platform.', '...', NOW() - INTERVAL '10 days'),
  ('2', 'Scaling APIs with Caching', 'scaling-apis-with-caching', 'Practical notes on caching, invalidation, and observability.', '...', NOW() - INTERVAL '7 days'),
  ('3', 'Postgres Tips I Use Weekly', 'postgres-tips-i-use-weekly', 'Indexes, query plans, and useful extensions.', '...', NOW() - INTERVAL '5 days'),
  ('4', 'System Design Notes: Event Backbones', 'system-design-event-backbones', 'Kafka vs RabbitMQ vs NATS for different needs.', '...', NOW() - INTERVAL '3 days'),
  ('5', 'Next.js App Router Patterns', 'nextjs-app-router-patterns', 'Simple patterns for clean UI composition.', '...', NOW() - INTERVAL '1 day'),
  ('6', 'Ship Small, Iterate Fast', 'ship-small-iterate-fast', 'Why small increments beat big rewrites.', '...', NOW() - INTERVAL '12 hours');
