/* Бард */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('e768eed6-ad5e-4a4f-b48b-bf99f74373a9'::uuid, '8+CON'::text, '8+CON'::text, '["DEX", "CHA"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW",
      "LSWR",
      "SSWR",
      "RPR",
      "HCXB"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": 3,
    "of": [
      "MUSI"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('cc7d91d5-ad75-44b4-8e9c-b3e040731b2a'::uuid, 'Бард'::text, 'BARD'::text, 'e768eed6-ad5e-4a4f-b48b-bf99f74373a9'::uuid);

/* Варвар */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('b5c59b67-4405-4342-b351-09a264e38adf'::uuid, '12+CON'::text, '12+CON'::text, '["STR", "CON"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHILD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW",
      "AHW",
      "ARW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ATHL", "PERC", "SURV", "INTI", "NATR", "ANIM"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('a7d34405-7b40-48bc-a904-80950a476907'::uuid, 'Варвар'::text, 'BARBARIAN'::text, 'b5c59b67-4405-4342-b351-09a264e38adf'::uuid);

/* Воин */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('d37773f5-fc06-4c99-b048-e6cafd1ac8fa'::uuid, '10+CON'::text, '10+CON'::text, '["STR", "CON"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "HAR",
      "SHILD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW",
      "AHW",
      "ARW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ACRO",
      "ATHL",
      "PERC",
      "SURV",
      "INTI",
      "HIST",
      "INSI",
      "ANIM"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('63185051-5143-4a69-9d2b-4513420e4b12'::uuid, 'Воин'::text, 'FIGHTER'::text, 'd37773f5-fc06-4c99-b048-e6cafd1ac8fa'::uuid);

/* Волшебник */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('dadeba2d-0278-4577-87aa-81defe56dab9'::uuid, '6+CON'::text, '6+CON'::text, '["INT", "WIS"]'::jsonb, '
[
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "DGR",
      "DRT",
      "SLNG",
      "QSTF",
      "HCXB"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "HIST",
      "ARCA",
      "MEDI",
      "INSI",
      "INVE",
      "RELI"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('06a508d9-f03d-4a6a-9598-4c380d74692d'::uuid, 'Волшебник'::text, 'WIZARD'::text, 'dadeba2d-0278-4577-87aa-81defe56dab9'::uuid);

/* Друид */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('9898735e-04b8-4fd7-96f1-0e7759f2bab4'::uuid, '8+CON'::text, '8+CON'::text, '["INT", "WIS"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "QSTF",
      "MACE",
      "DRT",
      "CLB",
      "DGR",
      "SPR",
      "SLNG",
      "SKL",
      "SCMT"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "PERC",
      "SURV",
      "ARCA",
      "MEDI",
      "ANIM",
      "NATR",
      "INSI",
      "RELI"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": -1,
    "of": [
      "HERB"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('999dbf92-311e-43df-83c8-77ff99251a3b'::uuid, 'Друид'::text, 'DRUID'::text, '9898735e-04b8-4fd7-96f1-0e7759f2bab4'::uuid);


/* Жрец */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('4c3f4fdb-9b6f-4e33-88e5-775fea197e64'::uuid, '8+CON'::text, '8+CON'::text, '["INT", "WIS"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "HIST",
      "MEDI",
      "INSI",
      "RELI",
      "PERS"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('f1da23d8-494f-44cf-ac66-ac777efddd8d'::uuid, 'Жрец'::text, 'CLERIC'::text, '4c3f4fdb-9b6f-4e33-88e5-775fea197e64'::uuid);


/* Изобретатель */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('dc23fb8a-a8d8-4e98-be5f-5cdba6391841'::uuid, '8+CON'::text, '8+CON'::text, '["CON", "INT"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "PERC",
      "HIST",
      "SLEI",
      "ARCA",
      "MEDI",
      "NATR",
      "INVE"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": 3,
    "of": [
      "THIE",
      "REPA",
      "CRAF"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('0628d457-9a05-428c-a7ef-ce77c7c2ddf9'::uuid, 'Изобретатель'::text, 'ARTIFICER'::text, 'dc23fb8a-a8d8-4e98-be5f-5cdba6391841'::uuid);

/* Колдун */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('65b5e743-618e-4459-b92b-0643594435e4'::uuid, '8+CON'::text, '8+CON'::text, '["WIS", "CHA"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "INTI",
      "HIST",
      "ARCA",
      "DECE",
      "NATR",
      "INVE",
      "RELI"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('f47f677b-9aa5-4265-b983-2684c065c7e8'::uuid, 'Колдун'::text, 'WARLOCK'::text, '65b5e743-618e-4459-b92b-0643594435e4'::uuid);


/* Монах */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('b0a7f658-f59c-4199-9953-511edd83e822'::uuid, '8+CON'::text, '8+CON'::text, '["STR", "DEX"]'::jsonb, '
[
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW",
      "SSWR"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "INTI",
      "HIST",
      "ARCA",
      "DECE",
      "NATR",
      "INVE",
      "RELI"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('bddb6c00-ac2c-4b31-b96f-2181547d38bb'::uuid, 'Монах'::text, 'MONK'::text, 'b0a7f658-f59c-4199-9953-511edd83e822'::uuid);


/* Паладин */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('fbe7a3ee-c355-4ec0-95f0-73c999107e5e'::uuid, '10+CON'::text, '10+CON'::text, '["WIS", "CHA"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "HAR"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW",
      "AHW",
      "ARW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ATHL",
      "INTI",
      "MEDI",
      "INSI",
      "RELI",
      "PERS"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('acdfbd1f-7bf9-4494-871d-f983bef41b22'::uuid, 'Паладин'::text, 'PALADIN'::text, 'fbe7a3ee-c355-4ec0-95f0-73c999107e5e'::uuid);


/* Плут */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('066b7e5d-85a9-4a53-b485-a09da72ba2e0'::uuid, '8+CON'::text, '8+CON'::text, '["DEX", "INT"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW",
      "HCXB",
      "LSWR",
      "RPR",
      "SSWR"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ACRO",
      "ATHL",
      "PERC",
      "PERF",
      "INTI",
      "SLEI",
      "DECE",
      "INSI",
      "STEA",
      "PERS",
      "INVE"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": -1,
    "of": [
      "THIE"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('ae1fa7f9-a7a5-46a7-abc4-a403f42b54b6'::uuid, 'Плут'::text, 'ROGUE'::text, '066b7e5d-85a9-4a53-b485-a09da72ba2e0'::uuid);


/* Следопыт */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('eeb72220-6167-48b9-9f58-75049335ee35'::uuid, '10+CON'::text, '10+CON'::text, '["STR", "DEX"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SHW",
      "SRW",
      "AHW",
      "ARW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ATHL",
      "PERC",
      "SURV",
      "NATR",
      "INSI",
      "INVE",
      "STEA",
      "ANIM"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('cb14de2d-8475-418a-89b5-0f40e614fc3c'::uuid, 'Следопыт'::text, 'RANGER'::text, 'eeb72220-6167-48b9-9f58-75049335ee35'::uuid);


/* Чародей */
INSERT INTO rules.class_stats (id, hp_dice, start_hp, saving_throws_abilities, available_skills)
VALUES ('4f11a60a-b7c2-4892-a256-c26c1e9b2c12'::uuid, '6+CON'::text, '6+CON'::text, '["CON", "CHA"]'::jsonb, '
[
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "QSTF",
      "DRT",
      "DGR",
      "HCXB",
      "SLNG"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "INTI",
      "ARCA",
      "DECE",
      "INSI",
      "RELI",
      "PERS"
    ]
  }
]
'::jsonb);

INSERT INTO rules.default_5e_classes (id, name, code, class_stats_id)
VALUES ('53d71f8f-acba-42d4-ac63-12eb3d51fb45'::uuid, 'Чародей'::text, 'SORCERER'::text, '4f11a60a-b7c2-4892-a256-c26c1e9b2c12'::uuid);

