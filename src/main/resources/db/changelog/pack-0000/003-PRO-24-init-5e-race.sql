/* Лесной гном */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('f72162d9-aa65-4297-a451-d70f7e3aeb53'::uuid, 500::integer, 150::integer, 50::integer, 25::integer,
        '[{"code": "DEX", "value": 1},{"code": "INT", "value": 2}]'::jsonb);

/* Скальный гном */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('df0ee778-2f0a-4bcb-9963-1ebe4c224c82'::uuid, 500::integer, 150::integer, 50::integer, 25::integer,
        '[{"code": "CON", "value": 1},{"code": "INT", "value": 2}]'::jsonb);

/* Горный дварф */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 500::integer, 179::integer, 150::integer, 25::integer,
        '[{"code": "CON", "value": 2},{"code": "STR", "value": 2}]'::jsonb);

/* Холмовой дварф */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 500::integer, 179::integer, 150::integer, 25::integer,
        '[{"code": "CON", "value": 2},{"code": "WIS", "value": 1}]'::jsonb);

/* Драконорождённый */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('92081e53-21ff-4a58-8c4f-23e97feeea9a'::uuid, 100::integer, 270::integer, 200::integer, 30::integer,
        '[{"code": "STR", "value": 2},{"code": "CHA", "value": 1}]'::jsonb);

/* Полуорк */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('50afafa1-6a73-4bf9-b1b3-b856ac2f83b0'::uuid, 100::integer, 270::integer, 150::integer, 30::integer,
        '[{"code": "STR", "value": 2},{"code": "CON", "value": 1}]'::jsonb);

/* Коренасный полурослик */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('cacb27fc-f2e2-4b16-8950-3310076e93a4'::uuid, 150::integer, 120::integer, 30::integer, 25::integer,
        '[{"code": "DEX", "value": 2},{"code": "CON", "value": 1}]'::jsonb);

/* Легконогий полурослик */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('6891e13f-f6ff-479f-9c11-4116fa756639'::uuid, 150::integer, 120::integer, 30::integer, 25::integer,
        '[{"code": "DEX", "value": 2},{"code": "CHA", "value": 1}]'::jsonb);

/* Полуэльф */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('b081c94d-b18f-4a85-b856-65c8781502e2'::uuid, 250::integer, 200::integer, 150::integer, 30::integer,
        '[{"code": "ANY", "value": 1, "count": 2}, {"code": "CHA", "value": 2}]'::jsonb);

/* Тифлинг */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('f9636fb2-81a8-4dad-bb2a-97313333fab1'::uuid, 150::integer, 200::integer, 150::integer, 30::integer,
        '[{"code": "INT", "value": 1}, {"code": "CHA", "value": 2}]'::jsonb);

/* Человек */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('f3b6e124-b9bb-4607-9248-df35850908b2'::uuid, 150::integer, 200::integer, 150::integer, 30::integer,
        '[{"code": "ALL", "value": 1}]'::jsonb);

/* Высший Эльф */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 1000::integer, 200::integer, 100::integer, 30::integer,
        '[{"code": "DEX", "value": 2}, {"code": "INT", "value": 1}]'::jsonb);

/* Лесной Эльф */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 1000::integer, 200::integer, 100::integer, 30::integer,
        '[{"code": "DEX", "value": 2}, {"code": "WIS", "value": 1}]'::jsonb);

/* Темный Эльф (Дроу) */
INSERT INTO rules.race_stats (id, max_age, max_height, max_weight, base_speed, ability_modifiers)
VALUES ('d45171da-8765-473c-ad90-4004b6f6462a'::uuid, 1000::integer, 200::integer, 100::integer, 30::integer,
        '[{"code": "DEX", "value": 2}, {"code": "CHA", "value": 1}]'::jsonb);




/* Лесной гном */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('54a56978-32fc-48d5-92be-26ab25d6a8a6'::uuid, 'Лесной гном'::text, 'Лесные гномы обладают природными способностями к иллюзии, и унаследовали проворство и скрытность. В мирах D&D лесные гномы встречаются редко, и являются скрытным народом. Они собираются в спрятанные в глубинах лесов общины, и используют иллюзию и обман, чтобы укрыться от опасности или скрыть свой побег в случае обнаружения. Лесные гномы обычно дружелюбны с другими добрыми лесными народами, и считают эльфов и добрых фей своими главными союзниками. Эти гномы также дружат с мелкими лесными зверушками, которые предупреждают их об опасности.'::text, 'FOREST_GNOME'::text, 'f72162d9-aa65-4297-a451-d70f7e3aeb53'::uuid);

/* Скальный гном */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('89324be0-1d46-49dc-a065-44814984b52e'::uuid, 'Скальный гном'::text, 'Скальные гномы выделяются своей изобретательностью и стойкостью. Большинство гномов в мирах D&D являются скальными, включая гномов-ремесленников из мира Саги о Копье.'::text, 'ROCK_GNOME'::text, 'df0ee778-2f0a-4bcb-9963-1ebe4c224c82'::uuid);

/* Горный дварф */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('7fbe4c1b-5e40-4ee7-bfbe-a8b4bced248a'::uuid, 'Горный дварф'::text, 'Полные древнего величия королевства и вырезанные в толще гор чертоги, удары кирок и молотков, раздающиеся в глубоких шахтах и пылающий кузнечный горн, верность клану и традициям и пылающая ненависть к гоблинам и оркам — вот вещи, объединяющие всех дварфов.'::text, 'MOUNTAIN_DWARF'::text, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid);

/* Холмовой дварф */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('395cf2b0-0c01-4273-917a-5b302ba2bb5f'::uuid, 'Холмовой дварф'::text, 'Полные древнего величия королевства и вырезанные в толще гор чертоги, удары кирок и молотков, раздающиеся в глубоких шахтах и пылающий кузнечный горн, верность клану и традициям и пылающая ненависть к гоблинам и оркам — вот вещи, объединяющие всех дварфов.'::text, 'HILL_DWARF'::text, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid);

/* Драконорождённый */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('032c604e-4401-48a0-99c8-b6bdbfec7d4e'::uuid, 'Драконорождённый'::text, 'Рождённые драконами, о чём говорит их название, драконорождённые идут гордо подняв голову по миру, который встречает их со страхом и непониманием. Сформированные драконьими богами или самими драконами, драконорождённые первоначально вылупились из драконьих яиц как новая раса, сочетающая в себе лучшие качества драконов и гуманоидов. Некоторые драконорождённые являются верными слугами истинных драконов, другие образуют ряды солдат в великих войнах, а некоторые ищут свою судьбу, не найдя себе призвания.'::text, 'DRAGONBORN'::text, '92081e53-21ff-4a58-8c4f-23e97feeea9a'::uuid);

/* Полуорк */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('ac6bd762-a46a-4183-b870-f1ac2f7d36db'::uuid, 'Полуорк'::text, 'Находясь ли под предводительством могучего колдуна, или стараясь установить мир после многолетнего конфликта, орки и племена людей иногда заключали союзы, объединяя силы в огромные орды, терроризирующие более цивилизованные государства по соседству. Когда такие союзы скреплялись узами брака, появлялись полуорки.'::text, 'HALF_ORC'::text, '50afafa1-6a73-4bf9-b1b3-b856ac2f83b0'::uuid);

/* Коренастый полурослик */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('4ae31853-fa00-48ad-9feb-357f632aca6d'::uuid, 'Коренастый полурослик'::text, 'Коренастые полурослики выносливее других и обладают некоторой устойчивостью к ядам. Поговаривают, что в их жилах течёт толика дварфской крови. В мире Забытых Королевств таких полуросликов зовут сильными сердцем, и чаще всего они встречаются на юге.'::text, 'STOUT_HALFLING'::text, 'cacb27fc-f2e2-4b16-8950-3310076e93a4'::uuid);

/* Легконогий полурослик */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('2a40cd63-b4d0-4753-90e6-170f0a2c5f2f'::uuid, 'Легконогий полурослик'::text, 'Легконогие полурослики умеют отлично скрываться, в том числе используя других существ как укрытие. Они приветливы и хорошо ладят с другими. В мире Забытых Королевств легконогие являются самой распространённой ветвью полуросликов. Легконогие более других склонны к перемене мест, и часто селятся по соседству с другими народами, или ведут кочевую жизнь. В мире Серого Ястреба таких полуросликов называют мохноногими или великанчиками.'::text, 'LIGHTFOOT_HALFLING'::text, '6891e13f-f6ff-479f-9c11-4116fa756639'::uuid);

/* Полуэльф */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('ddd6378c-2240-4af6-91cc-01bf5533da12'::uuid, 'Полуэльф'::text, 'Бродящие по двум мирам, но в действительности, не принадлежащие ни одному из них. Полуэльфы сочетают в себе, как некоторые говорят, лучшие качества обеих рас: человеческие любознательность, изобретательность и амбиции, приправленные изысканными чувствами, любовью к природе и ощущением прекрасного, свойственными эльфам.'::text, 'HALF_ELF'::text, 'b081c94d-b18f-4a85-b856-65c8781502e2'::uuid);

/* Тифлинг */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('e92be7ea-5f5a-47d4-beb4-f35999b25f26'::uuid, 'Тифлинг'::text, 'Быть тифлингом — значит постоянно натыкаться на пристальные взгляды и перешёптывания, терпеть страдания и оскорбления, видеть страх и недоверие в глазах каждого встречного. Беда в том, что тифлинги знают причину этого — договор, заключённый много поколений назад и позволивший Асмодею — владыке Девяти Преисподних — внести вклад в их родословную'::text, 'TIEFLING'::text, 'f9636fb2-81a8-4dad-bb2a-97313333fab1'::uuid);

/* Человек */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('969330b5-9dfa-4e44-b19d-fc5e9c21b285'::uuid, 'Человек'::text, 'В большинстве миров люди — это самая молодая из распространённых рас. Они поздно вышли на мировую сцену и живут намного меньше, чем дварфы, эльфы и драконы. Возможно, именно краткость их жизней заставляет их стремиться достигнуть как можно большего в отведённый им срок. А быть может, они хотят что-то доказать старшим расам, и поэтому создают могучие империи, основанные на завоеваниях и торговле.'::text, 'HUMAN'::text, 'f3b6e124-b9bb-4607-9248-df35850908b2'::uuid);

/* Высший эльф */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('665584cf-fa27-49da-9fed-9f10ad02c743'::uuid, 'Высший эльф'::text, 'Эльфы — это волшебный народ, обладающий неземным изяществом, живущий в мире, но не являющийся его частью. Они живут в местах, наполненных воздушной красотой, в глубинах древних лесов или в серебряных жилищах, увенчанных сверкающими шпилями и переливающихся волшебным светом. Там лёгкие дуновения ветра разносят обрывки тихих мелодий и нежные ароматы. Эльфы любят природу и магию, музыку и поэзию, и всё прекрасное, что есть в мире.'::text, 'HIGH_ELF'::text, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid);

/* Лесной эльф */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('5e89c042-fbc8-405b-b8f6-6a836c03d782'::uuid, 'Лесной эльф'::text, 'Поскольку вы — лесной эльф, у вас обострённые чувства и интуиция, и ваши стремительные ноги несут вас быстро и незаметно через ваши родные леса. Эта категория включает диких эльфов Серого Ястреба и кагонести из Саги о Копье, а также расы, называемые лесными эльфами Серого Ястреба и Забытых Королевств. В Фаэруне лесные эльфы (также называемые дикими или зелёными) являются затворниками, не доверяющими не-эльфам.'::text, 'WOOD_ELF'::text, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid);

/* Темный эльф (Дроу) */
INSERT INTO rules.default_5e_race (id, name, description, code, race_stats_id)
VALUES ('588a3065-f65c-4ad4-a63c-0243cf53df35'::uuid, 'Темный эльф (Дроу)'::text, 'Как дроу, вы прониклись магией Подземья, подземного царства чудес и ужасов, которое редко можно увидеть на поверхности. Вы чувствуете себя в тени как дома и благодаря своей врожденной магии учитесь призывать и свет, и тьму. У ваших сородичей обычно ярко-белые волосы и разноцветная сероватая кожа.'::text, 'DROW'::text, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid);


/* Лесной гном */
INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('70666572-ee37-4997-8874-f982200600ed'::uuid, 'f72162d9-aa65-4297-a451-d70f7e3aeb53'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Привыкнув к жизни под землёй, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2443ac4a-a7aa-421b-896a-03985cdd7743'::uuid, 'f72162d9-aa65-4297-a451-d70f7e3aeb53'::uuid, 'Гномья хитрость'::text, 'GNOME_CUNNING'::text,
        'Вы совершаете с преимуществом спасброски Интеллекта, Мудрости и Харизмы против магии.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('87df38ba-749d-42e9-9b18-bd7e00fe9e64'::uuid, 'f72162d9-aa65-4297-a451-d70f7e3aeb53'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и Гномьем языках. Гномий язык, использующий дварфский алфавит, хорошо известен благодаря техническим трактатам и каталогам знаний об окружающем мире.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('437d2d36-9c86-4283-920a-2d26ec7812a1'::uuid, 'f72162d9-aa65-4297-a451-d70f7e3aeb53'::uuid, 'Природная иллюзия'::text, 'NATURAL_ILLUSIONIST'::text,
        'Вы знаете заклинание малая иллюзия [minor illusion]. Базовой характеристикой заклинаний для его использования является Интеллект.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('0a3a953e-dc9e-446b-89b2-b1de98a54c97'::uuid, 'f72162d9-aa65-4297-a451-d70f7e3aeb53'::uuid, 'Общение с маленькими зверями'::text, 'SMALL_BEASTS_SPEAKING'::text,
        'С помощью звуков и жестов вы можете передавать простые понятия Маленьким или еще меньшим зверям. Лесные гномы любят животных и часто держат белок, барсуков, кроликов, кротов, дятлов и других животных в качестве питомцев.'::text);

/* Скальный гном */
INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('41cb154e-1bb7-424c-9ce0-bbfbd9d59335'::uuid, 'df0ee778-2f0a-4bcb-9963-1ebe4c224c82'::uuid, 'Ремесленные знания'::text, 'ARTIFICERS_LORE'::text,
        'При совершении проверки Интеллекта (История) применительно к магическому, алхимическому или технологическому объекту, вы можете добавить к проверке удвоенный бонус мастерства вместо обычного.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d9863230-7be9-4228-a2f0-08b76563e0bc'::uuid, 'df0ee778-2f0a-4bcb-9963-1ebe4c224c82'::uuid, 'Жестянщик'::text, 'TINKER'::text,
        'Вы владеете ремесленными инструментами (инструменты ремонтника). С их помощью вы можете, потратив 1 час времени и материалы на сумму в 10 зм, создать Крошечное механическое устройство (КД 5, 1 хит). Это устройство перестаёт работать через 24 часа (если вы не потратите 1 час на поддержание его работы).\n\nВы можете действием разобрать его; в этом случае вы можете получить обратно использованные материалы. Одновременно вы можете иметь не более трёх таких устройств.\n\nПри создании устройства выберите один из следующих вариантов:\n\n- **Заводная игрушка**. Эта заводная игрушка изображает животное, чудовище или существо, вроде лягушки, мыши, птицы, дракона или солдатика. Поставленная на землю, она проходит 5 футов в случайном направлении за каждый ваш ход, издавая звуки, соответствующие изображаемому существу.\n\n- **Зажигалка**. Это устройство производит миниатюрный огонёк, с помощью которого можно зажечь свечу, факел или костёр. Использование этого устройства требует действия.\n\n- **Музыкальная шкатулка**. При открытии эта шкатулка проигрывает мелодию средней громкости. Шкатулка перестаёт играть, если мелодия закончилась или если шкатулку закрыли.'::text);


/* Горный дварф */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c0e5d4ab-efd3-4cbc-b28c-d6fb707a4dda'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Привыкнув к жизни под землёй, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('910ffcec-f617-4c49-9b1f-42738abc1288'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'Дварфийская устойчивость'::text, 'DWARVEN_RESISTANCE'::text,
        'Вы совершаете с преимуществом спасброски от яда, и вы получаете сопротивление урону ядом.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('07e0f614-5abf-431b-8d15-0e333000b063'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'Дварфийская боевая тренировка'::text, 'DWARVEN_COMBAT_TRAINING'::text,
        'Вы владеете боевым топором, ручным топором, лёгким и боевым молотом.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('530852fb-4515-45ba-84ac-0f9f6f8fe0ef'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'Владение инструментами'::text, 'TOOL_PROFICIENCY'::text,
        'Вы владеете ремесленными инструментами на ваш выбор: инструменты кузнеца, пивовара или каменщика.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('91fb277a-585d-4a88-a17f-fe20d59fb8cb'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'Знание камня'::text, 'STONECUNNING'::text,
        'Если вы совершаете проверку Интеллекта (История), связанную с происхождением работы по камню, вы считаетесь владеющим навыком История, и добавляете к проверке удвоенный бонус мастерства вместо обычного.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('3707d186-5ae6-4fee-a271-af8a3c463038'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы разговариваете, читаете и пишете на Общем и Дварфийском языках. Дварфийский язык состоит из твёрдых согласных и гортанных звуков, и этот акцент будет присутствовать в любом языке, на котором дварф будет говорить.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('bcc2bc67-9d08-4c63-9727-f82769ffe1ef'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'Владение доспехами дварфов'::text, 'DWARVEN_ARMOR_TRAINING'::text,
        'Вы владеете лёгкими и средними доспехами.'::text);

/* Холмовой дварф */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('542b8a2f-41c0-4124-ad0f-aeb4edc5f711'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Привыкнув к жизни под землёй, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('9a95aa19-acac-41b6-b73a-ee57b0bfbc9c'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'Дварфийская устойчивость'::text, 'DWARVEN_RESISTANCE'::text,
        'Вы совершаете с преимуществом спасброски от яда, и вы получаете сопротивление урону ядом.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('b37d1d22-2a3a-4e5b-bda4-f67af7264463'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'Дварфийская боевая тренировка'::text, 'DWARVEN_COMBAT_TRAINING'::text,
        'Вы владеете боевым топором, ручным топором, лёгким и боевым молотом.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('dd9c6b92-3dcb-40ae-8f83-382fc7d30ef8'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'Владение инструментами'::text, 'TOOL_PROFICIENCY'::text,
        'Вы владеете ремесленными инструментами на ваш выбор: инструменты кузнеца, пивовара или каменщика.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('777d176d-18e6-490d-b273-415836256c9b'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'Знание камня'::text, 'STONECUNNING'::text,
        'Если вы совершаете проверку Интеллекта (История), связанную с происхождением работы по камню, вы считаетесь владеющим навыком История, и добавляете к проверке удвоенный бонус мастерства вместо обычного.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('21afea20-380f-4719-b777-ec226b130e5b'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы разговариваете, читаете и пишете на Общем и Дварфийском языках. Дварфийский язык состоит из твёрдых согласных и гортанных звуков, и этот акцент будет присутствовать в любом языке, на котором дварф будет говорить.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e1f506b2-ca1e-4d77-aa1c-ad6f197da208'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'Дварфийская выдержка'::text, 'DWARVEN_TOUGHNESS'::text,
        'Максимальное значение ваших хитов увеличивается на 1, и вы получаете 1 дополнительный хит с каждым новым уровнем.'::text);

/* Драконорожденный */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('7c6b8d56-9e7a-463e-91f5-0f1d49b04010'::uuid, '92081e53-21ff-4a58-8c4f-23e97feeea9a'::uuid, 'Наследие драконов'::text, 'DRACONIAN_ANCESTRY'::text,
        'Вы получаете драконье наследие. Выберите тип дракона из таблицы «Наследие драконов». Вы получаете оружие дыхания и сопротивление урону соответствующего вида, как указано в таблице.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('4846c488-290a-41a1-ab36-e9f7eb53c60b'::uuid, '92081e53-21ff-4a58-8c4f-23e97feeea9a'::uuid, 'Оружие дыхания'::text, 'BREATH_WEAPON'::text,
        'Вы можете действием выдохнуть разрушительную энергию. Ваше наследие драконов определяет размер, форму и вид урона вашего выдоха.
Когда вы используете оружие дыхания, все существа в зоне выдоха должны совершить спасбросок, вид которого определяется вашим наследием. Сложность этого спасброска равна 8 + ваш модификатор Телосложения + ваш бонус мастерства. Существа получают урона 2к6 в случае проваленного спасброска, или половину этого урона, если спасбросок был успешен. Урон повышается до 3к6 на 6-м уровне, до 4к6 на 11-м, и до 5к6 на 16-м уровне.
После использования оружия дыхания вы не можете использовать его повторно, пока не завершите короткий либо продолжительный отдых.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('7219b7fc-4162-45d4-bd13-66fb68f3d6b1'::uuid, '92081e53-21ff-4a58-8c4f-23e97feeea9a'::uuid, 'Сопротивление урону'::text, 'RESISTANCE'::text,
        'Вы получаете сопротивление урону того вида, который указан в вашем наследии драконов.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('bf0041e9-def4-4e91-9db6-5b6d18c6537c'::uuid, '92081e53-21ff-4a58-8c4f-23e97feeea9a'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и Драконьем языках. Драконий язык считается одним из старейших и часто используется во время изучения магии. Этот язык звучит грубо для большинства других существ, и содержит много твёрдых согласных и шипящих звуков.'::text);

/* Полуорк */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('12fc33b1-c175-4784-8208-11e70b80fe66'::uuid, '50afafa1-6a73-4bf9-b1b3-b856ac2f83b0'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Благодаря орочьей крови, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('a7941377-0057-4d21-ab9f-7544cd3a5de4'::uuid, '50afafa1-6a73-4bf9-b1b3-b856ac2f83b0'::uuid, 'Угрожающий вид'::text, 'MENACING'::text,
        'Вы получаете владение навыком Запугивание.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('78154057-5a6a-4ea0-b73e-f85621143b31'::uuid, '50afafa1-6a73-4bf9-b1b3-b856ac2f83b0'::uuid, 'Непоколебимая стойкость'::text, 'RELENTLESS_ENDURANCE'::text,
        'Если ваши хиты опустились до нуля, но вы при этом не убиты, ваши хиты вместо этого опускаются до 1. Вы не можете использовать эту способность снова, пока не завершите продолжительный отдых.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('5514d825-66d3-4525-8d0e-6b48230b4c25'::uuid, '50afafa1-6a73-4bf9-b1b3-b856ac2f83b0'::uuid, 'Свирепые атаки'::text, 'SAVAGE_ATTACKS'::text,
        'Если вы совершили критическое попадание рукопашной атакой оружием, вы можете добавить к итоговому урону еще одну кость урона этого оружия.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cad1e5a2-8f40-4182-bc79-003d4e0dd98d'::uuid, '50afafa1-6a73-4bf9-b1b3-b856ac2f83b0'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и Орочьем языках. Орочий язык резкий и грубый, полный твёрдых согласных. Он не имеет собственного алфавита и использует дварфский'::text);

/* Коренастый полурослик */
INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('76859e49-ba9a-4078-9205-7218db4ac0ea'::uuid, 'cacb27fc-f2e2-4b16-8950-3310076e93a4'::uuid, 'Везучий'::text, 'LUCKY'::text,
        'Если при броске атаки, проверке характеристики или спасброске у вас выпало «1», вы можете перебросить кость, и должны использовать новый результат, даже если это «1».'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cf47ab46-a7ba-49dd-8148-7157460a6ca5'::uuid, 'cacb27fc-f2e2-4b16-8950-3310076e93a4'::uuid, 'Храбрый'::text, 'BRAVE'::text,
        'Если при броске атаки, проверке характеристики или спасброске у вас выпало «1», вы можете перебросить кость, и должны использовать новый результат, даже если это «1».'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('a4e13daf-2fba-4d57-b6e9-23f0ceb99a83'::uuid, 'cacb27fc-f2e2-4b16-8950-3310076e93a4'::uuid, 'Проворство полуросликов'::text, 'HALFLING_NIMBLENESS'::text,
        'Вы можете проходить сквозь пространство, занятое существами, чей размер больше вашего.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('598971d9-1125-495d-82f6-7079f5ca4a85'::uuid, 'cacb27fc-f2e2-4b16-8950-3310076e93a4'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и языке Полуросликов. Их язык не является секретным, но они не торопятся делиться им с остальными. Пишут они мало, и почти не создали собственной литературы, но устные предания у них очень распространены. Почти все полурослики знают Общий, чтобы общаться с людьми в землях, куда они направляются, или по которым странствуют.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('0129a270-ff84-44f7-9fc5-6dba0172fe09'::uuid, 'cacb27fc-f2e2-4b16-8950-3310076e93a4'::uuid, 'Устойчивость коренастых'::text, 'STOUT_RESISTANCE'::text,
        'Вы совершаете с преимуществом спасброски от яда, и вы получаете сопротивление урону ядом.'::text);

/* Легконогий полурослик */
INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('e0de4704-38c6-42e3-87dd-a601f2d101a1'::uuid, '6891e13f-f6ff-479f-9c11-4116fa756639'::uuid, 'Везучий'::text, 'LUCKY'::text,
        'Если при броске атаки, проверке характеристики или спасброске у вас выпало «1», вы можете перебросить кость, и должны использовать новый результат, даже если это «1».'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('7fa3c100-f3c1-4b87-ba61-4991b106362a'::uuid, '6891e13f-f6ff-479f-9c11-4116fa756639'::uuid, 'Храбрый'::text, 'BRAVE'::text,
        'Если при броске атаки, проверке характеристики или спасброске у вас выпало «1», вы можете перебросить кость, и должны использовать новый результат, даже если это «1».'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c36c601b-98bb-4a8a-b1de-a27ec1b7a490'::uuid, '6891e13f-f6ff-479f-9c11-4116fa756639'::uuid, 'Проворство полуросликов'::text, 'HALFLING_NIMBLENESS'::text,
        'Вы можете проходить сквозь пространство, занятое существами, чей размер больше вашего.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('a01d9001-e5f7-4004-aa1b-c3e1164e1877'::uuid, '6891e13f-f6ff-479f-9c11-4116fa756639'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и языке Полуросликов. Их язык не является секретным, но они не торопятся делиться им с остальными. Пишут они мало, и почти не создали собственной литературы, но устные предания у них очень распространены. Почти все полурослики знают Общий, чтобы общаться с людьми в землях, куда они направляются, или по которым странствуют.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('408588c3-7a9d-434b-b9da-da5bd267bbbd'::uuid, '6891e13f-f6ff-479f-9c11-4116fa756639'::uuid, 'Естественная скрытность'::text, 'NATURAL_STEALHITY'::text,
        'Вы можете предпринять попытку скрыться даже если заслонены только существом, превосходящими вас в размере как минимум на одну категорию.'::text);

/* Полуэльф */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('876c7307-76ea-4e51-931a-2e5e9941814e'::uuid, 'b081c94d-b18f-4a85-b856-65c8781502e2'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Благодаря вашей эльфийской крови, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('b7a288a9-5f94-43f7-92a8-0bdc2e7475d0'::uuid, 'b081c94d-b18f-4a85-b856-65c8781502e2'::uuid, 'Наследие фей'::text, 'FEY_ANCESTRY'::text,
        'Вы совершаете с преимуществом спасброски от состояния «очарованный», и вас невозможно магически усыпить.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('928286b7-e39c-4059-8b78-754018dd990d'::uuid, 'b081c94d-b18f-4a85-b856-65c8781502e2'::uuid, 'Универсальность навыков'::text, 'SKILL_VERSATILITY'::text,
        'Вы получаете владение двумя навыками на ваш выбор.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('58f8e6d1-8090-4e21-8f3c-b1359ea65834'::uuid, 'b081c94d-b18f-4a85-b856-65c8781502e2'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем, Эльфийском и ещё одном языке на ваш выбор.'::text);

/* Тифлинг */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('1d533db8-f13c-4c23-a85f-d72f317e8de0'::uuid, 'f9636fb2-81a8-4dad-bb2a-97313333fab1'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Благодаря вашему дьявольскому наследию, вы отлично видите при тусклом свете и в темноте. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('f3773968-a411-48ab-bacc-a1d6e3319427'::uuid, 'f9636fb2-81a8-4dad-bb2a-97313333fab1'::uuid, 'Адское сопротивление'::text, 'HELLISH_RESISTANCE'::text,
        'Вы получаете сопротивление урону огнём.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('4c2b78e2-a30e-43c0-bdc4-25ba3c0c5996'::uuid, 'f9636fb2-81a8-4dad-bb2a-97313333fab1'::uuid, 'Дьявольское наследие'::text, 'INFERNAL_LEGACY'::text,
        'Начиная с 3-го уровня, вы можете один раз наложить заклинание адское возмездие [hellish rebuke] как заклинание 2-го уровня с помощью этой особенности. Начиная с 5-го уровня, вы также можете накладывать заклинание тьма [darkness] с помощью этой особенности. После накладывания одного из этих заклинаний с помощью особенности вы должны закончить продолжительный отдых, прежде чем сможете вновь наложить это заклинание таким образом.
Кроме того, вы знаете заговор чудотворство [thaumaturgy].
Базовой характеристикой заклинаний для этих заклинаний является Харизма.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('cfc11343-6b13-4f9b-8b9f-62358b61ebfc'::uuid, 'f9636fb2-81a8-4dad-bb2a-97313333fab1'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и Инфернальном.'::text);

/* Человек */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('b4da5af3-fd33-4ef0-96f5-a8e8bc0c8a62'::uuid, 'f3b6e124-b9bb-4607-9248-df35850908b2'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и еще одном языке на ваш выбор. Люди обычно изучают языки народов, с которыми имеют дело, включая редкие диалекты. Они любят разбавлять собственную речь словами, позаимствованными из других языков: орочьими ругательствами, эльфийскими музыкальными терминами, дварфскими военными командами.'::text);

/* Высший эльф */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2a43556e-f718-4bbc-a71f-b789ce16de91'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Привыкнув к сумраку леса и ночному небу, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('009558e5-27ea-4132-bde8-e90df6e2a16e'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Обострённые чувства'::text, 'KEEN_SENSE'::text,
        'Вы владеете навыком Восприятие.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('f0bcd1a8-dbf8-4c1d-95d6-d19c52c86d11'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Наследие фей'::text, 'FEY_ANCESTRY'::text,
        'Вы совершаете с преимуществом спасброски от состояния «очарованный», и вас невозможно магически усыпить.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('8316bc44-a482-4976-8440-d5e5e02fa9d6'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Транс'::text, 'TRANCE'::text,
        'Эльфы не нуждаются во сне. Вместо этого они погружаются в глубокую медитацию, находясь в полубессознательном состоянии до 4 часов в сутки (обычно такую медитацию называют трансом). Во время этой медитации вы можете грезить о разных вещах. Некоторые из этих грёз являются ментальными упражнениями, выработанными за годы тренировок. После такого отдыха вы получаете все преимущества, которые получает человек после 8 часов сна.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('b2c71ce7-fc77-4732-ae96-9e2dedbe6eda'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и Эльфийском языках. Эльфийский язык текучий, с утончёнными интонациями и сложной грамматикой. Эльфийская литература богата и разнообразна, а стихи и песни известны среди представителей других рас. Многие барды учат эльфийский язык, чтобы добавить песни в свой репертуар.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('2e8a6c7d-f1cc-402d-8305-7b5c479750bf'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Владение эльфийским оружием'::text, 'ELF_WEAPON_TRAINING'::text,
        'Вы владеете длинным мечом, коротким мечом, коротким и длинным луками.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('66f8d9a9-e087-474f-9521-dd325a41ba2e'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Заговор'::text, 'CANTRIP'::text,
        'Вы знаете один заговор из списка заклинаний волшебника. Базовой характеристикой заклинаний для его использования является Интеллект.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('f8631cb0-7459-42f2-b2ec-78d1a731f5a1'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'Дополнительный язык'::text, 'EXTRA_LANGUAGE'::text,
        'Вы можете говорить, читать и писать на ещё одном языке, на ваш выбор.'::text);

/* Лесной эльф */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('4c0e6b26-8ead-4d17-b602-a495ace37c8a'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Тёмное зрение'::text, 'DARK_VISION'::text,
        'Привыкнув к сумраку леса и ночному небу, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 60 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('70cfe055-59ac-45d8-9212-a70d9f9a5d8d'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Обострённые чувства'::text, 'KEEN_SENSE'::text,
        'Вы владеете навыком Восприятие.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('0eec0e2b-afd6-44bb-9f10-aaef86882d9f'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Наследие фей'::text, 'FEY_ANCESTRY'::text,
        'Вы совершаете с преимуществом спасброски от состояния «очарованный», и вас невозможно магически усыпить.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c23a1a4c-0585-4a8d-8b11-b787a11d2800'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Транс'::text, 'TRANCE'::text,
        'Эльфы не нуждаются во сне. Вместо этого они погружаются в глубокую медитацию, находясь в полубессознательном состоянии до 4 часов в сутки (обычно такую медитацию называют трансом). Во время этой медитации вы можете грезить о разных вещах. Некоторые из этих грёз являются ментальными упражнениями, выработанными за годы тренировок. После такого отдыха вы получаете все преимущества, которые получает человек после 8 часов сна.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('6ae5ac4b-2140-4953-ac21-9377ebac2a46'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и Эльфийском языках. Эльфийский язык текучий, с утончёнными интонациями и сложной грамматикой. Эльфийская литература богата и разнообразна, а стихи и песни известны среди представителей других рас. Многие барды учат эльфийский язык, чтобы добавить песни в свой репертуар.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('357a9373-964b-4905-9396-cc5e3a4d9e31'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Владение эльфийским оружием'::text, 'ELF_WEAPON_TRAINING'::text,
        'Вы владеете длинным мечом, коротким мечом, коротким и длинным луками.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('d8af8a63-55da-4e62-bb0c-02282eef786a'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Быстрые ноги'::text, 'FLEET_OF_FOOT'::text,
        'Ваша базовая скорость ходьбы увеличивается до 35 футов.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('76bb1bc5-8250-43a2-a92c-885478fe0fc8'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'Маскировка в дикой местности'::text, 'MASK_OF_THE_WILD'::text,
        'Вы можете предпринять попытку спрятаться, даже если вы слабо заслонены листвой, сильным дождём, снегопадом, туманом или другими природными явлениями.'::text);

/* Темный эльф (Дроу) */

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('9f67595e-f797-4751-94b4-d0d43c988e7d'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Превосходное  тёмное зрение'::text, 'SUPERIOR_DARK_VISION'::text,
        'Привыкнув к сумраку леса и ночному небу, вы обладаете превосходным зрением в темноте и при тусклом освещении. На расстоянии в 120 футов вы при тусклом освещении можете видеть так, как будто это яркое освещение, и в темноте так, как будто это тусклое освещение. В темноте вы не можете различать цвета, только оттенки серого.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('c9334a62-f95c-4a46-b617-06900d1f5ec1'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Обострённые чувства'::text, 'KEEN_SENSE'::text,
        'Вы владеете навыком Восприятие.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('aed6aae7-85ef-42a4-953e-ea39dbc19b46'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Наследие фей'::text, 'FEY_ANCESTRY'::text,
        'Вы совершаете с преимуществом спасброски от состояния «очарованный», и вас невозможно магически усыпить.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('ab193df8-7f61-4611-abd5-977596082cc6'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Транс'::text, 'TRANCE'::text,
        'Эльфы не нуждаются во сне. Вместо этого они погружаются в глубокую медитацию, находясь в полубессознательном состоянии до 4 часов в сутки (обычно такую медитацию называют трансом). Во время этой медитации вы можете грезить о разных вещах. Некоторые из этих грёз являются ментальными упражнениями, выработанными за годы тренировок. После такого отдыха вы получаете все преимущества, которые получает человек после 8 часов сна.'::text);


INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('f94b577d-80ef-49ad-a860-ab7536627ba2'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Языки'::text, 'LANGUAGES'::text,
        'Вы можете говорить, читать и писать на Общем и Эльфийском языках. Эльфийский язык текучий, с утончёнными интонациями и сложной грамматикой. Эльфийская литература богата и разнообразна, а стихи и песни известны среди представителей других рас. Многие барды учат эльфийский язык, чтобы добавить песни в свой репертуар.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('64e99408-c8b4-4d4a-bac5-4a925c83179e'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Чувствительность к солнцу'::text, 'SUNLIGHT_SENSIVITY'::text,
        'Вы совершаете с помехой броски атаки и проверки Мудрости (Восприятие), основанные на зрении, если вы, цель вашей атаки или изучаемый предмет расположены на прямом солнечном свете.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('db72303a-500b-4c31-aa1e-dd960907d38e'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Магия дроу'::text, 'DROW_MAGIC'::text,
        'Начиная с 3-го уровня, вы можете накладывать заклинание огонь фей [faerie fire] с помощью этой особенности. Начиная с 5-го уровня вы также можете накладывать заклинание тьма [darkness] с помощью этой особенности. После накладывания одного из этих заклинаний с помощью особенности вы должны закончить продолжительный отдых, прежде чем сможете вновь наложить его таким образом.
Кроме того, вы знаете заговор пляшущие огоньки [dancing lights]. Базовой характеристикой для этих заклинаний является Харизма.'::text);

INSERT INTO rules.race_trait (id, race_stats_id, name, code, description)
VALUES ('0e7c7903-dfd5-405c-a3dd-eb219db8ef0a'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'Владение оружием дроу'::text, 'DROW_WEAPON_TRAINING'::text,
        'Вы владеете рапирой, коротким мечом и ручным арбалетом.'::text);


/* Владения рас */

/* Скальный гном */
INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('28ad32ba-7e06-44f1-ac37-689a6536afb5'::uuid, 'df0ee778-2f0a-4bcb-9963-1ebe4c224c82'::uuid, 'INSTRUMENT'::text,
        'REPA'::text);

/* Горный дварф */
INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('bfcce139-8c18-4d6d-ad8c-fce2d8b3182e'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'WEAPON'::text,
        'HAX'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('7fd47609-8e24-4e9e-ba1c-06f7ca408628'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'WEAPON'::text,
        'BAXE'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('9e1670dc-246a-46b7-975b-d5f88d5167a6'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'WEAPON'::text,
        'LHMR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('29d03721-9ded-420d-b652-54346372123d'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'WEAPON'::text,
        'WHMR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('6fe9e0a7-bcb2-4e0b-9cf0-e488d5990cbf'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'INSTRUMENT'::text,
        'SMIT'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('f101e545-1dfd-4733-b234-d5a3f9608718'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'INSTRUMENT'::text,
        'BREW'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('1a3ae60e-e9d5-4150-959f-1614fc3df056'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'INSTRUMENT'::text,
        'MASON'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('92b850e3-d128-4319-8ee4-91cf057f92e2'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'ARMOR'::text,
        'LAR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('702c6057-d40f-4f1e-af12-290b5758bc9d'::uuid, 'f292377f-a552-45cb-b6d4-4b8d6520d37a'::uuid, 'ARMOR'::text,
        'MAR'::text);

/* Холмовой дварф */
INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('200fd9cf-9544-4cc6-87e5-b608b5d4d15b'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'WEAPON'::text,
        'HAX'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('119aadd5-641f-49b9-8a67-bce4d9471de3'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'WEAPON'::text,
        'BAXE'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('981c9ceb-412a-4c28-80cb-fe1e6d020ae1'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'WEAPON'::text,
        'LHMR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('2363d51c-c629-4f6d-ab1f-0beb513c2aa2'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'WEAPON'::text,
        'WHMR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('5669a0df-51fa-4b5b-b824-eff37de00179'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'INSTRUMENT'::text,
        'SMIT'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('cde9c913-a6a9-4f32-b56f-4ab4a06b56cc'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'INSTRUMENT'::text,
        'BREW'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('b506e7db-9442-4748-ac05-8e8fa722880a'::uuid, 'c1f3a725-e03e-48d8-b18c-a1a1affbf964'::uuid, 'INSTRUMENT'::text,
        'MASON'::text);

/* Высший эльф */
INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('1322e9f4-d3e1-46fb-bb21-274ac30474b7'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'ABILITY'::text,
        'PERC'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('7701cdf5-62ef-4f29-8325-afd1c9a5a817'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'WEAPON'::text,
        'LSWR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('8dcfc58d-eeec-49be-a053-d9f5df7936de'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'WEAPON'::text,
        'SSWR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('80cce341-803e-45d0-854c-a20aeec6c0ef'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'WEAPON'::text,
        'SBOW'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('fe529e22-4a02-40f1-bcbf-56a7f05dd1c3'::uuid, 'cce6f7de-b5de-48e3-941a-37c9d0ddb98e'::uuid, 'WEAPON'::text,
        'LBOW'::text);

/* Лесной эльф */
INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('071cfcc0-af9c-4913-8a7c-fa1858a1ea35'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'ABILITY'::text,
        'PERC'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('c4b0bc6b-a393-4b31-bb5a-5818bdad36b4'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'WEAPON'::text,
        'LSWR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('dfc7e8d5-0616-4f65-bf9f-2f9df221d8e2'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'WEAPON'::text,
        'SSWR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('644dc120-d7dd-4b17-a93e-7ad0669f1481'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'WEAPON'::text,
        'SBOW'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('cc6c1a08-e3e6-494a-98d3-940dcc7a053e'::uuid, '32bdff9e-1432-43a9-ab11-623ba757616d'::uuid, 'WEAPON'::text,
        'LBOW'::text);


/* Темный Эльф (Дроу) */
INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('6d5b8696-58be-438b-92ac-917f7933b3e6'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'ABILITY'::text,
        'PERC'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('bb1c7811-319a-4bf9-a9d2-94bd9388d77b'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'WEAPON'::text,
        'LSWR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('c18a1a1c-d40a-4ad3-8a14-570677494abf'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'WEAPON'::text,
        'SSWR'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('a32a1a71-ac5b-4fdc-978a-4f13b9b0dcdc'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'WEAPON'::text,
        'SBOW'::text);

INSERT INTO rules.race_proficiency (id, race_stats_id, type, code)
VALUES ('f17caa7e-929e-4f7f-b936-30dcaaa89e39'::uuid, 'd45171da-8765-473c-ad90-4004b6f6462a'::uuid, 'WEAPON'::text,
        'LBOW'::text);

