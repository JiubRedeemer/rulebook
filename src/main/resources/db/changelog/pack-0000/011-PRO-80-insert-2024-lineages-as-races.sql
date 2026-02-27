/* DND2024: ?????????? ???????? (lineages) ??? ????????? ??? (???????? https://new.ttg.club/species, 2026-02-26) */

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '306ecdb7-bb5f-577e-b0b9-00ba79932212'::uuid, 'Лесной гном'::text, 'Вы знаете заговор Малая иллюзия [Minor Illusion]. Вы также всегда имеете подготовленное заклинание Разговор с животными [Speak with Animals]. Вы можете накладывать его без траты ячейки заклинаний количество раз, равное вашему бонусу мастерства, и восстанавливаете все использованные применения после завершения продолжительного отдыха. Вы также можете использовать любые ячейки заклинаний, чтобы накладывать это заклинание.'::text, 'FOREST_GNOME_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f103'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'FOREST_GNOME_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '7de0836a-e373-5616-ad17-cda5bacc4711'::uuid, 'Скальный гном'::text, 'Вы знаете заговоры Починка [Mending] и Фокусы [Prestidigitation]. Кроме того, вы можете потратить 10 минут на наложение заговора Фокусы [Prestidigitation], чтобы создать крошечное механическое устройство (КД 5, 1 хит), такое как игрушка, зажигалка или музыкальная шкатулка. При создании устройства вы определяете его функцию, выбирая один из эффектов заговора Фокусы [Prestidigitation]; устройство производит этот эффект каждый раз, когда вы или другое существо выполняет бонусное действие, чтобы активировать его касанием. Если выбранный эффект имеет опции, то вы выбираете 1 из них для устройства при его создании. Например, если вы выбрали эффект зажигания-угасания, то вы определяете, будет ли устройство зажигать или тушить огонь; устройство не может делать и то, и другое. Вы можете иметь до 3 таких устройств одновременно, и каждое из них разваливается через 8 часов после создания или когда вы разбираете его прикосновением с помощью действия использование.'::text, 'ROCK_GNOME_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f103'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'ROCK_GNOME_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '3439c6e4-621f-5103-b86a-321c0c55cddd'::uuid, 'Голиаф. Штормовой гром (Штормовой великан)'::text, 'Когда вы получаете урон от существа, находящегося в пределах 60 фт. от вас, вы можете использовать реакцию, чтобы нанести этому существу 1к8 урона звуком.'::text, 'STORM_S_THUNDER_STORM_GIANT_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'STORM_S_THUNDER_STORM_GIANT_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '499e1d48-f4a0-56e9-8a15-b28bf4e9eee6'::uuid, 'Голиаф. Огненный ожог (Огненный Великан)'::text, 'Когда вы попадаете по цели броском атаки и наносите ей урон, то вы можете дополнительно нанести этой цели 1к10 урона огнём.'::text, 'FIRE_S_BURN_FIRE_GIANT_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'FIRE_S_BURN_FIRE_GIANT_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT 'dbe24cfe-8c63-5a1a-b170-c7de953451bd'::uuid, 'Голиаф. Облачный шаг (Облачный Великан)'::text, 'Бонусным действием вы можете магически телепортироваться на расстояние до 30 фт. в незанятое пространство, которое вы видите.'::text, 'CLOUD_S_JAUNT_CLOUD_GIANT_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'CLOUD_S_JAUNT_CLOUD_GIANT_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '7876e511-7d74-5170-a25a-636f62a1b45a'::uuid, 'Голиаф. Холмовой толчок (Холмовой Великан)'::text, 'Когда вы попадаете по существу размера большой или меньше броском атаки и наносите ему урон, вы можете наложить на эту цель состояние лежащий ничком.'::text, 'HILL_S_TUMBLE_HILL_GIANT_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'HILL_S_TUMBLE_HILL_GIANT_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '9ccf06f1-369d-543b-9f61-4a71d8999465'::uuid, 'Голиаф. Выносливость камня (Каменный Великан)'::text, 'Когда вы получаете урон, вы можете использовать свою реакцию, чтобы бросить 1к12. Добавьте ваш модификатор Телосложения к выпавшему числу и уменьшите полученный урон на результат.'::text, 'STONE_S_ENDURANCE_STONE_GIANT_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'STONE_S_ENDURANCE_STONE_GIANT_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT 'e2dd9157-16f5-5c22-aa38-97e69188a2cb'::uuid, 'Голиаф. Морозный холод (Ледяной Великан)'::text, 'Когда вы попадаете по цели броском атаки и наносите ей урон, то вы можете дополнительно нанести этой цели 1к6 урона холодом и снизить её скорость на 10 футов до начала вашего следующего хода.'::text, 'FROST_S_CHILL_FROST_GIANT_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f104'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'FROST_S_CHILL_FROST_GIANT_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT 'eeeae3eb-8ff2-5186-91e1-49b9a0227b5d'::uuid, 'Инфернальный тифлинг'::text, 'Инфернальное наследие связывает тифлингов не только с Геенной, но и с Девятью преисподними и яростными полями битв Ахерона. Рога, шипы, хвосты, золотые глаза и слабый запах серы или дыма — обычные физические черты таких тифлингов, большинство из которых ведут своё происхождение от дьяволов.
Уровень 1: У вас есть сопротивление к урону огнём. Вы также знаете заговор Огненный снаряд [Fire Bolt].
Уровень 3: Адское возмездие [Hellish Rebuke]
Уровень 5: Тьма [Darkness]'::text, 'TIEFLING_INFERNAL_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f110'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'TIEFLING_INFERNAL_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT 'de17038c-063e-5c77-94f1-54799a1e657f'::uuid, 'Хтонический тифлинг'::text, 'Тифлинги с хтоническим наследием ощущают не только притяжение Карцери, но и жадность Геенны и мрак Аида. Некоторые из этих тифлингов выглядят как живые мертвецы. Другие обладают неземной красотой суккуба или имеют физические черты, общие с ночной каргой, юголотом или другим зловещим существом с Нейтрально-Злым происхождением.
Уровень 1: У вас есть сопротивление к урону некротической энергией. Вы также знаете заговор Леденящее прикосновение [Chill Touch].
Уровень 3: Псевдожизнь [False Life]
Уровень 5: Луч слабости [Ray of Enfeeblement]'::text, 'TIEFLING_CHTHONIC_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f110'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'TIEFLING_CHTHONIC_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '43ac7e4b-0dc6-5da0-b116-0b3a9de21f2a'::uuid, 'Тифлинг Бездны'::text, 'Энтропия Бездны, хаос Пандемониума и отчаяние Карцери влекут тифлингов, у которых есть наследие Бездны. Рога, шерсть, клыки и необычные запахи — обычные физические черты таких тифлингов, большинство из которых имеют в своих жилах кровь демонов.
Уровень 1: У вас есть сопротивление к урону ядом. Вы также знаете заговор Ядовитые брызги [Poison Spray].
Уровень 3: Луч болезни [Ray of Sickness]
Уровень 5: Удержание личности [Hold Person]'::text, 'TIEFLING_ABYSSAL_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f110'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'TIEFLING_ABYSSAL_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT 'ede6de29-f5e2-5c93-ba8e-0dd550b827a1'::uuid, 'Эльф (PHB). Высший эльф'::text, 'Высшие эльфы пропитаны магией пересечения между Страной фей и Материальным планом. В некоторых мирах высшие эльфы называют себя другими именами. Например, в сеттинге Забытых Королевств они называют себя солнечными или лунными эльфами, в сеттинге Саги о Копье — Сильванести и Квалинести, а в сеттинге Эберрон — Аэрени.
Уровень 1: Вы знаете заговор Фокусы [Prestidigitation]. Когда вы завершаете продолжительный отдых, вы можете заменить этот заговор на другой из списка заклинаний волшебника.
Уровень 3: Обнаружение магии [Detect Magic]
Уровень 5: Туманный шаг [Misty Step]'::text, 'HIGH_ELF_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f117'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'HIGH_ELF_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '9e89f0e3-1f18-5fbf-90b1-c9c100fcd105'::uuid, 'Эльф (PHB). Лесной эльф'::text, 'Лесные эльфы несут в себе магию первобытных лесов. Они известны под многими другими именами: дикие эльфы, зелёные эльфы и лесные эльфы. Гругачи — это скрытные лесные эльфы сеттинга Грейхок, а Кагонести и Терннадал — лесные эльфы сеттингов Сага о Копье и Эберрон соответственно.
Уровень 1: Ваша скорость увеличивается до 35 фт. Вы также знаете заговор Искусство друидов [Druidcraft].
Уровень 3: Скороход [Longstrider]
Уровень 5: Бесследное передвижение [Pass without Trace]'::text, 'WOOD_ELF_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f117'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'WOOD_ELF_PHB'::text
);

INSERT INTO rules.default_2024_race (id, name, description, code, race_stats_id)
SELECT '00d9e5d8-1c8b-502d-aff9-cedb31cfa36a'::uuid, 'Эльф (PHB). Дроу'::text, 'Дроу обычно обитают в Подземье и были им изменены. Некоторые дроу, как отдельные индивиды, так и целые сообщества, избегают Подземья, но всё же сохраняют его магию. Например, в сеттинге Эберрон дроу живут в тропических лесах и циклопических руинах на континенте Ксен’дрик.
Уровень 1: Дальность вашего тёмного зрения увеличивается до 120 фт. Вы также знаете заговор Пляшущие огоньки [Dancing Lights].
Уровень 3: Огонь фей [Faerie Fire]
Уровень 5: Тьма [Darkness]'::text, 'ELF_DROW_PHB'::text, '7c89c2a1-4d5d-4a8b-8c87-1a73b2d2f117'::uuid
WHERE NOT EXISTS (
    SELECT 1 FROM rules.default_2024_race WHERE code = 'ELF_DROW_PHB'::text
);
