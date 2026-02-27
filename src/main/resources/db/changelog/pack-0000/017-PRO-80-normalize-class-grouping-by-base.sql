WITH canonical_base_candidates AS (
    SELECT clazz_stats_id,
           CASE
               WHEN code IN (
                   'BARD', 'BARBARIAN', 'CLERIC', 'DRUID', 'FIGHTER',
                   'MONK', 'PALADIN', 'RANGER', 'ROGUE', 'SORCERER',
                   'WARLOCK', 'WIZARD', 'PSION'
               ) THEN code
               WHEN code IN ('ARTIFICER_UAA', 'ARTIFICER_EFA') THEN 'ARTIFICER'
               ELSE NULL
           END AS canonical_base
    FROM rules.default_2024_clazz
),
canonical_base_by_stats AS (
    SELECT clazz_stats_id,
           (array_agg(canonical_base ORDER BY length(canonical_base), canonical_base))[1] AS canonical_base
    FROM canonical_base_candidates
    WHERE canonical_base IS NOT NULL
    GROUP BY clazz_stats_id
)
UPDATE rules.default_2024_clazz c
SET group_code = b.canonical_base
FROM canonical_base_by_stats b
WHERE c.clazz_stats_id = b.clazz_stats_id
  AND c.group_code IS DISTINCT FROM b.canonical_base;

UPDATE rules.default_2024_clazz
SET group_code = CASE
    WHEN name ILIKE 'Бард.%' THEN 'BARD'
    WHEN name ILIKE 'Варвар.%' THEN 'BARBARIAN'
    WHEN name ILIKE 'Жрец.%' THEN 'CLERIC'
    WHEN name ILIKE 'Друид.%' THEN 'DRUID'
    WHEN name ILIKE 'Воин.%' THEN 'FIGHTER'
    WHEN name ILIKE 'Монах.%' THEN 'MONK'
    WHEN name ILIKE 'Паладин.%' THEN 'PALADIN'
    WHEN name ILIKE 'Следопыт.%' THEN 'RANGER'
    WHEN name ILIKE 'Плут.%' THEN 'ROGUE'
    WHEN name ILIKE 'Колдун.%' THEN 'WARLOCK'
    WHEN name ILIKE 'Волшебник.%' THEN 'WIZARD'
    WHEN name ILIKE 'Изобретатель.%' OR name ILIKE 'Изобретатель (%' THEN 'ARTIFICER'
    ELSE group_code
END
WHERE group_code IS NULL
   OR group_code = code;
