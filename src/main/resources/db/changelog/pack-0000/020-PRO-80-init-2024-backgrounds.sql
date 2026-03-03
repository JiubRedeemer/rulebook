-- DND2024: предыстории (backgrounds) по умолчанию, Player's Handbook 2024
-- Источник: https://next.dnd.su/backgrounds/

CREATE TABLE rules.default_2024_background
(
    id          uuid NOT NULL,
    name        text NOT NULL,
    description text NULL,
    code        text NOT NULL,
    img_url     varchar NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE rules.default_2024_background IS 'Предыстории по умолчанию для D&D 2024 (PHB)';

INSERT INTO rules.default_2024_background (id, name, description, code)
VALUES ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c101'::uuid, 'Артист'::text, 'Данные требуют уточнения.'::text, 'ENTERTAINER'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c102'::uuid, 'Бродяга'::text, 'Данные требуют уточнения.'::text, 'WAYFARER'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c103'::uuid, 'Дворянин'::text, 'Данные требуют уточнения.'::text, 'NOBLE'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c104'::uuid, 'Моряк'::text, 'Данные требуют уточнения.'::text, 'SAILOR'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c105'::uuid, 'Мудрец'::text, 'Данные требуют уточнения.'::text, 'SAGE'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c106'::uuid, 'Отшельник'::text, 'Данные требуют уточнения.'::text, 'HERMIT'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c107'::uuid, 'Писарь'::text, 'Данные требуют уточнения.'::text, 'SCRIBE'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c108'::uuid, 'Послушник'::text, 'Данные требуют уточнения.'::text, 'ACOLYTE'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c109'::uuid, 'Преступник'::text, 'Данные требуют уточнения.'::text, 'CRIMINAL'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c10a'::uuid, 'Проводник'::text, 'Данные требуют уточнения.'::text, 'GUIDE'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c10b'::uuid, 'Ремесленник'::text, 'Данные требуют уточнения.'::text, 'ARTISAN'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c10c'::uuid, 'Солдат'::text, 'Данные требуют уточнения.'::text, 'SOLDIER'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c10d'::uuid, 'Стражник'::text, 'Данные требуют уточнения.'::text, 'GUARD'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c10e'::uuid, 'Торговец'::text, 'Данные требуют уточнения.'::text, 'MERCHANT'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c10f'::uuid, 'Фермер'::text, 'Данные требуют уточнения.'::text, 'FARMER'::text),
       ('b801e4a1-4c9f-4b9f-a074-8ad6f2f8c110'::uuid, 'Шарлатан'::text, 'Данные требуют уточнения.'::text, 'CHARLATAN'::text);
