CREATE TABLE rules.default_2024_race
(
    id            uuid NOT NULL,
    name          text NOT NULL,
    description   text NULL,
    code          text NOT NULL,
    race_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE rules.default_2024_clazz
(
    id             uuid NOT NULL,
    name           text NOT NULL,
    description    text NULL,
    code           text NOT NULL,
    clazz_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE rules.default_2024_race
    ADD CONSTRAINT FKdefault_2024_race_stats FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);

ALTER TABLE rules.default_2024_clazz
    ADD CONSTRAINT FKdefault_2024_clazz_stats FOREIGN KEY (clazz_stats_id) REFERENCES rules.clazz_stats (id);

/* DND2024: Базовые характеристики рас (заполнители) */
/* Аасимар */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f101'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Боггарт */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f102'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Гном */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f103'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Голиаф */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Дампир */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f105'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Дварф */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f106'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Драконорождённый */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f107'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Изменяющийся */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f108'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Изменяющийся Лорвина */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f109'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Калаштар */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10a'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Киткин */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10b'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Кованный */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10c'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Орк */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10d'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Полурослик */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10e'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Раймкин */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10f'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Тифлинг */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f110'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Флеймкин */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f111'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Фэйри */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f112'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Хоравар */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f113'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Человек */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f114'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Шифтер */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f115'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Эльф (LFL) */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f116'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);
/* Эльф (PHB) */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f117'::uuid, 100::integer, 200::integer, 150::integer, 30::integer,
        '[]'::jsonb);

/* DND2024: расы */
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b201'::uuid, 'Аасимар'::text, 'Данные требуют уточнения.'::text, 'AASIMAR'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f101'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b202'::uuid, 'Боггарт'::text, 'Данные требуют уточнения.'::text, 'BOGGART'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f102'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b203'::uuid, 'Гном'::text, 'Данные требуют уточнения.'::text, 'GNOME'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f103'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b204'::uuid, 'Голиаф'::text, 'Данные требуют уточнения.'::text, 'GOLIATH'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b205'::uuid, 'Дампир'::text, 'Данные требуют уточнения.'::text, 'DHAMPIR'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f105'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b206'::uuid, 'Дварф'::text, 'Данные требуют уточнения.'::text, 'DWARF'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f106'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b207'::uuid, 'Драконорождённый'::text, 'Данные требуют уточнения.'::text, 'DRAGONBORN'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f107'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b208'::uuid, 'Изменяющийся'::text, 'Данные требуют уточнения.'::text, 'CHANGELING'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f108'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b209'::uuid, 'Изменяющийся Лорвина'::text, 'Данные требуют уточнения.'::text, 'LORWYN_CHANGELING'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f109'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b20a'::uuid, 'Калаштар'::text, 'Данные требуют уточнения.'::text, 'KALASHTAR'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10a'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b20b'::uuid, 'Киткин'::text, 'Данные требуют уточнения.'::text, 'KITHKIN'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10b'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b20c'::uuid, 'Кованный'::text, 'Данные требуют уточнения.'::text, 'WARFORGED'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10c'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b20d'::uuid, 'Орк'::text, 'Данные требуют уточнения.'::text, 'ORC'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10d'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b20e'::uuid, 'Полурослик'::text, 'Данные требуют уточнения.'::text, 'HALFLING'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10e'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b20f'::uuid, 'Раймкин'::text, 'Данные требуют уточнения.'::text, 'RIMEKIN'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f10f'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b210'::uuid, 'Тифлинг'::text, 'Данные требуют уточнения.'::text, 'TIEFLING'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f110'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b211'::uuid, 'Флеймкин'::text, 'Данные требуют уточнения.'::text, 'FLAMEKIN'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f111'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b212'::uuid, 'Фэйри'::text, 'Данные требуют уточнения.'::text, 'FAERIE'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f112'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b213'::uuid, 'Хоравар'::text, 'Данные требуют уточнения.'::text, 'KHORAVAR'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f113'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b214'::uuid, 'Человек'::text, 'Данные требуют уточнения.'::text, 'HUMAN'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f114'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b215'::uuid, 'Шифтер'::text, 'Данные требуют уточнения.'::text, 'SHIFTER'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f115'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b216'::uuid, 'Эльф (LFL)'::text, 'Данные требуют уточнения.'::text, 'ELF_LFL'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f116'::uuid);
INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
VALUES ('d7e0d4a3-4c9f-4b9f-a074-8ad6f2f8b217'::uuid, 'Эльф (PHB)'::text, 'Данные требуют уточнения.'::text, 'ELF_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f117'::uuid);

/* DND2024: характеристики класса (Псионик) */
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('4c8d06b4-4a60-4dc4-8b0e-94a2e8fb8f01'::uuid, '0+CON'::text, '0+CON'::text, '[]'::jsonb, '[]'::jsonb);

/* DND2024: классы */
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b301'::uuid, 'Бард'::text, 'Данные требуют уточнения.'::text, 'BARD'::text, 'e768eed6-ad5e-4a4f-b48b-bf99f74373a9'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b302'::uuid, 'Варвар'::text, 'Данные требуют уточнения.'::text, 'BARBARIAN'::text, 'b5c59b67-4405-4342-b351-09a264e38adf'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b303'::uuid, 'Воин'::text, 'Данные требуют уточнения.'::text, 'FIGHTER'::text, 'd37773f5-fc06-4c99-b048-e6cafd1ac8fa'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b304'::uuid, 'Волшебник'::text, 'Данные требуют уточнения.'::text, 'WIZARD'::text, 'dadeba2d-0278-4577-87aa-81defe56dab9'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b305'::uuid, 'Друид'::text, 'Данные требуют уточнения.'::text, 'DRUID'::text, '9898735e-04b8-4fd7-96f1-0e7759f2bab4'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b306'::uuid, 'Жрец'::text, 'Данные требуют уточнения.'::text, 'CLERIC'::text, '4c3f4fdb-9b6f-4e33-88e5-775fea197e64'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b307'::uuid, 'Изобретатель (UAA)'::text, 'Данные требуют уточнения.'::text, 'ARTIFICER_UAA'::text, 'dc23fb8a-a8d8-4e98-be5f-5cdba6391841'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b308'::uuid, 'Изобретатель (EFA)'::text, 'Данные требуют уточнения.'::text, 'ARTIFICER_EFA'::text, 'dc23fb8a-a8d8-4e98-be5f-5cdba6391841'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b309'::uuid, 'Колдун'::text, 'Данные требуют уточнения.'::text, 'WARLOCK'::text, '65b5e743-618e-4459-b92b-0643594435e4'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b30a'::uuid, 'Монах'::text, 'Данные требуют уточнения.'::text, 'MONK'::text, 'b0a7f658-f59c-4199-9953-511edd83e822'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b30b'::uuid, 'Паладин'::text, 'Данные требуют уточнения.'::text, 'PALADIN'::text, 'fbe7a3ee-c355-4ec0-95f0-73c999107e5e'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b30c'::uuid, 'Плут'::text, 'Данные требуют уточнения.'::text, 'ROGUE'::text, '066b7e5d-85a9-4a53-b485-a09da72ba2e0'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b30d'::uuid, 'Псионик (UAPU)'::text, 'Данные требуют уточнения.'::text, 'PSION'::text, '4c8d06b4-4a60-4dc4-8b0e-94a2e8fb8f01'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b30e'::uuid, 'Следопыт'::text, 'Данные требуют уточнения.'::text, 'RANGER'::text, 'eeb72220-6167-48b9-9f58-75049335ee35'::uuid);
INSERT INTO rules.default_2024_clazz (id, name, description, code, clazz_stats_id)
VALUES ('a6f4d34e-4c6b-4ea7-bb2b-5c7e0b48b30f'::uuid, 'Чародей'::text, 'Данные требуют уточнения.'::text, 'SORCERER'::text, '4f11a60a-b7c2-4892-a256-c26c1e9b2c12'::uuid);
