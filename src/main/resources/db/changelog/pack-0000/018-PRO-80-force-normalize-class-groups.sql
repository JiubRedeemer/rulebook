UPDATE rules.default_2024_clazz
SET group_code = CASE
    WHEN code = 'ARTIFICER_UAA' OR code = 'ARTIFICER_EFA' THEN 'ARTIFICER'
    WHEN split_part(code, '_', 1) IN (
        'BARD', 'BARBARIAN', 'CLERIC', 'DRUID', 'FIGHTER',
        'MONK', 'PALADIN', 'RANGER', 'ROGUE', 'SORCERER',
        'WARLOCK', 'WIZARD', 'PSION'
    ) THEN split_part(code, '_', 1)
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
END;
