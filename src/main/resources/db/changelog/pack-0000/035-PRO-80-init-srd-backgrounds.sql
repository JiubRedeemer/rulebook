/* DND2024: SRD backgrounds (subset) */
CREATE TABLE IF NOT EXISTS rules.srd_2024_background
(
    id                  uuid NOT NULL,
    name                text NOT NULL,
    description         text NULL,
    code                text NOT NULL,
    img_url             varchar NULL,
    background_stats_id uuid NOT NULL,
    CONSTRAINT srd_2024_background_pkey PRIMARY KEY (id)
);

-- ACOLYTE
INSERT INTO rules.background_stats (id, ability_modifiers)
VALUES ('0c377147-8670-4d2f-8d01-ea930864dbaa'::uuid, '["INT","WIS","CHA"]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_trait (id, background_stats_id, name, code, description)
VALUES ('ff856cf8-e313-4aee-aabb-7b63a8e5c4fc'::uuid,
        '0c377147-8670-4d2f-8d01-ea930864dbaa'::uuid,
        'Посвящённый в магию (Жрец)'::text,
        'MAGIC_INITIATE_CLERIC'::text,
        'Два заговора и одно заклинание 1 уровня из списка жреца.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_proficiency (id, background_stats_id, type, code)
VALUES ('33469184-4583-4d57-9a0a-cc82293c173a'::uuid, '0c377147-8670-4d2f-8d01-ea930864dbaa'::uuid, 'SKILL'::text, 'INSIGHT'::text),
       ('ae329e72-9e15-42e5-a0f6-ac3739ea6033'::uuid, '0c377147-8670-4d2f-8d01-ea930864dbaa'::uuid, 'SKILL'::text, 'RELIGION'::text),
       ('25a91108-7879-4208-b8e4-81a64bc34a95'::uuid, '0c377147-8670-4d2f-8d01-ea930864dbaa'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_background (id, name, description, code, img_url, background_stats_id)
SELECT 'c7e4aa77-4a16-4449-bc8d-850f04cc2208'::uuid,
       b.name,
       b.description,
       'ACOLYTE'::text,
       'ACOLYTE'::varchar,
       '0c377147-8670-4d2f-8d01-ea930864dbaa'::uuid
FROM rules.default_2024_background b
WHERE b.code = 'ACOLYTE'
ON CONFLICT (id) DO NOTHING;

-- CRIMINAL
INSERT INTO rules.background_stats (id, ability_modifiers)
VALUES ('a23951bc-cb75-4232-858f-5028892dcda6'::uuid, '["DEX","CON","INT"]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_trait (id, background_stats_id, name, code, description)
VALUES ('546a4070-de10-4d87-a745-c82d64a0db32'::uuid,
        'a23951bc-cb75-4232-858f-5028892dcda6'::uuid,
        'Бдительный'::text,
        'ALERT'::text,
        'Бонус мастерства к инициативе. Возможность поменяться местом в инициативе с союзником.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_proficiency (id, background_stats_id, type, code)
VALUES ('590d9d25-c11b-4f66-a1f9-0aa3646cd376'::uuid, 'a23951bc-cb75-4232-858f-5028892dcda6'::uuid, 'SKILL'::text, 'SLEIGHT_OF_HAND'::text),
       ('ddab5a48-0386-4130-9f59-a35627caaf76'::uuid, 'a23951bc-cb75-4232-858f-5028892dcda6'::uuid, 'SKILL'::text, 'STEALTH'::text),
       ('f2aef235-aa78-4386-9bb0-2b402e1d6b78'::uuid, 'a23951bc-cb75-4232-858f-5028892dcda6'::uuid, 'TOOL'::text, 'THIEVES_TOOLS'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_background (id, name, description, code, img_url, background_stats_id)
SELECT '319a02da-1780-4978-a72e-6241349cd564'::uuid,
       b.name,
       b.description,
       'CRIMINAL'::text,
       'CRIMINAL'::varchar,
       'a23951bc-cb75-4232-858f-5028892dcda6'::uuid
FROM rules.default_2024_background b
WHERE b.code = 'CRIMINAL'
ON CONFLICT (id) DO NOTHING;

-- SAGE
INSERT INTO rules.background_stats (id, ability_modifiers)
VALUES ('f4e240cd-b095-4bae-8002-892d3b0cd14f'::uuid, '["CON","INT","WIS"]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_trait (id, background_stats_id, name, code, description)
VALUES ('a37747a1-10b3-4c71-86b0-3127db5d424a'::uuid,
        'f4e240cd-b095-4bae-8002-892d3b0cd14f'::uuid,
        'Посвящённый в магию (Волшебник)'::text,
        'MAGIC_INITIATE_WIZARD'::text,
        'Два заговора и одно заклинание 1 уровня из списка волшебника.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_proficiency (id, background_stats_id, type, code)
VALUES ('5c004158-c041-47ec-8573-01c17aa3666a'::uuid, 'f4e240cd-b095-4bae-8002-892d3b0cd14f'::uuid, 'SKILL'::text, 'HISTORY'::text),
       ('20830095-6caa-4c82-8a43-11fb405568fd'::uuid, 'f4e240cd-b095-4bae-8002-892d3b0cd14f'::uuid, 'SKILL'::text, 'ARCANA'::text),
       ('7251acfa-8df9-43c7-94d9-ca29abb5fd43'::uuid, 'f4e240cd-b095-4bae-8002-892d3b0cd14f'::uuid, 'TOOL'::text, 'CALLIGRAPHY_SUPPLIES'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_background (id, name, description, code, img_url, background_stats_id)
SELECT '121393c3-d249-4f46-8ac7-2b15ae896ec0'::uuid,
       b.name,
       b.description,
       'SAGE'::text,
       'SAGE'::varchar,
       'f4e240cd-b095-4bae-8002-892d3b0cd14f'::uuid
FROM rules.default_2024_background b
WHERE b.code = 'SAGE'
ON CONFLICT (id) DO NOTHING;

-- SOLDIER
INSERT INTO rules.background_stats (id, ability_modifiers)
VALUES ('da7f2ce6-2ff3-4194-a19e-5e5e351aed98'::uuid, '["STR","DEX","CON"]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_trait (id, background_stats_id, name, code, description)
VALUES ('e488e0e8-609e-426b-bc1f-80dd709738c2'::uuid,
        'da7f2ce6-2ff3-4194-a19e-5e5e351aed98'::uuid,
        'Неистово атакующий'::text,
        'SAVAGE_ATTACKER'::text,
        'Раз в ход при попадании оружием можно бросить кости урона дважды и выбрать результат.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.background_proficiency (id, background_stats_id, type, code)
VALUES ('c652ac30-6c91-4ff8-9428-164a8541b8bd'::uuid, 'da7f2ce6-2ff3-4194-a19e-5e5e351aed98'::uuid, 'SKILL'::text, 'ATHLETICS'::text),
       ('3aca0b0e-ab17-4976-b5fe-14b672d922de'::uuid, 'da7f2ce6-2ff3-4194-a19e-5e5e351aed98'::uuid, 'SKILL'::text, 'INTIMIDATION'::text),
       ('3a6f8457-4985-496d-92e3-61ee85e7811a'::uuid, 'da7f2ce6-2ff3-4194-a19e-5e5e351aed98'::uuid, 'TOOL'::text, 'GAMING_SET'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_background (id, name, description, code, img_url, background_stats_id)
SELECT '4e9230f5-e9a2-4b66-ac19-38c134bd06e0'::uuid,
       b.name,
       b.description,
       'SOLDIER'::text,
       'SOLDIER'::varchar,
       'da7f2ce6-2ff3-4194-a19e-5e5e351aed98'::uuid
FROM rules.default_2024_background b
WHERE b.code = 'SOLDIER'
ON CONFLICT (id) DO NOTHING;
