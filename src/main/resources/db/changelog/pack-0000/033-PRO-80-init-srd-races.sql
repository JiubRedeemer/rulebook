/* DND2024: SRD races (srd_2024_race) */

-- Таблица может отсутствовать в некоторых окружениях: создаём идемпотентно.
CREATE TABLE IF NOT EXISTS rules.srd_2024_race
(
    id uuid NOT NULL,
    "name" text NOT NULL,
    description text NULL,
    code text NOT NULL,
    race_stats_id uuid NOT NULL,
    img_url varchar NULL,
    species_code varchar NULL,
    CONSTRAINT srd_2024_race_pkey PRIMARY KEY (id)
);

-- Дварф (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('036a1837-e260-45a3-ba25-97421ab4b722'::uuid, 350::integer, 152::integer, 150::integer, 30::integer,
        '[{"code": "CON", "value": 2}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('5aa3f465-2b8c-4a5b-8b83-cd841cad523e'::uuid, '036a1837-e260-45a3-ba25-97421ab4b722'::uuid, 'Тёмное зрение'::text,
        'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 120 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2a12088a-3e50-44ad-b112-b6ae4c7de720'::uuid, '036a1837-e260-45a3-ba25-97421ab4b722'::uuid, 'Дварфийская стойкость'::text,
        'DWARVEN_RESILIENCE'::text, 'Вы обладаете сопротивлением к урону ядом. Вы также совершаете с преимуществом спасброски, чтобы избежать или прекратить состояние «Отравленный».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('25e86e40-8318-4f03-b56b-28152c2a3796'::uuid, '036a1837-e260-45a3-ba25-97421ab4b722'::uuid, 'Дварфийская выносливость'::text,
        'DWARVEN_TOUGHNESS'::text, 'Ваш максимальный запас хитов увеличивается на 1, и он увеличивается на 1 каждый раз, когда вы получаете уровень.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('75b43192-0691-470e-99d4-42aadcd50cac'::uuid, '036a1837-e260-45a3-ba25-97421ab4b722'::uuid, 'Чутьё камня'::text,
        'STONECUNNING'::text, 'Бонусным действием вы получаете чувство вибрации в радиусе 60 футов на 10 минут. Чтобы использовать это чувство вибрации, вы должны находиться на каменной поверхности или касаться каменной поверхности. Камень может быть природным или обработанным.

Вы можете использовать это бонусное действие количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('b50722f9-499c-430c-b4dd-19743a6aea9f'::uuid,
        'Дварф'::text,
        'Дварфы были созданы из земли в древние времена божеством кузнечного дела. В разных мирах его называют по-разному — Морадин, Реоркс и так далее. Этот бог наделил дварфов способностью к работе с камнем и металлом, а также склонностью к жизни под землёй. Он также сделал их стойкими, как горы, с продолжительностью жизни около 350 лет.
Коренастые и зачастую бородатые, первые дварфы вырезали города и крепости в горных склонах и под землёй. Их древнейшие легенды рассказывают о сражениях с монстрами, обитающими на вершинах гор и в Подземье, будь то исполинские гиганты или подземные чудовища. Вдохновленные этими историями, дварфы любой культуры часто поют о доблестных подвигах, особенно о том, как малые побеждают великих.
В некоторых мирах мультивселенной первые поселения дварфов были построены в холмах или горах, и семьи, ведущие своё происхождение от этих поселений, называют себя холмовыми или горными дварфами соответственно. В сеттингах Грейхок и Сага о копье существуют такие сообщества.'::text,
        'DWARF'::text,
        '036a1837-e260-45a3-ba25-97421ab4b722'::uuid,
        'DWARF'::varchar,
        'DWARF'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Эльф (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('c8ff516a-54fc-452c-8a88-7cc49b697c9a'::uuid, 750::integer, 175::integer, 70::integer, 30::integer,
        '[{"code": "DEX", "value": 2}, {"code": "ANY", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d8703d5e-b079-4be3-9352-8f2f4ac50f12'::uuid, 'c8ff516a-54fc-452c-8a88-7cc49b697c9a'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ed44467f-6534-4988-942f-b080e9877b7f'::uuid, 'c8ff516a-54fc-452c-8a88-7cc49b697c9a'::uuid,
        'Наследие фей'::text, 'FEY_ANCESTRY'::text, 'Вы совершаете с преимуществом спасброски, чтобы избежать или прекратить состояние «Очарованный».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e57e3c79-0635-4565-9a8a-63a2e836008b'::uuid, 'c8ff516a-54fc-452c-8a88-7cc49b697c9a'::uuid,
        'Острые чувства'::text, 'KEEN_SENSES'::text, 'Вы получаете владение одним из следующих навыков: Проницательность, Внимательность или Выживание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c8b6a55d-baa6-4540-9089-c0d89e0b6a9f'::uuid, 'c8ff516a-54fc-452c-8a88-7cc49b697c9a'::uuid,
        'Транс'::text, 'TRANCE'::text, 'Вам не нужно спать, и магия не может усыпить вас. Вы можете завершить продолжительный отдых за 4 часа, если проведёте это время в трансоподобной медитации, во время которой сохраняете сознание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('9825a260-33dd-443f-b84a-6021bbbdad37'::uuid,
        'Эльф'::text,
        'Эльфы — гуманоиды, умеющие видеть магию и тайны мира в деталях. Их спокойное существование и врождённая связь с фейским краем отражаются в уникальных умениях, связанных со зрением, сдерживанием чар и медитативным отдыхом.'::text,
        'ELF'::text,
        'c8ff516a-54fc-452c-8a88-7cc49b697c9a'::uuid,
        'ELF'::varchar,
        'ELF'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Дроу
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('e8dd23c8-ddb4-49a6-94cc-101f7b2cf8a9'::uuid, 750::integer, 175::integer, 70::integer, 30::integer,
        '[{"code": "DEX", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('aa74b13a-5308-478c-8578-b0002667622b'::uuid, 'e8dd23c8-ddb4-49a6-94cc-101f7b2cf8a9'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 120 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('5d4d0e9a-5038-43f4-8f8c-398c0fd3acef'::uuid, 'e8dd23c8-ddb4-49a6-94cc-101f7b2cf8a9'::uuid,
        'Наследие фей'::text, 'FEY_ANCESTRY'::text, 'Вы совершаете с преимуществом спасброски, чтобы избежать или прекратить состояние «Очарованный».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d425a8f4-7526-4f1e-9f84-03dfc89e28a3'::uuid, 'e8dd23c8-ddb4-49a6-94cc-101f7b2cf8a9'::uuid,
        'Острые чувства'::text, 'KEEN_SENSES'::text, 'Вы получаете владение одним из следующих навыков: Проницательность, Внимательность или Выживание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('52268950-0901-42e5-bb75-b5b1485a1f9e'::uuid, 'e8dd23c8-ddb4-49a6-94cc-101f7b2cf8a9'::uuid,
        'Транс'::text, 'TRANCE'::text, 'Вам не нужно спать, и магия не может усыпить вас. Вы можете завершить продолжительный отдых за 4 часа, если проведёте это время в трансоподобной медитации, во время которой сохраняете сознание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('99aee930-4ebb-4a42-b578-b0be4f46fca0'::uuid, 'e8dd23c8-ddb4-49a6-94cc-101f7b2cf8a9'::uuid,
        'Эльфийская родословная. Дроу'::text, 'ELVEN_LINEAGE_DROW'::text,
        'Вы также знаете заговор «Танцующие огоньки». На 3 уровне вы изучаете заклинание «Огонь фей», а на 5 уровне — «Тьма». Эти заклинания всегда считаются для вас подготовленными. Вы можете творить каждое из них по одному разу без ячейки заклинаний и восстанавливаете эту возможность после завершения продолжительного отдыха. Вы также можете творить эти заклинания, используя любые имеющиеся у вас ячейки заклинаний соответствующего уровня.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('02a45177-24a7-4eca-9447-85e9d8bf11db'::uuid,
        'Дроу'::text,
        'Дроу — эльфы, чья жизнь и магия тесно связаны с Подземьем. Их врождённые способности позволяют им лучше воспринимать тьму и сохранять стойкость к чужим чарам, а также получать доступ к специализированным «эллинным» заклинаниям.'::text,
        'DROW'::text,
        'e8dd23c8-ddb4-49a6-94cc-101f7b2cf8a9'::uuid,
        'DROW'::varchar,
        'ELF'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Высший эльф
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('46a9f513-4bd3-4fa7-af3a-063d1cd7132b'::uuid, 750::integer, 175::integer, 70::integer, 30::integer,
        '[{"code": "DEX", "value": 2}, {"code": "INT", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('916ebf44-e7b7-4dc0-8176-5e95b4c7de14'::uuid, '46a9f513-4bd3-4fa7-af3a-063d1cd7132b'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('31f1ec74-0f2e-4ba2-8f3c-008010053763'::uuid, '46a9f513-4bd3-4fa7-af3a-063d1cd7132b'::uuid,
        'Наследие фей'::text, 'FEY_ANCESTRY'::text, 'Вы совершаете с преимуществом спасброски, чтобы избежать или прекратить состояние «Очарованный».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('410a01be-a46f-4a1b-bee2-e3630d656fa0'::uuid, '46a9f513-4bd3-4fa7-af3a-063d1cd7132b'::uuid,
        'Острые чувства'::text, 'KEEN_SENSES'::text, 'Вы получаете владение одним из следующих навыков: Проницательность, Внимательность или Выживание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('6dac79b5-0452-4b49-849e-f99f449cc30e'::uuid, '46a9f513-4bd3-4fa7-af3a-063d1cd7132b'::uuid,
        'Транс'::text, 'TRANCE'::text, 'Вам не нужно спать, и магия не может усыпить вас. Вы можете завершить продолжительный отдых за 4 часа, если проведёте это время в трансоподобной медитации, во время которой сохраняете сознание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d5d22e7e-7754-4827-83be-67ce6be58ecd'::uuid, '46a9f513-4bd3-4fa7-af3a-063d1cd7132b'::uuid,
        'Эльфийская родословная. Высший эльф'::text, 'ELVEN_LINEAGE_HIGH_ELF'::text,
        'На 1 уровне вы знаете заговор «Фокусы». После каждого завершения продолжительного отдыха вы можете заменить этот заговор другим заговором из списка заклинаний волшебника. На 3 уровне вы изучаете заклинание «Обнаружение магии», а на 5 уровне — «Туманный шаг». Эти заклинания всегда считаются для вас подготовленными. Вы можете творить каждое из них по одному разу без ячейки заклинаний и восстанавливаете эту возможность после завершения продолжительного отдыха. Вы также можете творить эти заклинания, используя любые имеющиеся у вас ячейки заклинаний соответствующего уровня.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('dfc3b833-d353-45f0-88fd-6e6a00d14841'::uuid,
        'Высший эльф'::text,
        'Высшие эльфы пропитаны магией пересечения между Страной фей и Материальным планом. Их тренировки делают их внимательными к мелочам и позволяют сохранять ясность даже под давлением чужих чар.'::text,
        'HIGH_ELF'::text,
        '46a9f513-4bd3-4fa7-af3a-063d1cd7132b'::uuid,
        'HIGH_ELF'::varchar,
        'ELF'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Лесной эльф
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('d6734829-0b69-4fd2-84b3-0cf8499f2e6d'::uuid, 750::integer, 175::integer, 70::integer, 35::integer,
        '[{"code": "DEX", "value": 2}, {"code": "WIS", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('207e285f-34a6-45db-b7b9-0c0e18100acd'::uuid, 'd6734829-0b69-4fd2-84b3-0cf8499f2e6d'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cf2ae0a4-76f4-4521-98df-55c394619497'::uuid, 'd6734829-0b69-4fd2-84b3-0cf8499f2e6d'::uuid,
        'Наследие фей'::text, 'FEY_ANCESTRY'::text, 'Вы совершаете с преимуществом спасброски, чтобы избежать или прекратить состояние «Очарованный».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('3c6ea65d-8813-4d80-b1f7-dfb2339a613e'::uuid, 'd6734829-0b69-4fd2-84b3-0cf8499f2e6d'::uuid,
        'Острые чувства'::text, 'KEEN_SENSES'::text, 'Вы получаете владение одним из следующих навыков: Проницательность, Внимательность или Выживание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('f466026e-1dee-480e-9fa7-ce9d8a2729cc'::uuid, 'd6734829-0b69-4fd2-84b3-0cf8499f2e6d'::uuid,
        'Транс'::text, 'TRANCE'::text, 'Вам не нужно спать, и магия не может усыпить вас. Вы можете завершить продолжительный отдых за 4 часа, если проведёте это время в трансоподобной медитации, во время которой сохраняете сознание.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('f152f69b-2cdc-434d-92b5-46b44e1d2b25'::uuid, 'd6734829-0b69-4fd2-84b3-0cf8499f2e6d'::uuid,
        'Эльфийская родословная. Лесной эльф'::text, 'ELVEN_LINEAGE_WOOD_ELF'::text,
        'На 1 уровне вы знаете заговор «Искусство друидов». На 3 уровне вы изучаете заклинание «Скороход», а на 5 уровне — «Бесследное передвижение». Эти заклинания всегда считаются для вас подготовленными. Вы можете творить каждое из них по одному разу без ячейки заклинаний и восстанавливаете эту возможность после завершения продолжительного отдыха. Вы также можете творить эти заклинания, используя любые имеющиеся у вас ячейки заклинаний соответствующего уровня.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('11b8662a-ff08-4a95-a80e-16069d8d9329'::uuid,
        'Лесной эльф'::text,
        'Лесные эльфы тесно связаны с первобытными лесами и магией зелёных троп. Их умения отражают внимательность к природе, устойчивость к чарам и быструю адаптацию к любой местности.'::text,
        'WOOD_ELF'::text,
        'd6734829-0b69-4fd2-84b3-0cf8499f2e6d'::uuid,
        'WOOD_ELF'::varchar,
        'ELF'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Драконорождённый (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('8ce0201a-1124-41c4-97ad-0a0a4913f4e9'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('470b7892-bb29-46fc-990d-fac1719f3b73'::uuid, '8ce0201a-1124-41c4-97ad-0a0a4913f4e9'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('85177f4f-2820-4faf-9a67-5b8e7a27a59b'::uuid, '8ce0201a-1124-41c4-97ad-0a0a4913f4e9'::uuid,
        'Драконье происхождение'::text, 'DRACONIC_ANCESTRY'::text, 'Ваша родословная происходит от драконьего прародителя. Выберите вид дракона из таблицы «Драконьи предки». Ваш выбор влияет на черты «Драконье дыхание» и «Сопротивление урону», а также на вашу внешность.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d08ddddb-55da-4179-9d74-6d441f1957a8'::uuid, '8ce0201a-1124-41c4-97ad-0a0a4913f4e9'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона того типа, который определяется чертой «Драконье происхождение». При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('fc3baea3-c8ad-4f77-aafe-93ce219159d9'::uuid, '8ce0201a-1124-41c4-97ad-0a0a4913f4e9'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к типу урона, определяемому чертой «Драконье происхождение».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ed75ce05-f64f-40c9-beaf-9d24fe154fad'::uuid, '8ce0201a-1124-41c4-97ad-0a0a4913f4e9'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('67738e88-7b58-4f30-9541-2ff56e2e5de3'::uuid,
        'Драконорождённый'::text,
        'Драконорождённые связаны происхождением с драконьим прародителем. Их врождённые черты отражают выбранный ими драконий тип, проявляясь в дыхании и стойкости к определённому урону, а на более высоких уровнях — в способности к полёту.'::text,
        'DRAGONBORN'::text,
        '8ce0201a-1124-41c4-97ad-0a0a4913f4e9'::uuid,
        'DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Подвиды (драконьи предки)

-- Чёрный дракон (кислота)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('0d9f0c26-40e3-4569-87ed-7f64370557c5'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('eba1ce10-57e1-412f-90f6-f23cba5dc535'::uuid, '0d9f0c26-40e3-4569-87ed-7f64370557c5'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d252e4b0-1ede-4f4c-ba20-435e90bfc485'::uuid, '0d9f0c26-40e3-4569-87ed-7f64370557c5'::uuid,
        'Драконье происхождение. Чёрный дракон'::text, 'DRACONIC_ANCESTRY_BLACK'::text,
        'Ваша родословная происходит от чёрного драконьего прародителя. Ваше Драконье дыхание наносит урон кислотой, а ваше Сопротивление урону применяется к кислоте.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('69f09268-ccbd-4ca2-bc64-9424a14d8d1b'::uuid, '0d9f0c26-40e3-4569-87ed-7f64370557c5'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона кислотой. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('25aa3ac2-0965-4711-9191-4b868bc57390'::uuid, '0d9f0c26-40e3-4569-87ed-7f64370557c5'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text,
        'Вы обладаете сопротивлением к урону кислотой.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('7f621d69-95e2-4648-a9ca-17e20a7ff383'::uuid, '0d9f0c26-40e3-4569-87ed-7f64370557c5'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('5646df9b-c728-45a1-ac3e-593ed745f14c'::uuid,
        'Драконорождённый. Чёрный'::text,
        'Ваши черты и магия связаны с чёрным драконом. Ваше дыхание извергает кислоту, а тело закалено против неё.'::text,
        'BLACK_DRAGONBORN'::text,
        '0d9f0c26-40e3-4569-87ed-7f64370557c5'::uuid,
        'BLACK_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Синий дракон (электричество)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('32229aa8-8de8-416e-a4cf-55782729f339'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c3fdf5ad-3ee0-4d17-bcd8-09c12f2af69d'::uuid, '32229aa8-8de8-416e-a4cf-55782729f339'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('40271305-acce-4e94-a6f1-d58bb826df7b'::uuid, '32229aa8-8de8-416e-a4cf-55782729f339'::uuid,
        'Драконье происхождение. Синий дракон'::text, 'DRACONIC_ANCESTRY_BLUE'::text,
        'Ваша родословная происходит от синего драконьего прародителя. Ваше Драконье дыхание наносит урон электричеством, а ваше Сопротивление урону применяется к электричеству.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('4c583365-42ee-47d5-8ac5-b460dd270914'::uuid, '32229aa8-8de8-416e-a4cf-55782729f339'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона электричеством. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('8a83c84a-543b-4163-a5b9-bf3d08c8abe6'::uuid, '32229aa8-8de8-416e-a4cf-55782729f339'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону электричеством.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ae647484-b33f-4fdb-a255-ca06d2257d9e'::uuid, '32229aa8-8de8-416e-a4cf-55782729f339'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('a043fe10-fe88-4362-9ca5-274cce0bd6ec'::uuid,
        'Драконорождённый. Синий'::text,
        'Ваши черты отражают энергию грозы. Выдыхая, вы поражаете врагов ударами электричества, а ваша стойкость защищает от него.'::text,
        'BLUE_DRAGONBORN'::text,
        '32229aa8-8de8-416e-a4cf-55782729f339'::uuid,
        'BLUE_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Латунный дракон (огонь)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('54c2b9f4-281d-49d8-9bab-a17d4bbf7070'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('264e2b07-ea67-4167-b7e8-f69a2cc63c90'::uuid, '54c2b9f4-281d-49d8-9bab-a17d4bbf7070'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ddce9e70-3863-4838-bbf0-b6e9467fa49d'::uuid, '54c2b9f4-281d-49d8-9bab-a17d4bbf7070'::uuid,
        'Драконье происхождение. Латунный дракон'::text, 'DRACONIC_ANCESTRY_BRASS'::text,
        'Ваша родословная происходит от латунного драконьего прародителя. Ваше Драконье дыхание наносит урон огнём, а ваше Сопротивление урону применяется к огню.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c761d8fc-e637-4d65-b5ce-81d88e6fe849'::uuid, '54c2b9f4-281d-49d8-9bab-a17d4bbf7070'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона огнём. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2f39bf4a-8615-4ffd-bd49-15ae9c92f7c0'::uuid, '54c2b9f4-281d-49d8-9bab-a17d4bbf7070'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону огнём.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('60b037ba-ebd9-408d-aff1-6d67be8562ab'::uuid, '54c2b9f4-281d-49d8-9bab-a17d4bbf7070'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('3e4b3d05-d7a2-4c2a-8f96-a9523786f2ff'::uuid,
        'Драконорождённый. Латунный'::text,
        'Ваше дыхание разжигает пламя. Вы переживаете жар, сохраняя силу и ясность даже среди огня.'::text,
        'BRASS_DRAGONBORN'::text,
        '54c2b9f4-281d-49d8-9bab-a17d4bbf7070'::uuid,
        'BRASS_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Бронзовый дракон (электричество)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('59ba6d24-0fcc-41f6-bfd5-1e90767395e6'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('fdb14171-7202-41a4-9ec5-9372ee289904'::uuid, '59ba6d24-0fcc-41f6-bfd5-1e90767395e6'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e06476ad-7026-478a-92ee-b11f8d8aba69'::uuid, '59ba6d24-0fcc-41f6-bfd5-1e90767395e6'::uuid,
        'Драконье происхождение. Бронзовый дракон'::text, 'DRACONIC_ANCESTRY_BRONZE'::text,
        'Ваша родословная происходит от бронзового драконьего прародителя. Ваше Драконье дыхание наносит урон электричеством, а ваше Сопротивление урону применяется к электричеству.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ec4f1714-18df-4cd6-a60c-d8e6392a3f1e'::uuid, '59ba6d24-0fcc-41f6-bfd5-1e90767395e6'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона электричеством. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('59e37047-5a09-4643-8b02-6697c66efca3'::uuid, '59ba6d24-0fcc-41f6-bfd5-1e90767395e6'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону электричеством.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('6ab29724-b3f7-4e53-9610-8c83c40df7e1'::uuid, '59ba6d24-0fcc-41f6-bfd5-1e90767395e6'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('89f0e072-82a6-48ab-86fc-4aa37ccaf1cd'::uuid,
        'Драконорождённый. Бронзовый'::text,
        'Ваша магия подобна ударам молнии. Выражая её дыханием, вы наводите электричество, а сопротивление защищает от ответного разряда.'::text,
        'BRONZE_DRAGONBORN'::text,
        '59ba6d24-0fcc-41f6-bfd5-1e90767395e6'::uuid,
        'BRONZE_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Медный дракон (кислота)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('690675d9-2b81-497f-ab6e-aceba019c7bd'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('11492ce7-0070-4f26-8ef7-f26b745644d6'::uuid, '690675d9-2b81-497f-ab6e-aceba019c7bd'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d33d6055-9352-4b17-b834-24bc75ea4092'::uuid, '690675d9-2b81-497f-ab6e-aceba019c7bd'::uuid,
        'Драконье происхождение. Медный дракон'::text, 'DRACONIC_ANCESTRY_COPPER'::text,
        'Ваша родословная происходит от медного драконьего прародителя. Ваше Драконье дыхание наносит урон кислотой, а ваше Сопротивление урону применяется к кислоте.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('1d1f3239-ce2c-41bf-9cb2-ade5a49ab3d5'::uuid, '690675d9-2b81-497f-ab6e-aceba019c7bd'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона кислотой. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('68e7bd07-a5f2-4122-85b1-f27f69843710'::uuid, '690675d9-2b81-497f-ab6e-aceba019c7bd'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону кислотой.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('b812f512-9def-4535-9218-5efdcd263be3'::uuid, '690675d9-2b81-497f-ab6e-aceba019c7bd'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('ab026d86-b04c-44d5-bc0a-cc3a0f1c9ad7'::uuid,
        'Драконорождённый. Медный'::text,
        'Ваше дыхание отравляет и разъедает, словно медь, что темнеет на воздухе. Ваша стойкость помогает переживать кислотные удары.'::text,
        'COPPER_DRAGONBORN'::text,
        '690675d9-2b81-497f-ab6e-aceba019c7bd'::uuid,
        'COPPER_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Золотой дракон (огонь)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('4c611c72-2f84-454e-b1c9-cee374f9b77b'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('20db90f1-e940-49d4-b13d-c254aefc12b1'::uuid, '4c611c72-2f84-454e-b1c9-cee374f9b77b'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('40863d6f-e9d5-496e-9d5b-985d54563404'::uuid, '4c611c72-2f84-454e-b1c9-cee374f9b77b'::uuid,
        'Драконье происхождение. Золотой дракон'::text, 'DRACONIC_ANCESTRY_GOLD'::text,
        'Ваша родословная происходит от золотого драконьего прародителя. Ваше Драконье дыхание наносит урон огнём, а ваше Сопротивление урону применяется к огню.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('14a531f1-b1c5-405c-a14e-14b8c56ec859'::uuid, '4c611c72-2f84-454e-b1c9-cee374f9b77b'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона огнём. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2b479400-a359-401f-af29-d9710bee8836'::uuid, '4c611c72-2f84-454e-b1c9-cee374f9b77b'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону огнём.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('97c1371b-86f6-4334-a160-2821f5df041b'::uuid, '4c611c72-2f84-454e-b1c9-cee374f9b77b'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('9275e639-c9d8-4687-a404-f7d3d1418fa9'::uuid,
        'Драконорождённый. Золотой'::text,
        'Ваш огонь яркий и горячий. Вы не просто выдыхаете пламя — вы умеете противостоять жару, который оно несёт.'::text,
        'GOLD_DRAGONBORN'::text,
        '4c611c72-2f84-454e-b1c9-cee374f9b77b'::uuid,
        'GOLD_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Зелёный дракон (яд)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('3b29567a-e84f-43d6-900e-0ea9800d9d7d'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e2004b6f-b59e-4378-ae2f-4aabf11b4ade'::uuid, '3b29567a-e84f-43d6-900e-0ea9800d9d7d'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('4e06621b-a4e0-4831-b483-737a9de85038'::uuid, '3b29567a-e84f-43d6-900e-0ea9800d9d7d'::uuid,
        'Драконье происхождение. Зелёный дракон'::text, 'DRACONIC_ANCESTRY_GREEN'::text,
        'Ваша родословная происходит от зелёного драконьего прародителя. Ваше Драконье дыхание наносит урон ядом, а ваше Сопротивление урону применяется к яду.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('9b5de0d4-00d4-486c-8526-51bd62187d9a'::uuid, '3b29567a-e84f-43d6-900e-0ea9800d9d7d'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона ядом. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('eef00838-a38c-4cbb-8082-17c5c18ff5e4'::uuid, '3b29567a-e84f-43d6-900e-0ea9800d9d7d'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону ядом.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('01df8524-6645-4a34-8dad-17ed89969b17'::uuid, '3b29567a-e84f-43d6-900e-0ea9800d9d7d'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('b95449a4-1f33-464b-bb1e-f142c8517c58'::uuid,
        'Драконорождённый. Зелёный'::text,
        'Ваше дыхание пропитано ядом. Вас труднее одолеть токсичными атаками, ведь ваша кровь учится сопротивляться им.'::text,
        'GREEN_DRAGONBORN'::text,
        '3b29567a-e84f-43d6-900e-0ea9800d9d7d'::uuid,
        'GREEN_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Красный дракон (огонь)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('06ec8106-90c4-4e12-9664-3ecb0979775a'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('5b77ab4b-6903-42c4-b74d-e7d2645bdba9'::uuid, '06ec8106-90c4-4e12-9664-3ecb0979775a'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('952fb1e4-8916-44d1-a929-1fe8d2032503'::uuid, '06ec8106-90c4-4e12-9664-3ecb0979775a'::uuid,
        'Драконье происхождение. Красный дракон'::text, 'DRACONIC_ANCESTRY_RED'::text,
        'Ваша родословная происходит от красного драконьего прародителя. Ваше Драконье дыхание наносит урон огнём, а ваше Сопротивление урону применяется к огню.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('024f1bbf-a7cb-4219-95a7-0be0edd9ea62'::uuid, '06ec8106-90c4-4e12-9664-3ecb0979775a'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона огнём. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('1be5491e-ff3e-4c72-b4b7-1d592d2ff44f'::uuid, '06ec8106-90c4-4e12-9664-3ecb0979775a'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону огнём.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ab859b76-07cf-401a-a0f1-e058e119a9f7'::uuid, '06ec8106-90c4-4e12-9664-3ecb0979775a'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('6d461193-da0c-4810-a579-e6a0ab1c110b'::uuid,
        'Драконорождённый. Красный'::text,
        'Ваше пламя вспыхивает быстрее и сильнее. Вы защищены от жара и можете навязывать бой на расстоянии.'::text,
        'RED_DRAGONBORN'::text,
        '06ec8106-90c4-4e12-9664-3ecb0979775a'::uuid,
        'RED_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Серебряный дракон (холод)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('6fcdf6f6-cbcc-479b-9818-3e457fd62c3e'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('b76e577c-4ae1-4d52-8177-ccada6739793'::uuid, '6fcdf6f6-cbcc-479b-9818-3e457fd62c3e'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('1bded792-9fb4-4002-b960-5477b8d694c8'::uuid, '6fcdf6f6-cbcc-479b-9818-3e457fd62c3e'::uuid,
        'Драконье происхождение. Серебряный дракон'::text, 'DRACONIC_ANCESTRY_SILVER'::text,
        'Ваша родословная происходит от серебряного драконьего прародителя. Ваше Драконье дыхание наносит урон холодом, а ваше Сопротивление урону применяется к холоду.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cc68ba3d-7ab3-48df-950d-3b5169c91dbe'::uuid, '6fcdf6f6-cbcc-479b-9818-3e457fd62c3e'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона холодом. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('f58d750c-7735-4dc6-89e7-fd8e934ad9bc'::uuid, '6fcdf6f6-cbcc-479b-9818-3e457fd62c3e'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону холодом.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e3066a05-052a-45be-a798-813d45ee086a'::uuid, '6fcdf6f6-cbcc-479b-9818-3e457fd62c3e'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('fd5d3168-e0bf-41d0-bcb5-f5f417d59e1f'::uuid,
        'Драконорождённый. Серебряный'::text,
        'Ваше дыхание кристаллизует воздух. Вы устойчивы к холоду и способны удерживать контроль над полем боя даже в ледяных условиях.'::text,
        'SILVER_DRAGONBORN'::text,
        '6fcdf6f6-cbcc-479b-9818-3e457fd62c3e'::uuid,
        'SILVER_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Белый дракон (холод)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('7efdb0c0-e19e-4b86-a6c3-4c2de09f293a'::uuid, 120::integer, 190::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('76c8d2db-bd25-4855-b068-103f13b268b3'::uuid, '7efdb0c0-e19e-4b86-a6c3-4c2de09f293a'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ec068929-51e3-4daa-a36e-f08e0a82dd23'::uuid, '7efdb0c0-e19e-4b86-a6c3-4c2de09f293a'::uuid,
        'Драконье происхождение. Белый дракон'::text, 'DRACONIC_ANCESTRY_WHITE'::text,
        'Ваша родословная происходит от белого драконьего прародителя. Ваше Драконье дыхание наносит урон холодом, а ваше Сопротивление урону применяется к холоду.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c8b4ca13-6442-4c28-b01c-fd33c31c23ec'::uuid, '7efdb0c0-e19e-4b86-a6c3-4c2de09f293a'::uuid,
        'Драконье дыхание'::text, 'BREATH_WEAPON'::text,
        'Когда вы совершаете действие Атака в свой ход, вы можете заменить одну из своих атак выдохом магической энергии в виде 15-футового конуса или 30-футовой линии шириной 5 футов (выбирайте форму каждый раз). Каждое существо в этой области должно совершить спасбросок Ловкости (СЛ 8 плюс ваш модификатор Телосложения и бонус мастерства). При провале существо получает 1d10 урона холодом. При успехе существо получает половину урона. Этот урон увеличивается на 1d10 на 5-м уровне (2d10), 11-м (3d10) и 17-м (4d10) уровнях. Вы можете использовать это драконье дыхание количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d2e9f366-db1d-408b-9319-a5fb95618f31'::uuid, '7efdb0c0-e19e-4b86-a6c3-4c2de09f293a'::uuid,
        'Сопротивление урону'::text, 'DAMAGE_RESISTANCE'::text, 'Вы обладаете сопротивлением к урону холодом.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('1304ffc0-dea0-42e7-9a68-520792147557'::uuid, '7efdb0c0-e19e-4b86-a6c3-4c2de09f293a'::uuid,
        'Драконий полёт'::text, 'DRACONIC_FLIGHT'::text, 'Когда вы достигаете 5-го уровня, вы можете направить драконью магию, чтобы обрести временную способность летать. Бонусным действием вы отращиваете призрачные крылья на спине, которые существуют 10 минут или пока вы не втянете крылья (действие не требуется) или не получите состояние «Недееспособный». В течение этого времени ваша скорость полёта равна вашей скорости. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('3478ff14-b785-4a37-9242-468242400739'::uuid,
        'Драконорождённый. Белый'::text,
        'Ваше дыхание пробивает холодный воздух. Вы устойчивы к морозу и умеете поддерживать темп боя даже в самых суровых условиях.'::text,
        'WHITE_DRAGONBORN'::text,
        '7efdb0c0-e19e-4b86-a6c3-4c2de09f293a'::uuid,
        'WHITE_DRAGONBORN'::varchar,
        'DRAGONBORN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Гном (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('75128b15-8af2-4846-b087-5b6a551db4b3'::uuid, 350::integer, 122::integer, 50::integer, 30::integer,
        '[{"code": "INT", "value": 2}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ecfa275c-4e87-41e6-b834-1c2d9ea1b8e0'::uuid, '75128b15-8af2-4846-b087-5b6a551db4b3'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cd12590c-dc51-450e-973b-4ed491664811'::uuid, '75128b15-8af2-4846-b087-5b6a551db4b3'::uuid,
        'Гномья хитрость'::text, 'GNOMISH_CUNNING'::text, 'Вы совершаете с преимуществом спасброски Интеллекта, Мудрости и Харизмы.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('4305bef5-eed7-4639-8013-bdffa163afea'::uuid, '75128b15-8af2-4846-b087-5b6a551db4b3'::uuid,
        'Гномья родословная'::text, 'GNOMISH_LINEAGE'::text,
        'Вы принадлежите к родословной, дарующей вам сверхъестественные способности. Выберите один из следующих вариантов; какой бы вы ни выбрали, Интеллект, Мудрость или Харизма является вашей заклинательной характеристикой для заклинаний, которые вы сотворяете с помощью этой черты (выберите характеристику при выборе родословной):'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('32e10313-4b39-475d-96d8-0b53e1550a4d'::uuid,
        'Гном'::text,
        'Гномы обладают острым умом и привычкой превращать знания и навыки в практичные решения. Их магия часто связана с вниманием к деталям и врождённой изобретательностью.'::text,
        'GNOME'::text,
        '75128b15-8af2-4846-b087-5b6a551db4b3'::uuid,
        'GNOME'::varchar,
        'GNOME'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Лесной гном
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('cc2090d3-14c4-49c2-8e0f-9cf831cd70ba'::uuid, 350::integer, 122::integer, 50::integer, 30::integer,
        '[{"code": "DEX", "value": 1}, {"code": "INT", "value": 2}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('32ed8775-08f0-4a33-840d-eabea9b6fb11'::uuid, 'cc2090d3-14c4-49c2-8e0f-9cf831cd70ba'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('92d81ae6-a3d7-42e3-b24d-7da1f05c2e48'::uuid, 'cc2090d3-14c4-49c2-8e0f-9cf831cd70ba'::uuid,
        'Гномья хитрость'::text, 'GNOMISH_CUNNING'::text, 'Вы совершаете с преимуществом спасброски Интеллекта, Мудрости и Харизмы.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2eebf346-7ab2-4fc5-a82f-d56a96e4227d'::uuid, 'cc2090d3-14c4-49c2-8e0f-9cf831cd70ba'::uuid,
        'Гномья родословная. Лесной гном'::text, 'GNOMISH_LINEAGE_FOREST_GNOME'::text,
        'Вы знаете заговор «Малая иллюзия». Заклинание «Разговор с животными» также всегда у вас подготовлено. Вы можете сотворить его без ячейки заклинания количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха. Вы также можете использовать любые имеющиеся у вас ячейки заклинаний для сотворения этого заклинания.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('fb7b5d51-a34d-4ac6-8279-d69a5cbf9dae'::uuid,
        'Лесной гном'::text,
        'Лесные гномы связывают своё мастерство с иллюзиями и дружбой с природным миром. Их магия помогает скрываться, общаться с зверями и обходить опасности тонкими трюками.'::text,
        'FOREST_GNOME'::text,
        'cc2090d3-14c4-49c2-8e0f-9cf831cd70ba'::uuid,
        'FOREST_GNOME'::varchar,
        'GNOME'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Скальный гном
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('618122e9-a473-46a4-990c-86129f464d52'::uuid, 350::integer, 122::integer, 50::integer, 30::integer,
        '[{"code": "CON", "value": 1}, {"code": "INT", "value": 2}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('5e3627a5-8d27-4b0a-828c-c71f57bfec48'::uuid, '618122e9-a473-46a4-990c-86129f464d52'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2d916611-97f2-4887-828c-71d177217bab'::uuid, '618122e9-a473-46a4-990c-86129f464d52'::uuid,
        'Гномья хитрость'::text, 'GNOMISH_CUNNING'::text, 'Вы совершаете с преимуществом спасброски Интеллекта, Мудрости и Харизмы.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('15a2b8f7-d9e1-4d9a-a515-18c159992c0a'::uuid, '618122e9-a473-46a4-990c-86129f464d52'::uuid,
        'Гномья родословная. Скальный гном'::text, 'GNOMISH_LINEAGE_ROCK_GNOME'::text,
        'Вы знаете заговоры «Починка» и «Фокусы». Кроме того, вы можете потратить 10 минут на сотворение «Фокусов», чтобы создать крошечное заводное устройство (КД 5, 1 хит), такое как игрушка, огниво или музыкальная шкатулка. Когда вы создаёте устройство, вы определяете его функцию, выбирая один эффект из «Фокусов»; устройство производит этот эффект, когда вы или другое существо активирует его бонусным действием касанием. Если выбранный эффект имеет варианты, вы выбираете один из них для устройства при его создании. Например, если вы выбираете эффект зажигания-угасания, вы определяете, будет ли устройство зажигать или тушить огонь; устройство не делает и то, и другое. Вы можете иметь одновременно три таких устройства, и каждое рассыпается через 8 часов после создания или когда вы разбираете его касанием как действие использование.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('1bd25c7f-17e6-4946-9f2c-ac622d6fc7c6'::uuid,
        'Скальный гном'::text,
        'Скальные гномы ценят ремесло, железо и точность. Их способность работать с крошечными механизмами делает их незаменимыми изобретателями, техниками и хранителями горных тайн.'::text,
        'ROCK_GNOME'::text,
        '618122e9-a473-46a4-990c-86129f464d52'::uuid,
        'ROCK_GNOME'::varchar,
        'GNOME'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Голиаф (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('9ee03a8a-325c-4f36-9e23-ade3fd9826a8'::uuid, 100::integer, 244::integer, 350::integer, 35::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('73671296-5b2b-49ca-86d7-1631d6dc87ca'::uuid, '9ee03a8a-325c-4f36-9e23-ade3fd9826a8'::uuid,
        'Наследие великанов'::text, 'GIANT_ANCESTRY'::text,
        'Вы происходите от великанов. Выберите одно из преимуществ вашего наследия (сверхъестественный дар). Вы можете использовать выбранное преимущество количество раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('378855f4-469d-4cbe-9f17-198edd07305e'::uuid, '9ee03a8a-325c-4f36-9e23-ade3fd9826a8'::uuid,
        'Большая форма'::text, 'LARGE_FORM'::text,
        'Начиная с 5-го уровня персонажа, вы можете бонусным действием изменить свой размер на Большой, если находитесь в достаточно большом пространстве. Это превращение длится 10 минут или пока вы не завершите его (действие не требуется). В течение этого времени вы совершаете с преимуществом проверки Силы, и ваша скорость увеличивается на 10 футов. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('793b2f95-b787-40f2-aa09-da628cfb66a0'::uuid, '9ee03a8a-325c-4f36-9e23-ade3fd9826a8'::uuid,
        'Мощное телосложение'::text, 'POWERFUL_BUILD'::text,
        'Вы совершаете с преимуществом любую проверку характеристики для прекращения состояния «Схваченный». Вы также считаетесь на один размер больше при определении вашей грузоподъёмности.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('793b2f95-b787-40f2-aa09-da628cfb66a0'::uuid,
        'Голиаф'::text,
        'Голиафы — могучие гуманоиды, в чьих жилах течёт наследие великанов. Их сила проявляется в сверхъестественных дарах, способности на короткое время становиться огромными и в выдающейся физической мощи.'::text,
        'GOLIATH'::text,
        '9ee03a8a-325c-4f36-9e23-ade3fd9826a8'::uuid,
        'GOLIATH'::varchar,
        'GOLIATH'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Облачный великан
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('3b4d01a9-a638-43f7-a931-b23cda5cbfae'::uuid, 100::integer, 244::integer, 350::integer, 35::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('845c7eb2-ca6d-47b3-af5c-4e83d1e2318a'::uuid, '3b4d01a9-a638-43f7-a931-b23cda5cbfae'::uuid,
        'Наследие великанов'::text, 'GIANT_ANCESTRY'::text,
        'Вы происходите от великанов. Вы можете использовать выбранный дар количества раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('20609479-a605-4ed2-9f43-521686ec2006'::uuid, '3b4d01a9-a638-43f7-a931-b23cda5cbfae'::uuid,
        'Прыжок облака'::text, 'CLOUD_S_JAUNT'::text,
        'Бонусным действием вы магически телепортируетесь на расстояние до 30 футов в свободное пространство, которое видите.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('5bdb9a70-c931-449b-9c2d-7578fce266aa'::uuid, '3b4d01a9-a638-43f7-a931-b23cda5cbfae'::uuid,
        'Большая форма'::text, 'LARGE_FORM'::text,
        'Начиная с 5-го уровня персонажа, вы можете бонусным действием изменить свой размер на Большой, если находитесь в достаточно большом пространстве. Это превращение длится 10 минут или пока вы не завершите его (действие не требуется). В течение этого времени вы совершаете с преимуществом проверки Силы, и ваша скорость увеличивается на 10 футов. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('a6501bdb-f4dc-4391-93b4-849a028e00f2'::uuid, '3b4d01a9-a638-43f7-a931-b23cda5cbfae'::uuid,
        'Мощное телосложение'::text, 'POWERFUL_BUILD'::text,
        'Вы совершаете с преимуществом любую проверку характеристики для прекращения состояния «Схваченный». Вы также считаетесь на один размер больше при определении вашей грузоподъёмности.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('2ac69c98-42dd-41cf-bc40-95b8292b7836'::uuid,
        'Голиаф. Облачный великан'::text,
        'Ваш дар наследия позволяет мгновенно проскальзывать сквозь пространство, словно облако, переносимое ветром.'::text,
        'CLOUD_GOLIATH'::text,
        '3b4d01a9-a638-43f7-a931-b23cda5cbfae'::uuid,
        'CLOUD_GOLIATH'::varchar,
        'GOLIATH'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Огненный великан
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('0668313f-6ab2-4f81-8353-e8ba56f2add6'::uuid, 100::integer, 244::integer, 350::integer, 35::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('42ba3a43-4290-4c4d-9873-5066ab80b437'::uuid, '0668313f-6ab2-4f81-8353-e8ba56f2add6'::uuid,
        'Наследие великанов'::text, 'GIANT_ANCESTRY'::text,
        'Вы происходите от великанов. Вы можете использовать выбранный дар количества раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('7fd51252-6de9-4393-8e0c-7c08b928d4c4'::uuid, '0668313f-6ab2-4f81-8353-e8ba56f2add6'::uuid,
        'Ожог огня'::text, 'FIRE_S_BURN'::text,
        'Когда вы попадаете по цели броском атаки и наносите ей урон, вы можете также нанести этой цели 1d10 урона огнём.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('230c1fe9-b087-411b-b44b-74c931be7ec7'::uuid, '0668313f-6ab2-4f81-8353-e8ba56f2add6'::uuid,
        'Большая форма'::text, 'LARGE_FORM'::text,
        'Начиная с 5-го уровня персонажа, вы можете бонусным действием изменить свой размер на Большой, если находитесь в достаточно большом пространстве. Это превращение длится 10 минут или пока вы не завершите его (действие не требуется). В течение этого времени вы совершаете с преимуществом проверки Силы, и ваша скорость увеличивается на 10 футов. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('1df6720c-9266-420e-b3f1-fefe0be8ab2f'::uuid, '0668313f-6ab2-4f81-8353-e8ba56f2add6'::uuid,
        'Мощное телосложение'::text, 'POWERFUL_BUILD'::text,
        'Вы совершаете с преимуществом любую проверку характеристики для прекращения состояния «Схваченный». Вы также считаетесь на один размер больше при определении вашей грузоподъёмности.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('f78e4cc2-fa51-48d3-b328-5e59f27b9c3d'::uuid,
        'Голиаф. Огненный великан'::text,
        'Ваш дар наследия разжигает удар — вы можете усилить попадание вспышкой огня.'::text,
        'FIRE_GOLIATH'::text,
        '0668313f-6ab2-4f81-8353-e8ba56f2add6'::uuid,
        'FIRE_GOLIATH'::varchar,
        'GOLIATH'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Ледяной великан
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('72ebdc6d-b393-4d13-b89d-c11d19ddc7a0'::uuid, 100::integer, 244::integer, 350::integer, 35::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e6b18c5a-8e43-4561-a0ee-e93fef1d092e'::uuid, '72ebdc6d-b393-4d13-b89d-c11d19ddc7a0'::uuid,
        'Наследие великанов'::text, 'GIANT_ANCESTRY'::text,
        'Вы происходите от великанов. Вы можете использовать выбранный дар количества раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ac9827d3-6d5f-4c49-a9d2-c402d4f59339'::uuid, '72ebdc6d-b393-4d13-b89d-c11d19ddc7a0'::uuid,
        'Холод мороза'::text, 'FROST_S_CHILL'::text,
        'Когда вы попадаете по цели броском атаки и наносите ей урон, вы можете также нанести этой цели 1d6 урона холодом и уменьшить её скорость на 10 футов до начала вашего следующего хода.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2b1f50d7-3d17-439e-a84c-b65778840d47'::uuid, '72ebdc6d-b393-4d13-b89d-c11d19ddc7a0'::uuid,
        'Большая форма'::text, 'LARGE_FORM'::text,
        'Начиная с 5-го уровня персонажа, вы можете бонусным действием изменить свой размер на Большой, если находитесь в достаточно большом пространстве. Это превращение длится 10 минут или пока вы не завершите его (действие не требуется). В течение этого времени вы совершаете с преимуществом проверки Силы, и ваша скорость увеличивается на 10 футов. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('dbdf2e86-8122-498d-8d55-9ab6d882393f'::uuid, '72ebdc6d-b393-4d13-b89d-c11d19ddc7a0'::uuid,
        'Мощное телосложение'::text, 'POWERFUL_BUILD'::text,
        'Вы совершаете с преимуществом любую проверку характеристики для прекращения состояния «Схваченный». Вы также считаетесь на один размер больше при определении вашей грузоподъёмности.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('3e6c1265-2153-4729-be55-8190aca4404a'::uuid,
        'Голиаф. Ледяной великан'::text,
        'Ваш дар наследия охлаждает удар: вместе с уроном вы оставляете на цели ледяной след, замедляющий её.'::text,
        'FROST_GOLIATH'::text,
        '72ebdc6d-b393-4d13-b89d-c11d19ddc7a0'::uuid,
        'FROST_GOLIATH'::varchar,
        'GOLIATH'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Холмовой великан
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('6e4721be-f81b-45bb-8545-0acfc35a5a1e'::uuid, 100::integer, 244::integer, 350::integer, 35::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('291835e8-35e9-4ff0-a7dd-df756142e04f'::uuid, '6e4721be-f81b-45bb-8545-0acfc35a5a1e'::uuid,
        'Наследие великанов'::text, 'GIANT_ANCESTRY'::text,
        'Вы происходите от великанов. Вы можете использовать выбранный дар количества раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('7098941f-87bb-4d71-9659-9173bd02880f'::uuid, '6e4721be-f81b-45bb-8545-0acfc35a5a1e'::uuid,
        'Опрокидывание холма'::text, 'HILL_S_TUMBLE'::text,
        'Когда вы попадаете по существу размера не больше Большого броском атаки и наносите ему урон, вы можете придать этой цели состояние «Лежащий».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d2e71d64-7d10-418a-b765-aaff2bfebef8'::uuid, '6e4721be-f81b-45bb-8545-0acfc35a5a1e'::uuid,
        'Большая форма'::text, 'LARGE_FORM'::text,
        'Начиная с 5-го уровня персонажа, вы можете бонусным действием изменить свой размер на Большой, если находитесь в достаточно большом пространстве. Это превращение длится 10 минут или пока вы не завершите его (действие не требуется). В течение этого времени вы совершаете с преимуществом проверки Силы, и ваша скорость увеличивается на 10 футов. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('bc1be203-e9bb-4878-b637-1ab21ebbcfb6'::uuid, '6e4721be-f81b-45bb-8545-0acfc35a5a1e'::uuid,
        'Мощное телосложение'::text, 'POWERFUL_BUILD'::text,
        'Вы совершаете с преимуществом любую проверку характеристики для прекращения состояния «Схваченный». Вы также считаетесь на один размер больше при определении вашей грузоподъёмности.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('b6a3c330-9d68-43c8-846b-b69e7885b6e9'::uuid,
        'Голиаф. Холмовой великан'::text,
        'Ваш дар наследия позволяет валить противников с ног ударом, сбивая их равновесие.'::text,
        'HILL_GOLIATH'::text,
        '6e4721be-f81b-45bb-8545-0acfc35a5a1e'::uuid,
        'HILL_GOLIATH'::varchar,
        'GOLIATH'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Каменный великан
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('eecaf0f8-8cc0-4979-9a8a-b6e778a04a97'::uuid, 100::integer, 244::integer, 350::integer, 35::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ef6c5729-f815-48cb-83b2-65ba88c6632b'::uuid, 'eecaf0f8-8cc0-4979-9a8a-b6e778a04a97'::uuid,
        'Наследие великанов'::text, 'GIANT_ANCESTRY'::text,
        'Вы происходите от великанов. Вы можете использовать выбранный дар количества раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('5b7e7672-4196-430d-93f6-d39d7e31e859'::uuid, 'eecaf0f8-8cc0-4979-9a8a-b6e778a04a97'::uuid,
        'Стойкость камня'::text, 'STONE_S_ENDURANCE'::text,
        'Когда вы получаете урон, вы можете реакцией бросить 1d12. Добавьте ваш модификатор Телосложения к выпавшему числу и уменьшите урон на это значение.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('16a7a4da-9dbb-466d-94e7-6ca78cae016b'::uuid, 'eecaf0f8-8cc0-4979-9a8a-b6e778a04a97'::uuid,
        'Большая форма'::text, 'LARGE_FORM'::text,
        'Начиная с 5-го уровня персонажа, вы можете бонусным действием изменить свой размер на Большой, если находитесь в достаточно большом пространстве. Это превращение длится 10 минут или пока вы не завершите его (действие не требуется). В течение этого времени вы совершаете с преимуществом проверки Силы, и ваша скорость увеличивается на 10 футов. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('be379e83-cfe7-4183-a904-7e66a6d4e4a8'::uuid, 'eecaf0f8-8cc0-4979-9a8a-b6e778a04a97'::uuid,
        'Мощное телосложение'::text, 'POWERFUL_BUILD'::text,
        'Вы совершаете с преимуществом любую проверку характеристики для прекращения состояния «Схваченный». Вы также считаетесь на один размер больше при определении вашей грузоподъёмности.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('e64602d2-0be6-4572-969e-c3383e898c54'::uuid,
        'Голиаф. Каменный великан'::text,
        'Ваш дар наследия помогает переживать удары, словно вы сделаны из камня: вы можете снизить получаемый урон реакцией.'::text,
        'STONE_GOLIATH'::text,
        'eecaf0f8-8cc0-4979-9a8a-b6e778a04a97'::uuid,
        'STONE_GOLIATH'::varchar,
        'GOLIATH'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Штормовой великан
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('f0f0057e-8c1e-4955-bc4e-f765dab55dce'::uuid, 100::integer, 244::integer, 350::integer, 35::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('096cf91f-d40e-4116-a0e4-979bd3df1676'::uuid, 'f0f0057e-8c1e-4955-bc4e-f765dab55dce'::uuid,
        'Наследие великанов'::text, 'GIANT_ANCESTRY'::text,
        'Вы происходите от великанов. Вы можете использовать выбранный дар количества раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('6fbe2c0d-6ab9-4d0e-b277-fdf0751b3006'::uuid, 'f0f0057e-8c1e-4955-bc4e-f765dab55dce'::uuid,
        'Гром бури'::text, 'STORM_S_THUNDER'::text,
        'Когда вы получаете урон от существа в пределах 60 футов от вас, вы можете реакцией нанести этому существу 1d8 урона громом.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('623184f1-3f54-4479-8883-f524e25c5ab2'::uuid, 'f0f0057e-8c1e-4955-bc4e-f765dab55dce'::uuid,
        'Большая форма'::text, 'LARGE_FORM'::text,
        'Начиная с 5-го уровня персонажа, вы можете бонусным действием изменить свой размер на Большой, если находитесь в достаточно большом пространстве. Это превращение длится 10 минут или пока вы не завершите его (действие не требуется). В течение этого времени вы совершаете с преимуществом проверки Силы, и ваша скорость увеличивается на 10 футов. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cf39aa79-82bb-40a1-aa40-5b52be00e016'::uuid, 'f0f0057e-8c1e-4955-bc4e-f765dab55dce'::uuid,
        'Мощное телосложение'::text, 'POWERFUL_BUILD'::text,
        'Вы совершаете с преимуществом любую проверку характеристики для прекращения состояния «Схваченный». Вы также считаетесь на один размер больше при определении вашей грузоподъёмности.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('cd29c861-8398-4157-a481-957b7b7e456e'::uuid,
        'Голиаф. Штормовой великан'::text,
        'Ваш дар наследия отвечает ударом на удар: когда вас ранят, вы можете вернуть часть боли врагу громовым разрядом.'::text,
        'STORM_GOLIATH'::text,
        'f0f0057e-8c1e-4955-bc4e-f765dab55dce'::uuid,
        'STORM_GOLIATH'::varchar,
        'GOLIATH'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Полурослик (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('07cc5fc9-4c02-4071-afa5-3d3add3a2ad1'::uuid, 150::integer, 91::integer, 40::integer, 30::integer,
        '[{"code": "DEX", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('95c66586-c90a-4404-9d65-a97926806285'::uuid, '07cc5fc9-4c02-4071-afa5-3d3add3a2ad1'::uuid,
        'Храбрость'::text, 'BRAVE'::text,
        'Вы совершаете с преимуществом спасброски, чтобы избежать или прекратить состояние «Испуганный».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c6c8770e-f31c-4cce-adcf-074e577a9824'::uuid, '07cc5fc9-4c02-4071-afa5-3d3add3a2ad1'::uuid,
        'Проворство полурослика'::text, 'HALFLING_NIMBLENESS'::text,
        'Вы можете перемещаться сквозь пространство любого существа, размер которого больше вашего, но не можете останавливаться в том же пространстве.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('af04a63f-fca4-4c74-b93f-8af697c242ba'::uuid, '07cc5fc9-4c02-4071-afa5-3d3add3a2ad1'::uuid,
        'Удача'::text, 'LUCK'::text,
        'Когда вы выбрасываете 1 на d20 при проверке d20, вы можете перебросить кость и должны использовать новый результат.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d12d9706-b14e-456e-a81f-84c4fbb3f6c7'::uuid, '07cc5fc9-4c02-4071-afa5-3d3add3a2ad1'::uuid,
        'Природная скрытность'::text, 'NATURALLY_STEALTHY'::text,
        'Вы можете совершить действие Скрыться, даже если вас заслоняет только существо, размер которого как минимум на один больше вашего.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('02dd9c41-ff64-4d47-a0d0-7f1d497cce70'::uuid,
        'Полурослик'::text,
        'Полурослики — маленький, ловкий и необычайно стойкий народ. Их удача и смелость помогают им выживать там, где более крупные народы теряются или отступают.'::text,
        'HALFLING'::text,
        '07cc5fc9-4c02-4071-afa5-3d3add3a2ad1'::uuid,
        'HALFLING'::varchar,
        'HALFLING'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Человек (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('6cf5c4ba-d1ff-410c-ace4-64f846ae0868'::uuid, 120::integer, 213::integer, 200::integer, 30::integer,
        '[{"code": "ANY", "value": 1}, {"code": "ANY", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('02fdb878-8422-42cf-83a4-e2da4e3f052c'::uuid, '6cf5c4ba-d1ff-410c-ace4-64f846ae0868'::uuid,
        'Находчивость'::text, 'RESOURCEFUL'::text,
        'Вы получаете героическое вдохновение каждый раз, когда завершаете продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('86a70bca-e82b-4e6e-9c95-308a8346d7e2'::uuid, '6cf5c4ba-d1ff-410c-ace4-64f846ae0868'::uuid,
        'Умелость'::text, 'SKILLFUL'::text,
        'Вы получаете владение одним навыком на ваш выбор.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2fdf6797-7c59-4941-bcf9-4a174321a3ab'::uuid, '6cf5c4ba-d1ff-410c-ace4-64f846ae0868'::uuid,
        'Универсальность'::text, 'VERSATILE'::text,
        'Вы получаете одну черту происхождения на ваш выбор (см. «Черты»). Рекомендуется черта «Мастер на все руки».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('43bcff1e-c28d-48eb-87b5-a26bfe6bcce5'::uuid,
        'Человек'::text,
        'Люди отличаются гибкостью и стремлением к росту. Их сильная сторона — умение быстро адаптироваться, осваивать навыки и извлекать максимум из любых возможностей.'::text,
        'HUMAN'::text,
        '6cf5c4ba-d1ff-410c-ace4-64f846ae0868'::uuid,
        'HUMAN'::varchar,
        'HUMAN'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Орк (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('1ba6ada1-9803-432a-9080-e56faf798d14'::uuid, 90::integer, 213::integer, 180::integer, 30::integer,
        '[{"code": "STR", "value": 2}, {"code": "CON", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('94953951-17ad-4574-8bf6-f4fc42f15aa8'::uuid, '1ba6ada1-9803-432a-9080-e56faf798d14'::uuid,
        'Выброс адреналина'::text, 'ADRENALINE_RUSH'::text,
        'Вы можете совершить действие Рывок как бонусное действие. Когда вы делаете это, вы получаете количество временных хитов, равное вашему бонусу мастерства.

Вы можете использовать эту черту количество раз, равное вашему бонусу мастерства, и восстанавливаете все использования после завершения короткого или продолжительного отдыха.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ca3ded30-2641-429c-94fc-7fbafe231527'::uuid, '1ba6ada1-9803-432a-9080-e56faf798d14'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text,
        'Вы обладаете тёмным зрением в радиусе 120 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('bbc1f693-de76-4a54-b6b3-944424fb072e'::uuid, '1ba6ada1-9803-432a-9080-e56faf798d14'::uuid,
        'Неукротимая выносливость'::text, 'RELENTLESS_ENDURANCE'::text,
        'Когда ваши хиты уменьшаются до 0, но вы не погибаете мгновенно, вы можете вместо этого уменьшить хиты до 1. Использовав эту черту, вы не можете использовать её снова, пока не завершите продолжительный отдых.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('e9d7d00c-98ec-4309-9dd8-3c7ad1878d67'::uuid,
        'Орк'::text,
        'Орки выносливы и стремительны в бою: они умеют рваться вперёд с всплеском адреналина, видят в темноте и нередко выживают там, где другие падают.'::text,
        'ORC'::text,
        '1ba6ada1-9803-432a-9080-e56faf798d14'::uuid,
        'ORC'::varchar,
        'ORC'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Тифлинг (root)
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('1362d573-f9ca-4b5f-a103-7a7c70994f3b'::uuid, 120::integer, 213::integer, 150::integer, 30::integer,
        '[{"code": "CHA", "value": 2}, {"code": "ANY", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e9dea00e-c568-43c7-80cf-45b5449ef7e4'::uuid, '1362d573-f9ca-4b5f-a103-7a7c70994f3b'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('0368d26e-cbb1-4767-80ff-e9993a8d506e'::uuid, '1362d573-f9ca-4b5f-a103-7a7c70994f3b'::uuid,
        'Потустороннее присутствие'::text, 'OTHERWORLDLY_PRESENCE'::text,
        'Вы знаете заговор Тауматургия. Когда вы сотворяете его с помощью этой черты, заклинание использует ту же заклинательную характеристику, что и ваша черта «Наследие исчадий».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('3845eaf0-602e-4a6c-aa33-fe55ee44ae10'::uuid,
        'Тифлинг'::text,
        'Тифлинги несут в крови следы Нижних планов. В зависимости от вида наследия их магия и стойкость проявляются по-разному.'::text,
        'TIEFLING'::text,
        '1362d573-f9ca-4b5f-a103-7a7c70994f3b'::uuid,
        'TIEFLING'::varchar,
        'TIEFLING'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Тифлинг Бездны
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('0c9183c1-186f-46ce-9334-e5a1a5770df4'::uuid, 120::integer, 213::integer, 150::integer, 30::integer,
        '[{"code": "CHA", "value": 2}, {"code": "ANY", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ac0bf6e0-c3f6-48f7-b9a1-760633b2bbcf'::uuid, '0c9183c1-186f-46ce-9334-e5a1a5770df4'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('694d58ab-2cb7-4976-ba0e-aeca7eeefcc2'::uuid, '0c9183c1-186f-46ce-9334-e5a1a5770df4'::uuid,
        'Потустороннее присутствие'::text, 'OTHERWORLDLY_PRESENCE'::text,
        'Вы знаете заговор Тауматургия. Когда вы сотворяете его с помощью этой черты, заклинание использует ту же заклинательную характеристику, что и ваша черта «Наследие исчадий».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ced313c4-982c-4091-bd85-1665f63b9391'::uuid, '0c9183c1-186f-46ce-9334-e5a1a5770df4'::uuid,
        'Наследие бездны'::text, 'FIENDISH_LEGACY_ABYSSAL'::text,
        'На 1 уровне вы обладаете сопротивлением к урону ядом и знаете заговор «Ядовитые брызги». На 3 уровне вы изучаете «Луч болезни», на 5 уровне — «Удержание личности». Эти заклинания всегда считаются для вас подготовленными. Вы можете сотворить каждое из них один раз без траты ячейки заклинаний и восстанавливаете эту возможность после завершения продолжительного отдыха. Вы также можете сотворять их, используя любые имеющиеся у вас ячейки заклинаний соответствующего уровня.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('7216c338-ef1e-4792-bcf3-1869774ca4f0'::uuid,
        'Тифлинг Бездны'::text,
        'Наследие Бездны наделяет тифлинга ядовитой магией и соответствующей устойчивостью.'::text,
        'TIEFLING_ABYSSAL'::text,
        '0c9183c1-186f-46ce-9334-e5a1a5770df4'::uuid,
        'TIEFLING_ABYSSAL'::varchar,
        'TIEFLING'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Хтонический тифлинг
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('a5a6a11c-3c71-4e5e-a334-75626c1049e1'::uuid, 120::integer, 213::integer, 150::integer, 30::integer,
        '[{"code": "CHA", "value": 2}, {"code": "ANY", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('43222b76-82fd-4ca2-b5e6-6b372b45e608'::uuid, 'a5a6a11c-3c71-4e5e-a334-75626c1049e1'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('63fdab1f-6c43-4137-bc36-b2a3ecd9d8d4'::uuid, 'a5a6a11c-3c71-4e5e-a334-75626c1049e1'::uuid,
        'Потустороннее присутствие'::text, 'OTHERWORLDLY_PRESENCE'::text,
        'Вы знаете заговор Тауматургия. Когда вы сотворяете его с помощью этой черты, заклинание использует ту же заклинательную характеристику, что и ваша черта «Наследие исчадий».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cccdba7d-28ef-46fd-a10d-8f3ea351d03c'::uuid, 'a5a6a11c-3c71-4e5e-a334-75626c1049e1'::uuid,
        'Хтоническое наследие'::text, 'FIENDISH_LEGACY_CHTHONIC'::text,
        'На 1 уровне вы обладаете сопротивлением к некротическому урону и знаете заговор «Леденящее прикосновение». На 3 уровне вы изучаете «Притворная смерть», на 5 уровне — «Луч ослабления». Эти заклинания всегда считаются для вас подготовленными. Вы можете сотворить каждое из них один раз без траты ячейки заклинаний и восстанавливаете эту возможность после завершения продолжительного отдыха. Вы также можете сотворять их, используя любые имеющиеся у вас ячейки заклинаний соответствующего уровня.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('3877e1db-7c5b-4e1e-a8b3-b56e0fc59982'::uuid,
        'Хтонический тифлинг'::text,
        'Хтоническое наследие связывает тифлинга с мраком и некротической магией.'::text,
        'TIEFLING_CHTHONIC'::text,
        'a5a6a11c-3c71-4e5e-a334-75626c1049e1'::uuid,
        'TIEFLING_CHTHONIC'::varchar,
        'TIEFLING'::varchar)
ON CONFLICT (id) DO NOTHING;

-- Инфернальный тифлинг
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('94633b82-b989-4170-bbae-24ae08077af0'::uuid, 120::integer, 213::integer, 150::integer, 30::integer,
        '[{"code": "CHA", "value": 2}, {"code": "ANY", "value": 1}]'::jsonb)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('4a27e285-d060-4608-8a64-f3e4577b1272'::uuid, '94633b82-b989-4170-bbae-24ae08077af0'::uuid,
        'Тёмное зрение'::text, 'DARKVISION'::text, 'Вы обладаете тёмным зрением в радиусе 60 футов.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('def00e09-7705-4ea3-9413-e6db37d04b63'::uuid, '94633b82-b989-4170-bbae-24ae08077af0'::uuid,
        'Потустороннее присутствие'::text, 'OTHERWORLDLY_PRESENCE'::text,
        'Вы знаете заговор Тауматургия. Когда вы сотворяете его с помощью этой черты, заклинание использует ту же заклинательную характеристику, что и ваша черта «Наследие исчадий».'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('424595c0-d5ed-406a-a2ae-52ce407ae7fc'::uuid, '94633b82-b989-4170-bbae-24ae08077af0'::uuid,
        'Инфернальное наследие'::text, 'FIENDISH_LEGACY_INFERNAL'::text,
        'На 1 уровне вы обладаете сопротивлением к урону огнём и знаете заговор «Огненный снаряд». На 3 уровне вы изучаете «Адское возмездие», на 5 уровне — «Тьма». Эти заклинания всегда считаются для вас подготовленными. Вы можете сотворить каждое из них один раз без траты ячейки заклинаний и восстанавливаете эту возможность после завершения продолжительного отдыха. Вы также можете сотворять их, используя любые имеющиеся у вас ячейки заклинаний соответствующего уровня.'::text)
ON CONFLICT (id) DO NOTHING;

INSERT INTO rules.srd_2024_race (id, "name", description, code, race_stats_id, img_url, species_code)
VALUES ('9aab668b-b0b2-4556-ac19-41ef25f96f1a'::uuid,
        'Инфернальный тифлинг'::text,
        'Инфернальное наследие даёт тифлингу огненную магию и стойкость перед пламенем.'::text,
        'TIEFLING_INFERNAL'::text,
        '94633b82-b989-4170-bbae-24ae08077af0'::uuid,
        'TIEFLING_INFERNAL'::varchar,
        'TIEFLING'::varchar)
ON CONFLICT (id) DO NOTHING;


