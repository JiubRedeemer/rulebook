CREATE TABLE rules.room
(
    room_id   uuid NOT NULL,
    owner_id  uuid NOT NULL,
    rule_type text NOT NULL,
    PRIMARY KEY (room_id)
);
COMMENT ON TABLE rules.room IS 'Реплика информации о комнате из core микросервиса';
COMMENT ON COLUMN rules.room.owner_id IS 'Id владельца комнаты';
COMMENT ON COLUMN rules.room.rule_type IS 'Тип правил, например: 4e, 5e, homebrew';
CREATE TABLE rules.ability
(
    id      uuid NOT NULL,
    room_id uuid NOT NULL,
    name    text NOT NULL,
    code    text NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.ability IS 'Кастомные характеристики существ (для homebrew игр)';
COMMENT ON COLUMN rules.ability.name IS 'Название характеристики';
COMMENT ON COLUMN rules.ability.code IS 'Краткий код характеристики';
CREATE TABLE rules.skill
(
    id                   uuid NOT NULL,
    name                 text NOT NULL,
    code                 text NOT NULL,
    depend_on_ability_id uuid NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.skill IS 'Кастомные навыки существ (для homebrew игр)';
COMMENT ON COLUMN rules.skill.name IS 'Название навыка';
COMMENT ON COLUMN rules.skill.code IS 'Краткий код навыка';
COMMENT ON COLUMN rules.skill.depend_on_ability_id IS 'Зависимость навыка от характеристики';
CREATE TABLE rules.default_5e_ability
(
    id   uuid NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.default_5e_ability IS 'Характеристики существ по дефолтным правилам ДнД 5е';
COMMENT ON COLUMN rules.default_5e_ability.name IS 'Название Характеристики';
COMMENT ON COLUMN rules.default_5e_ability.code IS 'Краткий код Характеристики';
CREATE TABLE rules.default_5e_skill
(
    id                uuid NOT NULL,
    name              text NOT NULL,
    code              text NOT NULL,
    depend_on_ability uuid NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE rules.default_5e_skill IS 'Навыки по дефолтным правилам DnD 5e';
COMMENT ON COLUMN rules.default_5e_skill.name IS 'Название навыка';
COMMENT ON COLUMN rules.default_5e_skill.code IS 'Краткий код навыка';
COMMENT ON COLUMN rules.default_5e_skill.depend_on_ability IS 'Зависимость навыка от характеристики';
CREATE TABLE rules.race
(
    id            uuid NOT NULL,
    room_id       uuid NOT NULL,
    name          text NOT NULL,
    description   text NULL,
    code          text NOT NULL,
    race_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.default_5e_race
(
    id            uuid NOT NULL,
    name          text NOT NULL,
    description   text NULL,
    code          text NOT NULL,
    race_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.clazz
(
    id             uuid NOT NULL,
    room_id        uuid NOT NULL,
    name           text NOT NULL,
    description    text NULL,
    code           text NOT NULL,
    clazz_stats_id uuid NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.default_5e_clazz
(
    id             uuid NOT NULL,
    name           text NOT NULL,
    description    text NULL,
    code           text NOT NULL,
    clazz_stats_id uuid NOT NULL,
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
CREATE TABLE rules.race_trait
(
    id            uuid NOT NULL,
    race_stats_id uuid NOT NULL,
    name          text NOT NULL,
    code          text NOT NULL,
    description   text NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE rules.clazz_stats
(
    id                      uuid  NOT NULL,
    hp_dice                 text  NOT NULL,
    start_hp                text  NOT NULL,
    saving_throws_ability jsonb NOT NULL,
    available_skills        jsonb NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON COLUMN rules.clazz_stats.saving_throws_ability IS '["WIS", "INT"]';
COMMENT ON COLUMN rules.clazz_stats.available_skills IS 'Навыки, которыми может владеть класс: {"count" : 2, "list" : "WIS", "INT"}';
CREATE TABLE rules.race_proficiency
(
    id            uuid NOT NULL,
    race_stats_id uuid NOT NULL,
    type          text NOT NULL,
    code          text NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX ability_room_id
    ON rules.ability (room_id);
CREATE INDEX skill_depend_on_ability_id
    ON rules.skill (depend_on_ability_id);
CREATE INDEX default_5e_skill_depend_on_ability
    ON rules.default_5e_skill (depend_on_ability);
CREATE INDEX race_room_id
    ON rules.race (room_id);
CREATE INDEX clazz_room_id
    ON rules.clazz (room_id);
CREATE INDEX race_trait_race_stats_id
    ON rules.race_trait (race_stats_id);
CREATE INDEX race_proficiency_race_stats_id
    ON rules.race_proficiency (race_stats_id);
ALTER TABLE rules.skill
    ADD CONSTRAINT FKskill69995 FOREIGN KEY (depend_on_ability_id) REFERENCES rules.ability (id);
ALTER TABLE rules.ability
    ADD CONSTRAINT FKability898405 FOREIGN KEY (room_id) REFERENCES rules.room (room_id);
ALTER TABLE rules.default_5e_skill
    ADD CONSTRAINT FKdefault_5e869303 FOREIGN KEY (depend_on_ability) REFERENCES rules.default_5e_ability (id);
ALTER TABLE rules.race
    ADD CONSTRAINT FKrace214766 FOREIGN KEY (room_id) REFERENCES rules.room (room_id);
ALTER TABLE rules.clazz
    ADD CONSTRAINT FKclazz862752 FOREIGN KEY (room_id) REFERENCES rules.room (room_id);
ALTER TABLE rules.default_5e_race
    ADD CONSTRAINT FKdefault_5e40267 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
ALTER TABLE rules.race
    ADD CONSTRAINT FKrace292535 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
ALTER TABLE rules.race_trait
    ADD CONSTRAINT FKrace_trait331219 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
ALTER TABLE rules.clazz
    ADD CONSTRAINT FKclazz375368 FOREIGN KEY (clazz_stats_id) REFERENCES rules.clazz_stats (id);
ALTER TABLE rules.default_5e_clazz
    ADD CONSTRAINT FKdefault_5e174476 FOREIGN KEY (clazz_stats_id) REFERENCES rules.clazz_stats (id);
ALTER TABLE rules.race_proficiency
    ADD CONSTRAINT FKrace_profi169598 FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats (id);
