-- Eberron: привести предыстории в соответствие с next.dnd.su (Eberron: Forge of the Artificer)
-- Источник: https://next.dnd.su/backgrounds/ — раздел "Eberron: Forge of the Artificer"

-- Удалить старые 8 предысторий ERftLW и их статы/черты/владения
DELETE FROM rules.default_eberron_background
WHERE id IN (
    'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid,
    'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid,
    'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid,
    'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'c801e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid
);

DELETE FROM rules.background_trait
WHERE background_stats_id IN (
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid
);

DELETE FROM rules.background_proficiency
WHERE background_stats_id IN (
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid
);

DELETE FROM rules.background_stats
WHERE id IN (
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid,
    'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid
);

-- 17 предысторий Eberron: Forge of the Artificer (next.dnd.su). Коды из URL страниц.
INSERT INTO rules.background_stats (id, ability_modifiers)
VALUES
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* ABERRANT_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* HOUSE_AGENT */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, '["DEX","INT","WIS"]'::jsonb),   /* ARCHAEOLOGIST */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, '["STR","WIS","CHA"]'::jsonb),   /* HOUSE_VADALIS_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, '["CON","WIS","CHA"]'::jsonb),   /* HOUSE_GHALLANDA_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, '["STR","CON","CHA"]'::jsonb),   /* HOUSE_DENEITH_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, '["CON","INT","WIS"]'::jsonb),   /* HOUSE_JORASCO_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, '["DEX","INT","WIS"]'::jsonb),   /* HOUSE_CANNITH_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* HOUSE_KUNDARAK_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, '["DEX","WIS","CHA"]'::jsonb),   /* HOUSE_LYRANDAR_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* HOUSE_MEDANI_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, '["DEX","CON","CHA"]'::jsonb),   /* HOUSE_ORIEN_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* HOUSE_SIVIS_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, '["STR","WIS","CHA"]'::jsonb),   /* HOUSE_THARASHK_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, '["DEX","INT","CHA"]'::jsonb),   /* HOUSE_THURANNI_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, '["DEX","INT","CHA"]'::jsonb),   /* HOUSE_PHIARLAN_HEIR */
('e901e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, '["DEX","INT","WIS"]'::jsonb);   /* INQUISITIVE */

INSERT INTO rules.default_eberron_background (id, name, description, code, background_stats_id)
VALUES
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'Аберрантный наследник'::text, NULL, 'ABERRANT_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'Агент дома'::text, NULL, 'HOUSE_AGENT'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'Археолог'::text, NULL, 'ARCHAEOLOGIST'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'Наследник дома Вадалис'::text, NULL, 'HOUSE_VADALIS_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'Наследник дома Галланда'::text, NULL, 'HOUSE_GHALLANDA_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'Наследник дома Денейт'::text, NULL, 'HOUSE_DENEITH_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'Наследник дома Джораско'::text, NULL, 'HOUSE_JORASCO_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'Наследник дома Каннит'::text, NULL, 'HOUSE_CANNITH_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'Наследник дома Кундарак'::text, NULL, 'HOUSE_KUNDARAK_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'Наследник дома Лирандар'::text, NULL, 'HOUSE_LYRANDAR_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'Наследник дома Медани'::text, NULL, 'HOUSE_MEDANI_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'Наследник дома Ориен'::text, NULL, 'HOUSE_ORIEN_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'Наследник дома Сивис'::text, NULL, 'HOUSE_SIVIS_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'Наследник дома Тарашк'::text, NULL, 'HOUSE_THARASHK_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'Наследник дома Туранни'::text, NULL, 'HOUSE_THURANNI_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'Наследник дома Фиарлан'::text, NULL, 'HOUSE_PHIARLAN_HEIR'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid),
('e801e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'Сыскной'::text, NULL, 'INQUISITIVE'::text, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid);

-- Черты (заглушки; описание можно подтянуть со страниц next.dnd.su)
INSERT INTO rules.background_trait (id, background_stats_id, name, code, description)
VALUES
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'Аберрантный наследник'::text, 'ABERRANT_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'Агент дома'::text, 'HOUSE_AGENT'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'Археолог'::text, 'ARCHAEOLOGIST'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'Наследник Вадалис'::text, 'HOUSE_VADALIS_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'Наследник Галланда'::text, 'HOUSE_GHALLANDA_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'Наследник Денейт'::text, 'HOUSE_DENEITH_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'Наследник Джораско'::text, 'HOUSE_JORASCO_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'Наследник Каннит'::text, 'HOUSE_CANNITH_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'Наследник Кундарак'::text, 'HOUSE_KUNDARAK_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'Наследник Лирандар'::text, 'HOUSE_LYRANDAR_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'Наследник Медани'::text, 'HOUSE_MEDANI_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'Наследник Ориен'::text, 'HOUSE_ORIEN_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'Наследник Сивис'::text, 'HOUSE_SIVIS_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'Наследник Тарашк'::text, 'HOUSE_THARASHK_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'Наследник Туранни'::text, 'HOUSE_THURANNI_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'Наследник Фиарлан'::text, 'HOUSE_PHIARLAN_HEIR'::text, NULL),
('e701e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'Сыскной'::text, 'INQUISITIVE'::text, NULL);

-- Владения: 2 навыка + 1 инструмент на предысторию (типовые для 2024; коды из default_5e_skill)
INSERT INTO rules.background_proficiency (id, background_stats_id, type, code)
VALUES
/* ABERRANT_HEIR */   ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'SKILL'::text, 'ARCANA'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'SKILL'::text, 'DECEPTION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text),
/* HOUSE_AGENT */     ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'SKILL'::text, 'INSIGHT'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'SKILL'::text, 'PERSUASION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'TOOL'::text, 'GAMING_SET'::text),
/* ARCHAEOLOGIST */   ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'SKILL'::text, 'HISTORY'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'TOOL'::text, 'CARTOGRAPHERS_TOOLS'::text),
/* HOUSE_VADALIS */   ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'SKILL'::text, 'ANIMAL_HANDLING'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'SKILL'::text, 'NATURE'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'TOOL'::text, 'HERBALISM_KIT'::text),
/* HOUSE_GHALLANDA */ ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'SKILL'::text, 'INSIGHT'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'SKILL'::text, 'PERSUASION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'TOOL'::text, 'COOKING_UTENSILS'::text),
/* HOUSE_DENEITH */   ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'SKILL'::text, 'ATHLETICS'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'SKILL'::text, 'INTIMIDATION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c112'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'TOOL'::text, 'GAMING_SET'::text),
/* HOUSE_JORASCO */   ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c113'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'SKILL'::text, 'MEDICINE'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c114'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'SKILL'::text, 'RELIGION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c115'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'TOOL'::text, 'HERBALISM_KIT'::text),
/* HOUSE_CANNITH */   ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c116'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'SKILL'::text, 'ARCANA'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c117'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'SKILL'::text, 'HISTORY'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c118'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'TOOL'::text, 'ARTISAN_TOOLS'::text),
/* HOUSE_KUNDARAK */  ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c119'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c11a'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c11b'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* HOUSE_LYRANDAR */  ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c11c'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c11d'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'SKILL'::text, 'SURVIVAL'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c11e'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'TOOL'::text, 'NAVIGATORS_TOOLS'::text),
/* HOUSE_MEDANI */    ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c11f'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'SKILL'::text, 'INSIGHT'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c120'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c121'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* HOUSE_ORIEN */     ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c122'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'SKILL'::text, 'ATHLETICS'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c123'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c124'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'TOOL'::text, 'LAND_VEHICLES'::text),
/* HOUSE_SIVIS */     ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c125'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'SKILL'::text, 'HISTORY'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c126'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'SKILL'::text, 'PERSUASION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c127'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text),
/* HOUSE_THARASHK */  ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c128'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c129'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'SKILL'::text, 'SURVIVAL'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c12a'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* HOUSE_THURANNI */  ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c12b'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'SKILL'::text, 'DECEPTION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c12c'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'SKILL'::text, 'STEALTH'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c12d'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'TOOL'::text, 'MUSICAL_INSTRUMENT'::text),
/* HOUSE_PHIARLAN */  ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c12e'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'SKILL'::text, 'PERFORMANCE'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c12f'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'SKILL'::text, 'STEALTH'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c130'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'TOOL'::text, 'MUSICAL_INSTRUMENT'::text),
/* INQUISITIVE */      ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c131'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c132'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('e601e4a1-4c9f-4b9f-a074-8ad6f2f8c133'::uuid, 'e901e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text);
