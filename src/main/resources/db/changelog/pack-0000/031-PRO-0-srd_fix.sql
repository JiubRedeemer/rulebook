UPDATE rules.default_5e_skill SET name = 'Анализ' where name = 'Расследование';
UPDATE rules.default_5e_skill SET name = 'Внимательность' where name = 'Восприятие';

CREATE TABLE rules.srd_2024_race (
                                         id uuid NOT NULL,
                                         "name" text NOT NULL,
                                         description text NULL,
                                         code text NOT NULL,
                                         race_stats_id uuid NOT NULL,
                                         img_url varchar NULL,
                                         species_code varchar NULL,
                                         CONSTRAINT srd_2024_race_pkey PRIMARY KEY (id)
);


-- rules.srd_2024_race внешние включи
ALTER TABLE rules.srd_2024_race ADD CONSTRAINT fkdefault_2024_race_stats FOREIGN KEY (race_stats_id) REFERENCES rules.race_stats(id);

