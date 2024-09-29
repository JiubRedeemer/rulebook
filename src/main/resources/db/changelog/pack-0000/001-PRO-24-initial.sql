CREATE TABLE rules.rooms
(
    room_id   uuid NOT NULL,
    owner_id  uuid NOT NULL,
    rule_type text NOT NULL,
    PRIMARY KEY (room_id)
);
COMMENT ON TABLE rules.rooms IS 'Реплика информации о комнате из core микросервиса';
COMMENT ON COLUMN rules.rooms.owner_id IS 'Id владельца комнаты';
COMMENT ON COLUMN rules.rooms.rule_type IS 'Тип правил, например: 4e, 5e, homebrew';
CREATE TABLE rules.abilities
(
    id      uuid NOT NULL,
    room_id uuid NOT NULL,
    name    text NOT NULL,
    code    text NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.abilities IS 'Кастомные характеристики существ (для homebrew игр)';
COMMENT ON COLUMN rules.abilities.name IS 'Название характеристики';
COMMENT ON COLUMN rules.abilities.code IS 'Краткий код характеристики';
CREATE TABLE rules.skills
(
    id                   uuid NOT NULL,
    name                 text NOT NULL,
    code                 text NOT NULL,
    depend_on_ability_id uuid NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.skills IS 'Кастомные навыки существ (для homebrew игр)';
COMMENT ON COLUMN rules.skills.name IS 'Название навыка';
COMMENT ON COLUMN rules.skills.code IS 'Краткий код навыка';
COMMENT ON COLUMN rules.skills.depend_on_ability_id IS 'Зависимость навыка от характеристики';
CREATE TABLE rules.default_5e_abilities
(
    id   uuid NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.default_5e_abilities IS 'Характеристики существ по дефолтным правилам ДнД 5е';
COMMENT ON COLUMN rules.default_5e_abilities.name IS 'Название Характеристики';
COMMENT ON COLUMN rules.default_5e_abilities.code IS 'Краткий код Характеристики';
CREATE TABLE rules.default_5e_skills
(
    id                uuid NOT NULL,
    name              text NOT NULL,
    code              text NOT NULL,
    depend_on_ability uuid NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.default_5e_skills IS 'Навыки по дефолтным правилам DnD 5e';
COMMENT ON COLUMN rules.default_5e_skills.name IS 'Название навыка';
COMMENT ON COLUMN rules.default_5e_skills.code IS 'Краткий код навыка';
COMMENT ON COLUMN rules.default_5e_skills.depend_on_ability IS 'Зависимость навыка от характеристики';
CREATE TABLE rules.races
(
    id            uuid NOT NULL,
    room_id       uuid NOT NULL,
    name          text NOT NULL,
    description   text NULL,
    code          text NOT NULL,
    race_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.default_5e_races
(
    id            uuid NOT NULL,
    name          text NOT NULL,
    description   text NULL,
    code          text NOT NULL,
    race_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.classes
(
    id             uuid NOT NULL,
    room_id        uuid NOT NULL,
    name           text NOT NULL,
    description    text NULL,
    code           text NOT NULL,
    class_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.default_5e_classes
(
    id             uuid NOT NULL,
    name           text NOT NULL,
    description    text NULL,
    code           text NOT NULL,
    class_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.race_stats
(
    id                uuid  NOT NULL,
    max_age           int4  NOT NULL,
    max_height        int4  NOT NULL,
    max_weight        int4  NOT NULL,
    base_speed        int4  NOT NULL,
    ability_modifiers jsonb NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.race_traits
(
    id            uuid NOT NULL,
    race_stats_id uuid NOT NULL,
    name          text NOT NULL,
    code          text NOT NULL,
    description   text NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.class_stats
(
    id                      uuid  NOT NULL,
    hp_dice                 text  NOT NULL,
    start_hp                text  NOT NULL,
    saving_throws_abilities jsonb NOT NULL,
    available_skills        jsonb NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON COLUMN rules.class_stats.saving_throws_abilities IS '["WIS", "INT"]';
COMMENT ON COLUMN rules.class_stats.available_skills IS 'Навыки, которыми может владеть класс: {"count" : 2, "list" : "WIS", "INT"}';
CREATE TABLE rules.race_proficiencies
(
    id            uuid NOT NULL,
    race_stats_id uuid NOT NULL,
    type          text NOT NULL,
    code          text NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX abilities_room_id
    ON rules.abilities (room_id);
CREATE INDEX skills_depend_on_ability_id
    ON rules.skills (depend_on_ability_id);
CREATE INDEX default_5e_skills_depend_on_ability
    ON rules.default_5e_skills (depend_on_ability);
CREATE INDEX races_room_id
    ON rules.races (room_id);
CREATE INDEX classes_room_id
    ON rules.classes (room_id);
CREATE INDEX race_traits_race_stats_id
    ON rules.race_traits (race_stats_id);
CREATE INDEX race_proficiencies_race_stats_id
    ON rules.race_proficiencies (race_stats_id);
ALTER TABLE rules.skills
    ADD CONSTRAINT FKskills69995 FOREIGN KEY (depend_on_ability_id) REFERENCES rules.abilities (id);
ALTER TABLE rules.abilities
    ADD CONSTRAINT FKabilities898405 FOREIGN KEY (room_id) REFERENCES rules.rooms (room_id);
ALTER TABLE rules.default_5e_skills
    ADD CONSTRAINT FKdefault_5e869303 FOREIGN KEY (depend_on_ability) REFERENCES rules.default_5e_abilities (id);
ALTER TABLE rules.races
    ADD CONSTRAINT FKraces214766 FOREIGN KEY (room_id) REFERENCES rules.rooms (room_id);
ALTER TABLE rules.classes
    ADD CONSTRAINT FKclasses862752 FOREIGN KEY (room_id) REFERENCES rules.rooms (room_id);
ALTER TABLE rules.default_5e_races
    ADD CONSTRAINT FKdefault_5e40267 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
ALTER TABLE rules.races
    ADD CONSTRAINT FKraces292535 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
ALTER TABLE rules.race_traits
    ADD CONSTRAINT FKrace_trait331219 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
ALTER TABLE rules.classes
    ADD CONSTRAINT FKclasses375368 FOREIGN KEY (class_stats_id) REFERENCES rules.class_stats (id);
ALTER TABLE rules.default_5e_classes
    ADD CONSTRAINT FKdefault_5e174476 FOREIGN KEY (class_stats_id) REFERENCES rules.class_stats (id);
ALTER TABLE rules.race_proficiencies
    ADD CONSTRAINT FKrace_profi169598 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
