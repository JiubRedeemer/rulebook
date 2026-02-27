ALTER TABLE rules.clazz
    ADD COLUMN IF NOT EXISTS group_code varchar NULL;

ALTER TABLE rules.default_5e_clazz
    ADD COLUMN IF NOT EXISTS group_code varchar NULL;

ALTER TABLE rules.default_2024_clazz
    ADD COLUMN IF NOT EXISTS group_code varchar NULL;

UPDATE rules.clazz
SET group_code = code
WHERE group_code IS NULL;

UPDATE rules.default_5e_clazz
SET group_code = code
WHERE group_code IS NULL;

UPDATE rules.default_2024_clazz
SET group_code = CASE
    WHEN code = 'ARTIFICER_UAA' THEN 'ARTIFICER'
    WHEN code = 'ARTIFICER_EFA' THEN 'ARTIFICER'
    ELSE code
END
WHERE group_code IS NULL;
