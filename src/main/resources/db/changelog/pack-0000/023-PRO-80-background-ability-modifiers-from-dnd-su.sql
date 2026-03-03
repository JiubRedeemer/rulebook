-- DND2024: способности предысторий из next.dnd.su
-- Источник на каждой странице предыстории (напр. https://next.dnd.su/backgrounds/896-farmer/):
--   XPath: /html/body/main/div/div/div/section[2]/div/div/div[2]/ul/li[1]/text()
--   Содержимое: "Характеристики: Сила, Телосложение, Мудрость" и т.д.
-- Коды характеристик берём только из rules.default_5e_ability (002): STR, DEX, CON, INT, WIS, CHA.

UPDATE rules.background_stats SET ability_modifiers = '["STR","DEX","CHA"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid; /* ENTERTAINER: Сила, Ловкость, Харизма */
UPDATE rules.background_stats SET ability_modifiers = '["DEX","WIS","CHA"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid; /* WAYFARER: Ловкость, Мудрость, Харизма */
UPDATE rules.background_stats SET ability_modifiers = '["STR","INT","CHA"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid; /* NOBLE: Сила, Интеллект, Харизма */
UPDATE rules.background_stats SET ability_modifiers = '["STR","DEX","WIS"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid; /* SAILOR: Сила, Ловкость, Мудрость */
UPDATE rules.background_stats SET ability_modifiers = '["CON","INT","WIS"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid; /* SAGE: Телосложение, Интеллект, Мудрость */
UPDATE rules.background_stats SET ability_modifiers = '["CON","WIS","CHA"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid; /* HERMIT: Телосложение, Мудрость, Харизма */
UPDATE rules.background_stats SET ability_modifiers = '["DEX","INT","WIS"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid; /* SCRIBE: Ловкость, Интеллект, Мудрость */
UPDATE rules.background_stats SET ability_modifiers = '["INT","WIS","CHA"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid; /* ACOLYTE: Интеллект, Мудрость, Харизма */
UPDATE rules.background_stats SET ability_modifiers = '["DEX","CON","INT"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid; /* CRIMINAL: Ловкость, Телосложение, Интеллект */
UPDATE rules.background_stats SET ability_modifiers = '["DEX","CON","WIS"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid; /* GUIDE: Ловкость, Телосложение, Мудрость */
UPDATE rules.background_stats SET ability_modifiers = '["STR","DEX","INT"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid; /* ARTISAN: Сила, Ловкость, Интеллект */
UPDATE rules.background_stats SET ability_modifiers = '["STR","DEX","CON"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid; /* SOLDIER: Сила, Ловкость, Телосложение */
UPDATE rules.background_stats SET ability_modifiers = '["STR","INT","WIS"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid; /* GUARD: Сила, Интеллект, Мудрость */
UPDATE rules.background_stats SET ability_modifiers = '["CON","INT","CHA"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid; /* MERCHANT: Телосложение, Интеллект, Харизма */
UPDATE rules.background_stats SET ability_modifiers = '["STR","CON","WIS"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid; /* FARMER: Сила, Телосложение, Мудрость */
UPDATE rules.background_stats SET ability_modifiers = '["DEX","CON","CHA"]'::jsonb WHERE id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid; /* CHARLATAN: Ловкость, Телосложение, Харизма */
