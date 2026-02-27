ALTER TABLE rules.race
    ADD COLUMN IF NOT EXISTS species_code varchar NULL;

ALTER TABLE rules.default_5e_race
    ADD COLUMN IF NOT EXISTS species_code varchar NULL;

ALTER TABLE rules.default_2024_race
    ADD COLUMN IF NOT EXISTS species_code varchar NULL;

UPDATE rules.race
SET species_code = code
WHERE species_code IS NULL;

UPDATE rules.default_5e_race
SET species_code = code
WHERE species_code IS NULL;

WITH species_by_stats AS (
    SELECT race_stats_id,
           (array_agg(code ORDER BY length(code), code))[1] AS species_code
    FROM rules.default_2024_race
    GROUP BY race_stats_id
)
UPDATE rules.default_2024_race r
SET species_code = s.species_code
FROM species_by_stats s
WHERE r.race_stats_id = s.race_stats_id
  AND r.species_code IS DISTINCT FROM s.species_code;
