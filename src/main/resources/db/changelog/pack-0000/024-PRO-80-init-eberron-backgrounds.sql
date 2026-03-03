-- Eberron: таблица предысторий (контент заменён в 025 по next.dnd.su — Eberron: Forge of the Artificer)

CREATE TABLE rules.default_eberron_background
(
    id                   uuid NOT NULL,
    name                 text NOT NULL,
    description          text NULL,
    code                 text NOT NULL,
    img_url              varchar NULL,
    background_stats_id  uuid NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE rules.default_eberron_background IS 'Предыстории по умолчанию для сеттинга Eberron (Eberron: Rising from the Last War)';

ALTER TABLE rules.default_eberron_background
    ADD CONSTRAINT fk_default_eberron_background_stats
        FOREIGN KEY (background_stats_id) REFERENCES rules.background_stats (id);

-- Stats for Eberron backgrounds (ability_modifiers: 3 codes from default_5e_ability, 5e-style +2/+1 or +1/+1/+1)
INSERT INTO rules.background_stats (id, ability_modifiers)
VALUES ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, '["DEX","INT","WIS"]'::jsonb),   /* AGENT */
       ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* AUNDAIRIAN_CONJUROR */
       ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, '["DEX","INT","CHA"]'::jsonb),   /* BOROMAR_CRIMINAL */
       ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, '["INT","WIS","CHA"]'::jsonb),   /* CLAN_AGENT */
       ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, '["CON","WIS","CHA"]'::jsonb),   /* GATEKEEPER_INITIATE */
       ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, '["STR","INT","CHA"]'::jsonb),   /* INHERITOR */
       ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, '["DEX","INT","WIS"]'::jsonb),   /* INVESTIGATOR */
       ('c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, '["DEX","WIS","CHA"]'::jsonb);   /* URBAN_BOUNTY_HUNTER */

INSERT INTO rules.default_eberron_background (id, name, description, code, background_stats_id)
VALUES ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'Агент'::text, 'Вы работали на Корановскую хронику или другую организацию, собирая сведения и выполняя поручения.'::text, 'AGENT'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid),
       ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'Конъюратор из Аундаира'::text, 'Вы обучались магии в Аундаире и связаны с тайнами и традициями этой земли.'::text, 'AUNDAIRIAN_CONJUROR'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid),
       ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'Преступник Боромаров'::text, 'Вы связаны с кланом Боромар и преступным миром Шарна.'::text, 'BOROMAR_CRIMINAL'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid),
       ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'Агент дома'::text, 'Вы служите одному из драконmarked домов Кхорвайра.'::text, 'CLAN_AGENT'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid),
       ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'Послушник Стражей Врат'::text, 'Вы прошли посвящение у Стражей Врат и противостоите силам Проклятой Пустоши.'::text, 'GATEKEEPER_INITIATE'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid),
       ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'Наследник'::text, 'Вы несёте наследие — драконный знак, артефакт или долг предков.'::text, 'INHERITOR'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid),
       ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'Следователь'::text, 'Вы расследуете преступления и тайны, владея методами сыска.'::text, 'INVESTIGATOR'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid),
       ('c801e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'Городской охотник за головами'::text, 'Вы зарабатываете поимкой преступников в городских джунглях.'::text, 'URBAN_BOUNTY_HUNTER'::text, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid);

-- Traits (one per Eberron background; short feature names)
INSERT INTO rules.background_trait (id, background_stats_id, name, code, description)
VALUES ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'Контакты'::text, 'CONTACTS'::text, 'Доступ к информации и союзникам организации.'::text),
       ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'Посвящённый в магию (Волшебник)'::text, 'MAGIC_INITIATE_WIZARD'::text, 'Заговоры и заклинание 1 уровня из списка волшебника.'::text),
       ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'Подпольные контакты'::text, 'UNDERWORLD_CONTACTS'::text, 'Связи в преступном мире Шарна.'::text),
       ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'Домовая позиция'::text, 'HOUSE_POSITION'::text, 'Привилегии и обязанности агента дома.'::text),
       ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'Страж Врат'::text, 'GATEKEEPER'::text, 'Знания о Проклятой Пустоши и её сдерживании.'::text),
       ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'Наследие'::text, 'INHERITED'::text, 'Особые способности или долг, связанные с наследием.'::text),
       ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'Официальный запрос'::text, 'OFFICIAL_INQUIRY'::text, 'Доступ к местам и лицам при расследовании.'::text),
       ('c701e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'Охота за головами'::text, 'BOUNTY_HUNTER'::text, 'Умение выслеживать и задерживать цель в городе.'::text);

-- Proficiencies: 2 skills + 1 tool per background (codes from default_5e_skill / tools)
INSERT INTO rules.background_proficiency (id, background_stats_id, type, code)
VALUES
/* AGENT */                ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'SKILL'::text, 'DECEPTION'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'SKILL'::text, 'STEALTH'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* AUNDAIRIAN_CONJUROR */  ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'SKILL'::text, 'ARCANA'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'SKILL'::text, 'HISTORY'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text),
/* BOROMAR_CRIMINAL */     ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'SKILL'::text, 'SLEIGHT_OF_HAND'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'SKILL'::text, 'STEALTH'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* CLAN_AGENT */           ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'SKILL'::text, 'INSIGHT'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'SKILL'::text, 'PERSUASION'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'TOOL'::text, 'GAMING_SET'::text),
/* GATEKEEPER_INITIATE */  ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'SKILL'::text, 'NATURE'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'SKILL'::text, 'SURVIVAL'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'TOOL'::text, 'HERBALISM_KIT'::text),
/* INHERITOR */            ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'SKILL'::text, 'HISTORY'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c111'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'SKILL'::text, 'RELIGION'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c112'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text),
/* INVESTIGATOR */         ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c113'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c114'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'SKILL'::text, 'PERCEPTION'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c115'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text),
/* URBAN_BOUNTY_HUNTER */  ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c116'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'SKILL'::text, 'INVESTIGATION'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c117'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'SKILL'::text, 'STEALTH'::text), ('c601e4a1-4c9f-4b9f-a074-8ad6f2f8c118'::uuid, 'c901e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text);

ALTER TABLE rules.default_eberron_background ALTER COLUMN background_stats_id SET NOT NULL;
