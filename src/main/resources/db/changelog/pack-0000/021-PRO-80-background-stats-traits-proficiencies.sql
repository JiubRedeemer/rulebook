-- DND2024: характеристики предысторий (ability modifiers, traits, proficiencies)
-- Источник: https://next.dnd.su/backgrounds/ , PHB 2024

CREATE TABLE rules.background_stats
(
    id                uuid NOT NULL,
    ability_modifiers jsonb NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE rules.background_stats IS 'Характеристики предыстории: три характеристики на выбор (+2/+1 или +1/+1/+1)';
COMMENT ON COLUMN rules.background_stats.ability_modifiers IS 'Массив из трёх кодов характеристик из rules.default_5e_ability (002): STR, DEX, CON, INT, WIS, CHA. Источник: next.dnd.su, XPath /html/body/main/div/div/div/section[2]/div/div/div[2]/ul/li[1]/text() (строка «Характеристики: …»).';

CREATE TABLE rules.background_trait
(
    id                  uuid NOT NULL,
    background_stats_id uuid NOT NULL,
    name                text NOT NULL,
    code                text NOT NULL,
    description         text,
    PRIMARY KEY (id)
);

COMMENT ON TABLE rules.background_trait IS 'Черта происхождения (Origin Feat), даруемая предысторией';

CREATE TABLE rules.background_proficiency
(
    id                  uuid NOT NULL,
    background_stats_id uuid NOT NULL,
    type                text NOT NULL,
    code                text NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE rules.background_proficiency IS 'Владение навыком или инструментом от предыстории';
COMMENT ON COLUMN rules.background_proficiency.type IS 'SKILL или TOOL';

ALTER TABLE rules.default_2024_background
    ADD COLUMN background_stats_id uuid NULL;

ALTER TABLE rules.default_2024_background
    ADD CONSTRAINT fk_default_2024_background_stats
        FOREIGN KEY (background_stats_id) REFERENCES rules.background_stats (id);

CREATE INDEX idx_background_trait_stats_id ON rules.background_trait (background_stats_id);
CREATE INDEX idx_background_proficiency_stats_id ON rules.background_proficiency (background_stats_id);

-- Background stats (one per PHB 2024 background). Order matches 020.
-- ability_modifiers: три характеристики с next.dnd.su (section[2]/div/div[2]/ul/li); коды только из rules.default_5e_ability (002): STR, DEX, CON, INT, WIS, CHA.
INSERT INTO rules.background_stats (id, ability_modifiers)
VALUES ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, '["STR","DEX","CHA"]'::jsonb),   /* ENTERTAINER */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, '["DEX","WIS","CHA"]'::jsonb),   /* WAYFARER */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, '["STR","INT","CHA"]'::jsonb),   /* NOBLE */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, '["STR","DEX","WIS"]'::jsonb),   /* SAILOR */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, '["CON","INT","WIS"]'::jsonb),   /* SAGE */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, '["CON","WIS","CHA"]'::jsonb),   /* HERMIT */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, '["DEX","INT","WIS"]'::jsonb),   /* SCRIBE */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* ACOLYTE */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, '["DEX","CON","INT"]'::jsonb),   /* CRIMINAL */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, '["DEX","CON","WIS"]'::jsonb),   /* GUIDE */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, '["STR","DEX","INT"]'::jsonb),   /* ARTISAN */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, '["STR","DEX","CON"]'::jsonb),   /* SOLDIER */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, '["STR","INT","WIS"]'::jsonb),   /* GUARD */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, '["CON","INT","CHA"]'::jsonb),   /* MERCHANT */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, '["STR","CON","WIS"]'::jsonb),   /* FARMER */
       ('b901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, '["DEX","CON","CHA"]'::jsonb);   /* CHARLATAN */

UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid WHERE code = 'ENTERTAINER';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid WHERE code = 'WAYFARER';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid WHERE code = 'NOBLE';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid WHERE code = 'SAILOR';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid WHERE code = 'SAGE';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid WHERE code = 'HERMIT';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid WHERE code = 'SCRIBE';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid WHERE code = 'ACOLYTE';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid WHERE code = 'CRIMINAL';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid WHERE code = 'GUIDE';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid WHERE code = 'ARTISAN';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid WHERE code = 'SOLDIER';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid WHERE code = 'GUARD';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid WHERE code = 'MERCHANT';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid WHERE code = 'FARMER';
UPDATE rules.default_2024_background SET background_stats_id = 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid WHERE code = 'CHARLATAN';

ALTER TABLE rules.default_2024_background ALTER COLUMN background_stats_id SET NOT NULL;

-- Traits (Origin Feats): one per background
INSERT INTO rules.background_trait (id, background_stats_id, name, code, description)
VALUES ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'Музыкант'::text, 'MUSICIAN'::text, 'Владение тремя музыкальными инструментами. В конце короткого или продолжительного отдыха вы можете сыграть и дать героическое вдохновение союзникам.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'Везучий'::text, 'LUCKY'::text, 'После продолжительного отдыха получаете пункты удачи. Можете потратить один при броске к20 для преимущества или наложить помеху на атаку по вам.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'Одарённый'::text, 'SKILLED'::text, 'Владение любыми тремя навыками или инструментами на выбор.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'Дебошир'::text, 'TAVERN_BRAWLER'::text, 'Бонус к безоружным атакам, владение импровизированным оружием, возможность оттолкнуть цель.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'Посвящённый в магию (Волшебник)'::text, 'MAGIC_INITIATE_WIZARD'::text, 'Два заговора и одно заклинание 1 уровня из списка волшебника.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'Лекарь'::text, 'HEALER'::text, 'Использование комплекта целителя восстанавливает хиты с бонусом мастерства. Переброс 1 при исцелении.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'Одарённый'::text, 'SKILLED'::text, 'Владение любыми тремя навыками или инструментами на выбор.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'Посвящённый в магию (Жрец)'::text, 'MAGIC_INITIATE_CLERIC'::text, 'Два заговора и одно заклинание 1 уровня из списка жреца.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'Бдительный'::text, 'ALERT'::text, 'Бонус мастерства к инициативе. Возможность поменяться местом в инициативе с союзником.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'Посвящённый в магию (Друид)'::text, 'MAGIC_INITIATE_DRUID'::text, 'Два заговора и одно заклинание 1 уровня из списка друида.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'Мастеровой'::text, 'CRAFTER'::text, 'Владение тремя видами ремесленных инструментов. Скидка на немагические предметы. Быстрое создание предметов.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'Неистово атакующий'::text, 'SAVAGE_ATTACKER'::text, 'Раз в ход при попадании оружием можно бросить кости урона дважды и выбрать результат.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'Бдительный'::text, 'ALERT'::text, 'Бонус мастерства к инициативе. Возможность поменяться местом в инициативе с союзником.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'Везучий'::text, 'LUCKY'::text, 'После продолжительного отдыха получаете пункты удачи.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'Крепкий'::text, 'TOUGH'::text, 'Максимум хитов увеличивается на удвоенный уровень при получении черты, затем на 2 за каждый уровень.'::text),
       ('b701e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'Одарённый'::text, 'SKILLED'::text, 'Владение любыми тремя навыками или инструментами на выбор.'::text);

-- Proficiencies: 2 skills + 1 tool per background (skills first, then tool)
INSERT INTO rules.background_proficiency (id, background_stats_id, type, code)
VALUES
/* ENTERTAINER */ ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'SKILL'::text, 'ACROBATICS'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'SKILL'::text, 'PERFORMANCE'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'TOOL'::text, 'MUSICAL_INSTRUMENT'::text),
/* WAYFARER */   ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'SKILL'::text, 'INSIGHT'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'SKILL'::text, 'STEALTH'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* NOBLE */      ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'SKILL'::text, 'HISTORY'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'SKILL'::text, 'PERSUASION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'TOOL'::text, 'GAMING_SET'::text),
/* SAILOR */     ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'SKILL'::text, 'ACROBATICS'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'TOOL'::text, 'NAVIGATORS_TOOLS'::text),
/* SAGE */       ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'SKILL'::text, 'HISTORY'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'SKILL'::text, 'ARCANA'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text),
/* HERMIT */     ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'SKILL'::text, 'MEDICINE'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c1a1'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'SKILL'::text, 'RELIGION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c1a2'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'TOOL'::text, 'HERBALISM_KIT'::text),
/* SCRIBE */     ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c1a3'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c114'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c115'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text),
/* ACOLYTE */    ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c116'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'SKILL'::text, 'INSIGHT'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c117'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'SKILL'::text, 'RELIGION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c118'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text),
/* CRIMINAL */   ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c119'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'SKILL'::text, 'SLEIGHT_OF_HAND'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c11a'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'SKILL'::text, 'STEALTH'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c11b'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* GUIDE */      ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c11c'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'SKILL'::text, 'SURVIVAL'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c11d'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'SKILL'::text, 'STEALTH'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c11e'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'TOOL'::text, 'CARTOGRAPHERS_TOOLS'::text),
/* ARTISAN */    ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c11f'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c120'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'SKILL'::text, 'PERSUASION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c121'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'TOOL'::text, 'ARTISAN_TOOLS'::text),
/* SOLDIER */    ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c122'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'SKILL'::text, 'ATHLETICS'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c123'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'SKILL'::text, 'INTIMIDATION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c124'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'TOOL'::text, 'GAMING_SET'::text),
/* GUARD */      ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c125'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'SKILL'::text, 'ATHLETICS'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c126'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c127'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'TOOL'::text, 'GAMING_SET'::text),
/* MERCHANT */   ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c128'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'SKILL'::text, 'PERSUASION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c129'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'SKILL'::text, 'ANIMAL_HANDLING'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c12a'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'TOOL'::text, 'NAVIGATORS_TOOLS'::text),
/* FARMER */     ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c12b'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'SKILL'::text, 'NATURE'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c12c'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'SKILL'::text, 'ANIMAL_HANDLING'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c12d'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'TOOL'::text, 'CARPENTERS_TOOLS'::text),
/* CHARLATAN */  ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c12e'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'SKILL'::text, 'DECEPTION'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c12f'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'SKILL'::text, 'SLEIGHT_OF_HAND'::text), ('b601e4a1-4c9f-4b9f-a074-8ad6f2f8c130'::uuid, 'b901e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'TOOL'::text, 'FORGERY_KIT'::text);
