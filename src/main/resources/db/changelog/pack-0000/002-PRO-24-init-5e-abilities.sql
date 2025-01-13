INSERT INTO rules.default_5e_ability (id, name, code)
VALUES ('a7e6a7dc-fb39-49c8-bef3-0f719896d5c9'::uuid, 'Сила'::text, 'STR'::text);

INSERT INTO rules.default_5e_ability (id, name, code)
VALUES ('ac8b6ed6-1847-4a15-92ce-115987574c4c'::uuid, 'Ловкость'::text, 'DEX'::text);

INSERT INTO rules.default_5e_ability (id, name, code)
VALUES ('a519a3f4-9bba-463a-9588-4b081baded78'::uuid, 'Телосложение'::text, 'CON'::text);

INSERT INTO rules.default_5e_ability (id, name, code)
VALUES ('ca14d750-d28a-4bd7-9383-b8161e1982b1'::uuid, 'Интеллект'::text, 'INT'::text);

INSERT INTO rules.default_5e_ability (id, name, code)
VALUES ('91b149ca-83a8-45da-a6d0-1133679db6f8'::uuid, 'Мудрость'::text, 'WIS'::text);

INSERT INTO rules.default_5e_ability (id, name, code)
VALUES ('a4b697d2-9f03-4ebc-8290-a20cdbca9e97'::uuid, 'Харизма'::text, 'CHA'::text);


-- Вставляем навыки, связанные с характеристикой Сила
INSERT INTO rules.default_5e_skill (id, name, code, depend_on_ability)
VALUES
    ('556652a2-b959-4de5-ab27-8613df4c729e', 'Атлетика', 'ATHL', 'a7e6a7dc-fb39-49c8-bef3-0f719896d5c9'); -- Сила (STR)

-- Вставляем навыки, связанные с характеристикой Ловкость
INSERT INTO rules.default_5e_skill (id, name, code, depend_on_ability)
VALUES
    ('0a091e3d-76a7-4dd0-bf7a-fe23aa2d7c2c', 'Акробатика', 'ACRO', 'ac8b6ed6-1847-4a15-92ce-115987574c4c'), -- Ловкость (DEX)
    ('2ceba889-7ede-43d2-8c58-cd96480c3548', 'Ловкость рук', 'SLEI', 'ac8b6ed6-1847-4a15-92ce-115987574c4c'),
    ('4a38efb5-cf81-43e2-84ad-12232f640de3', 'Скрытность', 'STEA', 'ac8b6ed6-1847-4a15-92ce-115987574c4c');

-- Вставляем навыки, связанные с характеристикой Интеллект
INSERT INTO rules.default_5e_skill (id, name, code, depend_on_ability)
VALUES
    ('a8f7d053-1cee-4c56-afdc-a622444e8959', 'История', 'HIST', 'ca14d750-d28a-4bd7-9383-b8161e1982b1'), -- Интеллект (INT)
    ('849c9188-aff9-4920-ac01-6ed961db965d', 'Магия', 'ARCA', 'ca14d750-d28a-4bd7-9383-b8161e1982b1'),
    ('3bdb9fca-c856-4306-a3a5-7806a3b5af8f', 'Природа', 'NATR', 'ca14d750-d28a-4bd7-9383-b8161e1982b1'),
    ('08579ae9-c525-43c1-84e1-8de688d7679e', 'Расследование', 'INVE', 'ca14d750-d28a-4bd7-9383-b8161e1982b1'),
    ('06f89cf1-7bf6-4aa0-b5d3-f3f5135c2479', 'Религия', 'RELI', 'ca14d750-d28a-4bd7-9383-b8161e1982b1');

-- Вставляем навыки, связанные с характеристикой Мудрость
INSERT INTO rules.default_5e_skill (id, name, code, depend_on_ability)
VALUES
    ('17400f95-47e6-4679-99c5-8b68a989c561', 'Восприятие', 'PERC', '91b149ca-83a8-45da-a6d0-1133679db6f8'), -- Мудрость (WIS)
    ('2d1e15a2-9c75-4878-a6d5-0ad2e011a0a6', 'Выживание', 'SURV', '91b149ca-83a8-45da-a6d0-1133679db6f8'),
    ('d08a2aac-27f8-4191-a306-32d519ed6040', 'Медицина', 'MEDI', '91b149ca-83a8-45da-a6d0-1133679db6f8'),
    ('e73c09ed-69ed-4e40-9732-686095f575c5', 'Проницательность', 'INSI', '91b149ca-83a8-45da-a6d0-1133679db6f8'),
    ('9598c37f-3039-47a3-8732-368ae87bc4e3', 'Уход за животными', 'ANIM', '91b149ca-83a8-45da-a6d0-1133679db6f8');

-- Вставляем навыки, связанные с характеристикой Харизма
INSERT INTO rules.default_5e_skill (id, name, code, depend_on_ability)
VALUES
    ('09756533-1762-473a-a983-06a1c5d0fdfd', 'Выступление', 'PERF', 'a4b697d2-9f03-4ebc-8290-a20cdbca9e97'), -- Харизма (CHA)
    ('eb95e7df-8388-4980-aefb-950da51da298', 'Запугивание', 'INTI', 'a4b697d2-9f03-4ebc-8290-a20cdbca9e97'),
    ('1a59ee8d-bd53-4f3d-9e25-c85aac26c558', 'Обман', 'DECE', 'a4b697d2-9f03-4ebc-8290-a20cdbca9e97'),
    ('0e215457-7726-435c-b575-f070e90c3f66', 'Убеждение', 'PERS', 'a4b697d2-9f03-4ebc-8290-a20cdbca9e97');

