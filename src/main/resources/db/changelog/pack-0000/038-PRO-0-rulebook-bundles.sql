-- ============================================================================
-- Бандлы правил (расы / классы / предыстории) по образцу бандлов предметов.
-- Реестр бандлов + связь "комната ↔ включённый бандл" + перенос контента
-- из edition-таблиц в rules.race / rules.clazz / rules.background с bundle_id
-- (граф статов переиспользуется через *_stats_id — глубокое копирование не нужно).
-- ============================================================================

-- 1. Реестр бандлов
CREATE TABLE rules.rulebook_bundle
(
    id            uuid      NOT NULL,
    name          text      NOT NULL,
    edition_code  text      NOT NULL, -- '2014' | '2024' | 'SRD_2024' | 'ORASCA'
    category      text      NOT NULL, -- 'RACE' | 'CLAZZ' | 'BACKGROUND'
    description   text,
    img_url       text,
    is_public     bool      NOT NULL DEFAULT true,
    owner_user_id uuid,               -- null = системный бандл
    sort_order    int4      NOT NULL DEFAULT 0,
    created_at    timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.rulebook_bundle IS 'Наборы правил (издания) для рас/классов/предысторий';

-- 2. Включённые бандлы по комнатам
CREATE TABLE rules.room_rulebook_bundle
(
    room_id            uuid      NOT NULL,
    rulebook_bundle_id uuid      NOT NULL,
    created_at         timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (room_id, rulebook_bundle_id)
);
CREATE INDEX room_rulebook_bundle_room_idx ON rules.room_rulebook_bundle (room_id);
ALTER TABLE rules.room_rulebook_bundle
    ADD CONSTRAINT fk_room_rulebook_bundle FOREIGN KEY (rulebook_bundle_id) REFERENCES rules.rulebook_bundle (id);

-- 3. Привязка контента к бандлам + смягчение room_id (bundled-контент не room-scoped)
ALTER TABLE rules.race ADD COLUMN bundle_id uuid;
ALTER TABLE rules.race ALTER COLUMN room_id DROP NOT NULL;
CREATE INDEX race_bundle_id_idx ON rules.race (bundle_id);

ALTER TABLE rules.clazz ADD COLUMN bundle_id uuid;
ALTER TABLE rules.clazz ALTER COLUMN room_id DROP NOT NULL;
CREATE INDEX clazz_bundle_id_idx ON rules.clazz (bundle_id);

ALTER TABLE rules.background ADD COLUMN bundle_id uuid;
ALTER TABLE rules.background ALTER COLUMN roomid DROP NOT NULL;
CREATE INDEX background_bundle_id_idx ON rules.background (bundle_id);

-- 4. Системные бандлы (11 шт.). category кодируется 1-м блоком UUID:
--    b0000001=RACE, b0000002=CLAZZ, b0000003=BACKGROUND; издание — последним блоком.
INSERT INTO rules.rulebook_bundle (id, name, edition_code, category, is_public, owner_user_id, sort_order)
VALUES ('b0000001-0000-0000-0000-000000002014', 'Расы (2014)',            '2014',     'RACE',       true, NULL, 10),
       ('b0000002-0000-0000-0000-000000002014', 'Классы (2014)',          '2014',     'CLAZZ',      true, NULL, 11),
       ('b0000001-0000-0000-0000-000000002024', 'Расы (2024)',            '2024',     'RACE',       true, NULL, 20),
       ('b0000002-0000-0000-0000-000000002024', 'Классы (2024)',          '2024',     'CLAZZ',      true, NULL, 21),
       ('b0000003-0000-0000-0000-000000002024', 'Предыстории (2024)',     '2024',     'BACKGROUND', true, NULL, 22),
       ('b0000001-0000-0000-0000-000000000521', 'Расы (SRD 5.2.1)',       'SRD_2024', 'RACE',       true, NULL, 30),
       ('b0000002-0000-0000-0000-000000000521', 'Классы (SRD 5.2.1)',     'SRD_2024', 'CLAZZ',      true, NULL, 31),
       ('b0000003-0000-0000-0000-000000000521', 'Предыстории (SRD 5.2.1)','SRD_2024', 'BACKGROUND', true, NULL, 32),
       ('b0000001-0000-0000-0000-000000000999', 'Расы (Ораска)',          'ORASCA',   'RACE',       true, 'c85a5986-ed2f-4e09-993b-153d601c9ab3', 40),
       ('b0000002-0000-0000-0000-000000000999', 'Классы (Ораска)',        'ORASCA',   'CLAZZ',      true, 'c85a5986-ed2f-4e09-993b-153d601c9ab3', 41),
       ('b0000003-0000-0000-0000-000000000999', 'Предыстории (Ораска)',   'ORASCA',   'BACKGROUND', true, 'c85a5986-ed2f-4e09-993b-153d601c9ab3', 42);

-- 5. Перенос контента в rules.race / rules.clazz / rules.background (bundle_id проставлен, room_id = NULL,
--    race_stats_id / clazz_stats_id / background_stats_id переиспользуются как есть).

-- Расы
INSERT INTO rules.race (id, room_id, bundle_id, name, description, code, race_stats_id, img_url, species_code, hidden)
SELECT gen_random_uuid(), NULL, 'b0000001-0000-0000-0000-000000002014', name, description, code, race_stats_id, img_url, species_code, false
FROM rules.default_5e_race;

INSERT INTO rules.race (id, room_id, bundle_id, name, description, code, race_stats_id, img_url, species_code, hidden)
SELECT gen_random_uuid(), NULL, 'b0000001-0000-0000-0000-000000002024', name, description, code, race_stats_id, img_url, species_code, false
FROM rules.default_2024_race;

INSERT INTO rules.race (id, room_id, bundle_id, name, description, code, race_stats_id, img_url, species_code, hidden)
SELECT gen_random_uuid(), NULL, 'b0000001-0000-0000-0000-000000000521', name, description, code, race_stats_id, img_url, species_code, false
FROM rules.srd_2024_race;

-- Классы
INSERT INTO rules.clazz (id, room_id, bundle_id, name, description, code, clazz_stats_id, img_url, group_code, hidden)
SELECT gen_random_uuid(), NULL, 'b0000002-0000-0000-0000-000000002014', name, description, code, clazz_stats_id, img_url, group_code, false
FROM rules.default_5e_clazz;

INSERT INTO rules.clazz (id, room_id, bundle_id, name, description, code, clazz_stats_id, img_url, group_code, hidden)
SELECT gen_random_uuid(), NULL, 'b0000002-0000-0000-0000-000000002024', name, description, code, clazz_stats_id, img_url, group_code, false
FROM rules.default_2024_clazz;

INSERT INTO rules.clazz (id, room_id, bundle_id, name, description, code, clazz_stats_id, img_url, group_code, hidden)
SELECT gen_random_uuid(), NULL, 'b0000002-0000-0000-0000-000000000521', name, description, code, clazz_stats_id, img_url, group_code, false
FROM rules.srd_2024_clazz;

-- Предыстории (у 2014 нет таблицы предысторий — только 2024 и SRD)
INSERT INTO rules.background (id, roomid, bundle_id, name, description, code, img_url, background_stats_id, hidden)
SELECT gen_random_uuid(), NULL, 'b0000003-0000-0000-0000-000000002024', name, description, code, img_url, background_stats_id, false
FROM rules.default_2024_background;

INSERT INTO rules.background (id, roomid, bundle_id, name, description, code, img_url, background_stats_id, hidden)
SELECT gen_random_uuid(), NULL, 'b0000003-0000-0000-0000-000000000521', name, description, code, img_url, background_stats_id, false
FROM rules.srd_2024_background;

-- 6. Предвключение бандлов существующим комнатам по текущему rule_type (сохранить поведение).
--    DND5E → 2014 (расы+классы); DND2024 → 2024 (расы+классы+предыстории);
--    HOMEBREW → ничего (room-scoped контент остаётся доступен через room_id).
INSERT INTO rules.room_rulebook_bundle (room_id, rulebook_bundle_id)
SELECT r.room_id, b.id
FROM rules.room r
         CROSS JOIN (VALUES ('b0000001-0000-0000-0000-000000002014'::uuid),
                            ('b0000002-0000-0000-0000-000000002014'::uuid)) AS b(id)
WHERE r.rule_type = 'DND5E'
ON CONFLICT DO NOTHING;

INSERT INTO rules.room_rulebook_bundle (room_id, rulebook_bundle_id)
SELECT r.room_id, b.id
FROM rules.room r
         CROSS JOIN (VALUES ('b0000001-0000-0000-0000-000000002024'::uuid),
                            ('b0000002-0000-0000-0000-000000002024'::uuid),
                            ('b0000003-0000-0000-0000-000000002024'::uuid)) AS b(id)
WHERE r.rule_type = 'DND2024'
ON CONFLICT DO NOTHING;
