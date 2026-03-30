
/* DND2024: SRD classes (srd_2024_clazz) */
CREATE TABLE IF NOT EXISTS rules.srd_2024_clazz
(
    id uuid NOT NULL,
    "name" text NOT NULL,
    description text NULL,
    code text NOT NULL,
    clazz_stats_id uuid NOT NULL,
    img_url varchar NULL,
    group_code varchar NULL,
    CONSTRAINT srd_2024_clazz_pkey PRIMARY KEY (id)
);

-- Base classes
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('ec7255ce-fb8c-445b-8dc7-2ff553f614b3'::uuid, '12+CON'::text, '12+CON'::text, '["STR","CON"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('13360e17-a345-4df1-ba39-7c3bb40bee5e'::uuid, '8+CON'::text, '8+CON'::text, '["DEX","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('8e739a2d-134c-4336-8b42-55d9352fd804'::uuid, '8+CON'::text, '8+CON'::text, '["WIS","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('4676f2b8-d97a-46ae-aeaa-5d7d0650ada3'::uuid, '8+CON'::text, '8+CON'::text, '["WIS","INT"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('220e85c0-b45c-4b74-8599-334e00d23181'::uuid, '10+CON'::text, '10+CON'::text, '["STR","CON"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('8e0cb71d-c564-433c-ba2f-cc9a3c925a60'::uuid, '8+CON'::text, '8+CON'::text, '["STR","DEX"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('2437ee8f-c3b2-4507-812c-5dddff7b6b6a'::uuid, '10+CON'::text, '10+CON'::text, '["WIS","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('bf1b4a70-1faf-43da-906d-0ce8e121f858'::uuid, '10+CON'::text, '10+CON'::text, '["STR","DEX"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('9c302a8b-9cd3-4a6b-8425-343aeddcb678'::uuid, '8+CON'::text, '8+CON'::text, '["DEX","INT"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('e0b6076e-0553-4886-95fa-7d8e6a1f7cf6'::uuid, '6+CON'::text, '6+CON'::text, '["CON","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('962e03e3-358c-4473-9df8-35bbf709ac88'::uuid, '8+CON'::text, '8+CON'::text, '["WIS","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('871b87c8-4fac-4cfd-b4f3-9f3974a8c13f'::uuid, '6+CON'::text, '6+CON'::text, '["WIS","INT"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('963b3033-f39a-4ca4-b30a-8850e6a3e474'::uuid, 'Варвар'::text, 'Могучий воин ярости.'::text, 'BARBARIAN'::text, 'ec7255ce-fb8c-445b-8dc7-2ff553f614b3'::uuid, 'BARBARIAN'::varchar, 'BARBARIAN'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('b031d500-4f9e-4e06-9cb4-8578e2b0e064'::uuid, 'Бард'::text, 'Вдохновляет союзников словом и магией.'::text, 'BARD'::text, '13360e17-a345-4df1-ba39-7c3bb40bee5e'::uuid, 'BARD'::varchar, 'BARD'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('25aebb93-4bbd-468e-bba1-655ec17f4b64'::uuid, 'Жрец'::text, 'Проводник божественной силы.'::text, 'CLERIC'::text, '8e739a2d-134c-4336-8b42-55d9352fd804'::uuid, 'CLERIC'::varchar, 'CLERIC'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('df7e4221-7e8b-4522-8076-46cd5d7a5376'::uuid, 'Друид'::text, 'Хранитель природной магии.'::text, 'DRUID'::text, '4676f2b8-d97a-46ae-aeaa-5d7d0650ada3'::uuid, 'DRUID'::varchar, 'DRUID'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('f95afc05-1d1a-4e5b-bc9e-ce8567bc0899'::uuid, 'Воин'::text, 'Мастер оружия и тактики.'::text, 'FIGHTER'::text, '220e85c0-b45c-4b74-8599-334e00d23181'::uuid, 'FIGHTER'::varchar, 'FIGHTER'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('711062fb-603c-4865-a744-b90c1243a07b'::uuid, 'Монах'::text, 'Боец духовной и телесной дисциплины.'::text, 'MONK'::text, '8e0cb71d-c564-433c-ba2f-cc9a3c925a60'::uuid, 'MONK'::varchar, 'MONK'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('5751df1d-85f3-4e53-9fee-892a3dcc4637'::uuid, 'Паладин'::text, 'Воин клятвы и священной воли.'::text, 'PALADIN'::text, '2437ee8f-c3b2-4507-812c-5dddff7b6b6a'::uuid, 'PALADIN'::varchar, 'PALADIN'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('80bb723a-49f4-40db-baec-a9f1383cbac2'::uuid, 'Следопыт'::text, 'Охотник и проводник диких земель.'::text, 'RANGER'::text, 'bf1b4a70-1faf-43da-906d-0ce8e121f858'::uuid, 'RANGER'::varchar, 'RANGER'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('154bbc77-f848-4c52-aa98-cd491381b1c8'::uuid, 'Плут'::text, 'Мастер скрытности и ловкости.'::text, 'ROGUE'::text, '9c302a8b-9cd3-4a6b-8425-343aeddcb678'::uuid, 'ROGUE'::varchar, 'ROGUE'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('086a8bb5-71ae-44a5-904f-a681e18d5b15'::uuid, 'Чародей'::text, 'Носитель врождённой магии.'::text, 'SORCERER'::text, 'e0b6076e-0553-4886-95fa-7d8e6a1f7cf6'::uuid, 'SORCERER'::varchar, 'SORCERER'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('b7f7eadb-30c1-4348-b2fb-6723d82caddf'::uuid, 'Колдун'::text, 'Заключивший пакт с потусторонней силой.'::text, 'WARLOCK'::text, '962e03e3-358c-4473-9df8-35bbf709ac88'::uuid, 'WARLOCK'::varchar, 'WARLOCK'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('a1a675b8-08c9-467a-9fcf-de40ba226381'::uuid, 'Волшебник'::text, 'Арканист, полагающийся на знания.'::text, 'WIZARD'::text, '871b87c8-4fac-4cfd-b4f3-9f3974a8c13f'::uuid, 'WIZARD'::varchar, 'WIZARD'::varchar)
ON CONFLICT (id) DO NOTHING;

-- SRD subclasses (as separate classes)
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('917c0b7c-4067-4d94-b4be-1d93d2fddf7a'::uuid, '12+CON'::text, '12+CON'::text, '["STR","CON"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('249d7a79-dcdb-4136-bb77-bcda16d85529'::uuid, '8+CON'::text, '8+CON'::text, '["DEX","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('1fa498f8-9103-4616-96d0-322e81556754'::uuid, '8+CON'::text, '8+CON'::text, '["WIS","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('84c89635-f63d-422a-8f79-23abb603101a'::uuid, '8+CON'::text, '8+CON'::text, '["WIS","INT"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('1f351ef2-2ffc-4c94-87b8-502a726615a0'::uuid, '10+CON'::text, '10+CON'::text, '["STR","CON"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('7e5b37e8-3eb3-4ad2-aff3-3057704a1fcc'::uuid, '8+CON'::text, '8+CON'::text, '["STR","DEX"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('ff3c694d-3053-4c3e-a27a-9e6959e17d24'::uuid, '10+CON'::text, '10+CON'::text, '["WIS","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('f0b5c12b-75ec-4f37-829f-90fc89f16b80'::uuid, '10+CON'::text, '10+CON'::text, '["STR","DEX"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('4540dc96-4aeb-464f-83a4-52c89a9d6e9a'::uuid, '8+CON'::text, '8+CON'::text, '["DEX","INT"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('0d6f47b0-fb78-49fb-b827-e91ea598b908'::uuid, '6+CON'::text, '6+CON'::text, '["CON","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('f346f485-2b7b-4024-a47f-ee7bdedff04c'::uuid, '8+CON'::text, '8+CON'::text, '["WIS","CHA"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('51153b0f-9172-43ba-84f4-42785e4157bf'::uuid, '6+CON'::text, '6+CON'::text, '["WIS","INT"]'::jsonb, '[]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('129c85d5-ed88-4704-a264-4cd8aee9f955'::uuid, 'Варвар. Путь Берсерка'::text, 'Направьте ярость в неистовый гнев.'::text, 'BARBARIAN_PATH_OF_THE_BERSERKER_SRD'::text, '917c0b7c-4067-4d94-b4be-1d93d2fddf7a'::uuid, 'BARBARIAN_PATH_OF_THE_BERSERKER_SRD'::varchar, 'BARBARIAN'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('17125ea1-b2dc-4aa5-badc-280b9572b205'::uuid, 'Бард. Коллегия знаний'::text, 'Погрузитесь в глубины магических знаний.'::text, 'BARD_COLLEGE_OF_LORE_SRD'::text, '249d7a79-dcdb-4136-bb77-bcda16d85529'::uuid, 'BARD_COLLEGE_OF_LORE_SRD'::varchar, 'BARD'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('ed2bcc19-9ce2-465a-80fc-53d160e13e50'::uuid, 'Жрец. Домен жизни'::text, 'Успокойте раны мира и поддержите союзников.'::text, 'CLERIC_LIFE_DOMAIN_SRD'::text, '1fa498f8-9103-4616-96d0-322e81556754'::uuid, 'CLERIC_LIFE_DOMAIN_SRD'::varchar, 'CLERIC'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('e2b7dbd6-7092-4433-85c5-84798a4806a4'::uuid, 'Друид. Круг земли'::text, 'Празднуйте связь с природным миром.'::text, 'DRUID_CIRCLE_OF_THE_LAND_SRD'::text, '84c89635-f63d-422a-8f79-23abb603101a'::uuid, 'DRUID_CIRCLE_OF_THE_LAND_SRD'::varchar, 'DRUID'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('eee4851b-1731-4b16-8534-0198b2619eb6'::uuid, 'Воин. Чемпион'::text, 'Станьте непревзойдённым мастером оружия.'::text, 'FIGHTER_CHAMPION_SRD'::text, '1f351ef2-2ffc-4c94-87b8-502a726615a0'::uuid, 'FIGHTER_CHAMPION_SRD'::varchar, 'FIGHTER'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('9415ab41-7034-4b2f-9856-9d1d57fef0a0'::uuid, 'Монах. Воин открытой ладони'::text, 'Мастер техник безоружного боя.'::text, 'MONK_WARRIOR_OF_THE_OPEN_HAND_SRD'::text, '7e5b37e8-3eb3-4ad2-aff3-3057704a1fcc'::uuid, 'MONK_WARRIOR_OF_THE_OPEN_HAND_SRD'::varchar, 'MONK'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('46b5ef1a-b92a-4447-903b-5413832c25dd'::uuid, 'Паладин. Клятва преданности'::text, 'Поддерживайте идеалы справедливости и порядка.'::text, 'PALADIN_OATH_OF_DEVOTION_SRD'::text, 'ff3c694d-3053-4c3e-a27a-9e6959e17d24'::uuid, 'PALADIN_OATH_OF_DEVOTION_SRD'::varchar, 'PALADIN'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('abc37dd4-eaa9-43ba-9b03-b7584b5e1ba1'::uuid, 'Следопыт. Охотник'::text, 'Оберегайте людей и природу от разрушения.'::text, 'RANGER_HUNTER_SRD'::text, 'f0b5c12b-75ec-4f37-829f-90fc89f16b80'::uuid, 'RANGER_HUNTER_SRD'::varchar, 'RANGER'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('d730daa5-49d1-4e9c-858f-a52eb2b48f8e'::uuid, 'Плут. Вор'::text, 'Охотьтесь за сокровищами, как заправский приключенец.'::text, 'ROGUE_THIEF_SRD'::text, '4540dc96-4aeb-464f-83a4-52c89a9d6e9a'::uuid, 'ROGUE_THIEF_SRD'::varchar, 'ROGUE'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('a1d24329-8ba6-4591-9cb9-16495d6009ab'::uuid, 'Чародей. Драконье чародейство'::text, 'Дышите магией драконов.'::text, 'SORCERER_DRACONIC_SORCERY_SRD'::text, '0d6f47b0-fb78-49fb-b827-e91ea598b908'::uuid, 'SORCERER_DRACONIC_SORCERY_SRD'::varchar, 'SORCERER'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('9bf192fa-1a85-415a-aed2-29e9e60f51cf'::uuid, 'Колдун. Покровитель: Исчадие'::text, 'Заключите сделку с Нижними планами.'::text, 'WARLOCK_FIEND_PATRON_SRD'::text, 'f346f485-2b7b-4024-a47f-ee7bdedff04c'::uuid, 'WARLOCK_FIEND_PATRON_SRD'::varchar, 'WARLOCK'::varchar)
ON CONFLICT (id) DO NOTHING;
INSERT INTO rules.srd_2024_clazz (id, "name", description, code, clazz_stats_id, img_url, group_code)
VALUES ('687c0a44-d242-40bc-8ba7-fa29bfe8e951'::uuid, 'Волшебник. Воплотитель'::text, 'Творите взрывные эффекты стихий.'::text, 'WIZARD_EVOKER_SRD'::text, '51153b0f-9172-43ba-84f4-42785e4157bf'::uuid, 'WIZARD_EVOKER_SRD'::varchar, 'WIZARD'::varchar)
ON CONFLICT (id) DO NOTHING;