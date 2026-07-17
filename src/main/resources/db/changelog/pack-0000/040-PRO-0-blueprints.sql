-- Чертежи магических предметов (артефактор).
-- blueprint       — предсозданный контент (каталог);
-- users_blueprint — контент, созданный пользователями в комнате.
-- item_id ссылается на itemstorage.item_bundled.id (издание 2024 + Эберрон). Кросс-сервисного FK нет.
-- customization: YES | NO | VARIABLE (вариативно).

CREATE TABLE rules.blueprint
(
    id             uuid    NOT NULL,
    code           text    NOT NULL,
    name           text    NOT NULL,
    description    text,
    group_code     text    NOT NULL,
    required_level integer NOT NULL,
    customization  text    NOT NULL DEFAULT 'NO',
    item_id        uuid,
    img_url        text,
    bundle_id      uuid,
    hidden         boolean NOT NULL DEFAULT false,
    PRIMARY KEY (id)
);
CREATE UNIQUE INDEX blueprint_code_uidx ON rules.blueprint (code);
CREATE INDEX blueprint_group_code_idx ON rules.blueprint (group_code);
CREATE INDEX blueprint_bundle_idx ON rules.blueprint (bundle_id);

CREATE TABLE rules.users_blueprint
(
    id             uuid    NOT NULL,
    room_id        uuid    NOT NULL,
    creator_id     uuid,
    code           text    NOT NULL,
    name           text    NOT NULL,
    description    text,
    group_code     text    NOT NULL,
    required_level integer NOT NULL,
    customization  text    NOT NULL DEFAULT 'NO',
    item_id        uuid,
    img_url        text,
    hidden         boolean NOT NULL DEFAULT false,
    created_at     timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (id)
);
CREATE INDEX users_blueprint_room_idx ON rules.users_blueprint (room_id);
CREATE INDEX users_blueprint_group_code_idx ON rules.users_blueprint (group_code);

-- Бандл чертежей
INSERT INTO rules.rulebook_bundle (id, name, edition_code, category, description, is_public, sort_order)
VALUES ('b0000004-0000-0000-0000-000000002024', '2024.Чертежи', '2024', 'BLUEPRINT',
        'Чертежи магических предметов артефактора', true, 23);

-- ── Уровень 1: Магическая безделушка (обычные предметы) ───────────────────
INSERT INTO rules.blueprint (id, code, name, group_code, required_level, customization, item_id, bundle_id) VALUES
 (gen_random_uuid(), 'BALL_BEARINGS',  'Мелкие шарики',  'ARTIFICER', 1, 'NO', '6848f126-a96a-4973-8cbb-164a1cab185e', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'NET',            'Сеть',           'ARTIFICER', 1, 'NO', '3f21e1c5-5879-4692-9549-3d85c0d183b9', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BASKET',         'Корзина',        'ARTIFICER', 1, 'NO', '7c2635b2-20f9-4f8d-ab1f-d2505a7ba444', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'OIL',            'Масло',          'ARTIFICER', 1, 'NO', '0d686cab-d42e-40bc-9292-86eb849747b6', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BEDROLL',        'Спальник',       'ARTIFICER', 1, 'NO', 'ce3de889-f5ba-4adf-8a00-37dbd5bcb3f9', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'PAPER',          'Бумага',         'ARTIFICER', 1, 'NO', 'efc326a0-3028-473a-8d0e-d78c0e555b78', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BELL',           'Колокольчик',    'ARTIFICER', 1, 'NO', '722c5e09-dbab-42ad-8761-3d415ec8d64b', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'PARCHMENT',      'Пергамент',      'ARTIFICER', 1, 'NO', 'b4088f7c-4d1a-4fc8-8a82-809ba16c0a89', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BLANKET',        'Одеяло',         'ARTIFICER', 1, 'NO', '6711e5fc-42c3-4f6d-98c3-b36e8e5b5cd7', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'POLE',           'Шест',           'ARTIFICER', 1, 'NO', 'fb8b4bdd-61d3-41a7-b7d0-303f94a9354c', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BLOCK_AND_TACKLE','Блок и лебёдка','ARTIFICER', 1, 'NO', '0b7e29c0-af94-435e-b287-bdd4227237b9', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'POUCH',          'Сумка',          'ARTIFICER', 1, 'NO', 'e6a4e2b9-a498-4ad2-832d-6006322a4aa0', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BUCKET',         'Ведро',          'ARTIFICER', 1, 'NO', '4b9b26ce-c13d-4e07-86d6-0ea7bbd85977', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'ROPE',           'Верёвка',        'ARTIFICER', 1, 'NO', 'a1437425-36ef-4ad2-b60b-4b4d79616ab6', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'CALTROPS',       'Калтропы',       'ARTIFICER', 1, 'NO', '893a95f3-db26-4d9c-b2f8-b3faaabdb164', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'SACK',           'Мешок',          'ARTIFICER', 1, 'NO', '73727f1b-9e55-478d-a2dc-49dc69d8ed40', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'CANDLE',         'Свеча',          'ARTIFICER', 1, 'NO', '53afc1de-6d3f-4ffb-9260-823e27e0dbaa', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'SHOVEL',         'Лопата',         'ARTIFICER', 1, 'NO', '1a4e2b67-aa00-49c6-9e4e-2e28fdc47e71', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'CROWBAR',        'Лом',            'ARTIFICER', 1, 'NO', '46780cba-909e-489e-bda3-2dd0c69c4b0d', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'STRING',         'Бечёвка',        'ARTIFICER', 1, 'NO', '2de6719e-3311-4fcb-a14c-a9c5724c5f46', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'FLASK',          'Фляга',          'ARTIFICER', 1, 'NO', 'af74f491-7f92-42d4-b9a5-f33216ea96bc', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'TINDERBOX',      'Трутница',       'ARTIFICER', 1, 'NO', '8b110375-830b-481c-9ab1-1c234ed5654e', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'JUG',            'Кувшин',         'ARTIFICER', 1, 'NO', '85292796-111d-4a74-920c-ae3f9a327a25', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'TORCH',          'Факел',          'ARTIFICER', 1, 'NO', '260170f8-e5da-4dbb-acda-7445286e7498', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'LAMP',           'Лампа',          'ARTIFICER', 1, 'NO', '4b75fcd5-84fc-4e3d-9308-ba971a1ef2b4', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'VIAL',           'Флакон',         'ARTIFICER', 1, 'NO', 'b2157b2e-8b94-44d4-ab73-3ccbc2de56f1', 'b0000004-0000-0000-0000-000000002024');

-- ── Уровень 2 ─────────────────────────────────────────────────────────────
INSERT INTO rules.blueprint (id, code, name, group_code, required_level, customization, item_id, bundle_id) VALUES
 (gen_random_uuid(), 'ALCHEMY_JUG',            'Алхимический сосуд',                 'ARTIFICER', 2, 'NO',       '9db4854f-0379-4e8c-bf98-67bb46191ed3', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BAG_OF_HOLDING',         'Сумка хранения',                     'ARTIFICER', 2, 'NO',       '01c7dc09-20cd-4d67-b0bc-4b529b9556a3', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'CAP_OF_WATER_BREATHING', 'Шапка подводного дыхания',           'ARTIFICER', 2, 'NO',       '1fb85060-6af7-46a1-84eb-b03de9ce03c4', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'COMMON_MAGIC_ITEM',      'Обычный магический предмет',         'ARTIFICER', 2, 'VARIABLE', NULL,                                   'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'GOGGLES_OF_NIGHT',       'Ночные очки',                        'ARTIFICER', 2, 'NO',       'c6d9a0bf-fc65-4b95-82c2-2372317b191c', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'MANIFOLD_TOOL',          'Мультиинструмент',                   'ARTIFICER', 2, 'YES',      'ea49a842-aea9-48cb-aaaa-3099088294a6', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'REPEATING_SHOT',         'Повторяющийся выстрел',              'ARTIFICER', 2, 'YES',      '46ae53d4-d7e9-4bbe-8c68-6660e846df57', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RETURNING_WEAPON',       'Возвращающееся оружие',              'ARTIFICER', 2, 'NO',       '7428fee3-01a0-427d-9da2-9acfd41c5e9f', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'ROPE_OF_CLIMBING',       'Верёвка лазания',                    'ARTIFICER', 2, 'NO',       'eb4d245e-406c-4b14-859d-8c77f43838d2', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'SENDING_STONES',         'Камни послания',                     'ARTIFICER', 2, 'NO',       'ec386b63-22b0-4596-98fb-7025d8796519', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'SHIELD_PLUS_1',          'Щит +1',                             'ARTIFICER', 2, 'NO',       '31b8f24a-eb19-4cc7-bd60-e0d11160c194', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WAND_OF_MAGIC_DETECTION','Волшебная палочка обнаружения магии','ARTIFICER', 2, 'NO',       'c48b0a88-fc82-4d73-8be5-6722affe542a', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WAND_OF_SECRETS',        'Волшебная палочка секретов',         'ARTIFICER', 2, 'NO',       '901a2007-a795-4db0-bb04-c8814218a618', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WAND_OF_WAR_MAGE_PLUS_1','Волшебная палочка боевого мага +1',  'ARTIFICER', 2, 'YES',      'f02d590d-0a16-43c9-ae01-618af6dfbbb0', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WEAPON_PLUS_1',          'Оружие +1',                          'ARTIFICER', 2, 'NO',       '964ff3aa-a47f-43ff-abfa-ec9dae4b8533', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WRAPS_OF_UNARMED_POWER', 'Обмотки безоружной мощи',            'ARTIFICER', 2, 'NO',       '90959cd8-9344-42fb-ac17-5259ab9a3523', 'b0000004-0000-0000-0000-000000002024');

-- ── Уровень 6 ─────────────────────────────────────────────────────────────
INSERT INTO rules.blueprint (id, code, name, group_code, required_level, customization, item_id, bundle_id) VALUES
 (gen_random_uuid(), 'ARMOR_PLUS_1',            'Доспех +1',                       'ARTIFICER', 6, 'NO',  'be8db62a-45cd-4483-87f9-29ef64b9feeb', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BOOTS_OF_ELVENKIND',      'Эльфийские сапоги',               'ARTIFICER', 6, 'NO',  '721499a6-2be7-4b50-b7b0-7dff3cd0bc55', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'BOOTS_OF_WINDING_PATH',   'Сапоги извилистого пути',         'ARTIFICER', 6, 'YES', '07095134-c6af-4739-acba-5400550c1119', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'CLOAK_OF_ELVENKIND',      'Эльфийский плащ',                 'ARTIFICER', 6, 'YES', '79f09093-dad9-43ac-b055-f702ced7b916', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'CLOAK_OF_THE_MANTA_RAY',  'Плащ ската',                      'ARTIFICER', 6, 'NO',  'ae9a393b-382c-4ea0-a71e-c0b6038e2a06', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'EYES_OF_CHARMING',        'Очки очарования',                 'ARTIFICER', 6, 'YES', '31e13e2f-16b0-452e-9b5f-1e9a04a8ccf8', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'EYES_OF_MINUTE_SEEING',   'Очки детального зрения',          'ARTIFICER', 6, 'NO',  'cdbe9646-b2d2-4fe1-86a6-1b485dbc4438', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'GLOVES_OF_THIEVERY',      'Перчатки воровства',              'ARTIFICER', 6, 'NO',  '06ebe9f1-2bec-46cc-a054-cad6705b5181', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'LANTERN_OF_REVEALING',    'Фонарь обнаружения',              'ARTIFICER', 6, 'NO',  'eb31e057-3620-4305-9429-8cc026e75562', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'MIND_SHARPENER',          'Усилитель разума',                'ARTIFICER', 6, 'YES', '3b8932ca-1e48-4926-a1f3-c2198b1cc6fc', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'NECKLACE_OF_ADAPTATION',  'Ожерелье адаптации',              'ARTIFICER', 6, 'YES', 'f380f043-fa81-411d-b5dc-7e7da4883f43', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'PIPES_OF_HAUNTING',       'Свирель ужаса',                   'ARTIFICER', 6, 'NO',  '08d49fe3-e65b-44d1-8e37-217dd6516ce1', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'DAZZLING_WEAPON',         'Ослепляющее оружие',              'ARTIFICER', 6, 'YES', '783d4082-b822-44ee-9741-d788a44318f8', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'REPULSION_SHIELD',        'Отталкивающий щит',               'ARTIFICER', 6, 'NO',  '564f3203-6852-4904-be8b-5115b9abebb0', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_SWIMMING',        'Кольцо плавания',                 'ARTIFICER', 6, 'NO',  'd82053a8-536e-47d1-83be-0ac32198f10c', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_WATER_WALKING',   'Кольцо хождения по воде',         'ARTIFICER', 6, 'NO',  '9f8a4a61-12cc-49dc-b2cb-f6ccae7ade69', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'SENTINEL_SHIELD',         'Щит часового',                    'ARTIFICER', 6, 'NO',  '322e02aa-5652-4e9a-bc4a-b97ad4b52175', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'SPELL_REFUELING_RING',    'Кольцо восстановления заклинаний','ARTIFICER', 6, 'YES', 'b3fdd469-f9a6-4478-a21c-91f0e48052af', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WAND_OF_MAGIC_MISSILES',  'Волшебная палочка снарядов',      'ARTIFICER', 6, 'NO',  'd0a4db4f-de30-42fe-8534-62f410adfcba', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WAND_OF_WEB',             'Волшебная палочка паутины',       'ARTIFICER', 6, 'YES', '07982e13-0ea2-42af-9ef0-8e351f69fc90', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WEAPON_OF_WARNING',       'Оружие предупреждения',           'ARTIFICER', 6, 'YES', 'd1d67fab-7ac3-4124-9492-e35ab37fb0e4', 'b0000004-0000-0000-0000-000000002024');

-- ── Уровень 10 ────────────────────────────────────────────────────────────
INSERT INTO rules.blueprint (id, code, name, group_code, required_level, customization, item_id, bundle_id) VALUES
 (gen_random_uuid(), 'ARMOR_OF_RESISTANCE',      'Доспех сопротивления',              'ARTIFICER', 10, 'YES',      '22727efb-9538-4b28-b99d-0be580f1079f', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'DAGGER_OF_VENOM',          'Кинжал яда',                        'ARTIFICER', 10, 'NO',       '413951f7-a7b8-41f1-8960-003009ea2bfc', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'ELVEN_CHAIN',              'Эльфийская кольчуга',               'ARTIFICER', 10, 'NO',       '0480a7a3-4183-4e1b-a7a8-cbb9bea69f09', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_FEATHER_FALLING',  'Кольцо падения пёрышком',           'ARTIFICER', 10, 'YES',      '3d63caf6-e695-4a67-9f70-bf93e0d12ae7', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_JUMPING',          'Кольцо прыжков',                    'ARTIFICER', 10, 'YES',      'aad47539-e56e-480c-bce6-e85ef392da7b', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_MIND_SHIELDING',   'Кольцо защиты разума',              'ARTIFICER', 10, 'YES',      'dfaf8e84-49f9-4bd4-a9e4-1afd96cce5cb', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'SHIELD_PLUS_2',            'Щит +2',                            'ARTIFICER', 10, 'NO',       '31b8f24a-eb19-4cc7-bd60-e0d11160c194', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'UNCOMMON_WONDROUS_ITEM',   'Необычный чудесный предмет',        'ARTIFICER', 10, 'VARIABLE', NULL,                                   'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WAND_OF_WAR_MAGE_PLUS_2',  'Волшебная палочка боевого мага +2', 'ARTIFICER', 10, 'YES',      'f02d590d-0a16-43c9-ae01-618af6dfbbb0', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WEAPON_PLUS_2',            'Оружие +2',                         'ARTIFICER', 10, 'NO',       '964ff3aa-a47f-43ff-abfa-ec9dae4b8533', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'WRAPS_OF_UNARMED_POWER_2', 'Обмотки безоружной мощи +2',        'ARTIFICER', 10, 'NO',       '90959cd8-9344-42fb-ac17-5259ab9a3523', 'b0000004-0000-0000-0000-000000002024');

-- ── Уровень 14 ────────────────────────────────────────────────────────────
INSERT INTO rules.blueprint (id, code, name, group_code, required_level, customization, item_id, bundle_id) VALUES
 (gen_random_uuid(), 'ARMOR_PLUS_2',           'Доспех +2',                  'ARTIFICER', 14, 'NO',       'be8db62a-45cd-4483-87f9-29ef64b9feeb', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'ARROW_CATCHING_SHIELD',  'Ловящий стрелы щит',         'ARTIFICER', 14, 'YES',      'bdd695f5-5b6d-47ec-a4b9-1cd4771a3e2a', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'FLAME_TONGUE',           'Язык пламени',               'ARTIFICER', 14, 'YES',      '30f1afa4-1e20-4192-aacf-83e5eabbf468', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RARE_WONDROUS_ITEM',     'Редкий чудесный предмет',    'ARTIFICER', 14, 'VARIABLE', NULL,                                   'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_FREE_ACTION',    'Кольцо свободных действий',  'ARTIFICER', 14, 'YES',      '769794ee-2b02-4850-8115-9b91a1ae37a8', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_PROTECTION',     'Кольцо защиты',              'ARTIFICER', 14, 'YES',      'dc8c01b9-f683-468b-91a1-79713ae067a1', 'b0000004-0000-0000-0000-000000002024'),
 (gen_random_uuid(), 'RING_OF_THE_RAM',        'Кольцо тарана',              'ARTIFICER', 14, 'YES',      '482d5336-83db-447d-905a-60d1fae90352', 'b0000004-0000-0000-0000-000000002024');
