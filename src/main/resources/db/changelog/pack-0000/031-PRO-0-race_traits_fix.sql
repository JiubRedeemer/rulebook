ALTER TABLE rules.race_stats
    ADD COLUMN IF NOT EXISTS race_traits jsonb NOT NULL DEFAULT '[]'::jsonb;

-- Сохраняем полную коллекцию traits в json, чтобы не терять множественные связи.
WITH trait_payload AS (
    SELECT rt.race_stats_id,
           jsonb_agg(
               jsonb_build_object(
                   'id', rt.id,
                   'raceStatsId', rt.race_stats_id,
                   'name', rt.name,
                   'code', rt.code,
                   'description', rt.description
               ) ORDER BY rt.id
           ) AS traits
    FROM rules.race_trait rt
    WHERE rt.race_stats_id IS NOT NULL
    GROUP BY rt.race_stats_id
)
UPDATE rules.race_stats rs
SET race_traits = tp.traits
FROM trait_payload tp
WHERE rs.id = tp.race_stats_id
  AND (rs.race_traits IS NULL OR rs.race_traits = '[]'::jsonb);
