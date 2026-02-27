UPDATE rules.default_2024_clazz c
SET group_code = CASE
    WHEN c.code LIKE 'ARTIFICER_%' THEN 'ARTIFICER'
    WHEN split_part(c.code, '_', 1) IN (
        'BARD', 'BARBARIAN', 'CLERIC', 'DRUID', 'FIGHTER',
        'MONK', 'PALADIN', 'RANGER', 'ROGUE', 'SORCERER',
        'WARLOCK', 'WIZARD', 'PSION'
    ) THEN split_part(c.code, '_', 1)
    ELSE stats_group.base_code
END
FROM (
    SELECT clazz_stats_id,
           (array_agg(code ORDER BY CASE WHEN code NOT LIKE '%\_%' ESCAPE '\' THEN 0 ELSE 1 END, length(code), code))[1] AS base_code
    FROM rules.default_2024_clazz
    GROUP BY clazz_stats_id
) stats_group
WHERE c.clazz_stats_id = stats_group.clazz_stats_id;
