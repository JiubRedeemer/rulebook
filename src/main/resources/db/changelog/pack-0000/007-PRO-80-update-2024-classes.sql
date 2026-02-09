/* DND2024: корректные характеристики классов */
INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2101'::uuid, '8+CON'::text, '8+CON'::text, '["DEX", "CHA"]'::jsonb, '
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
      "SRW",
      "SHW"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": 3,
    "of": [
      "MUSI"
    ]
  },
  {
    "type": "ABILITY",
    "count": 3,
    "of": [
      "ANY"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2102'::uuid, '12+CON'::text, '12+CON'::text, '["STR", "CON"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHILD",
      "SHLD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SRW",
      "SHW",
      "AHW",
      "ARW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ANIM",
      "ATHL",
      "NATR",
      "INTI",
      "PERC",
      "SURV"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2103'::uuid, '10+CON'::text, '10+CON'::text, '["STR", "CON"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "HAR",
      "SHILD",
      "SHLD"
    ]
  },
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SRW",
      "SHW",
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
      "PERS",
      "ANIM"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2104'::uuid, '6+CON'::text, '6+CON'::text, '["WIS", "INT"]'::jsonb, '
[
  {
    "type": "WEAPON",
    "count": -1,
    "of": [
      "SRW",
      "SHW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ARCA",
      "HIST",
      "INSI",
      "INVE",
      "MEDI",
      "NATR",
      "RELI"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2105'::uuid, '8+CON'::text, '8+CON'::text, '["WIS", "INT"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "SHLD",
      "SHILD"
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
      "ARCA",
      "ANIM",
      "INSI",
      "MEDI",
      "NATR",
      "PERC",
      "RELI",
      "SURV"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": -1,
    "of": [
      "HERB"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2106'::uuid, '8+CON'::text, '8+CON'::text, '["WIS", "CHA"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD",
      "SHILD"
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
      "INSI",
      "MEDI",
      "PERS",
      "RELI"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2107'::uuid, '8+CON'::text, '8+CON'::text, '["INT", "CON"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD",
      "SHILD"
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
      "ARCA",
      "HIST",
      "INSI",
      "MEDI",
      "NATR",
      "PERC",
      "SLEI"
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
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2108'::uuid, '8+CON'::text, '8+CON'::text, '["INT", "CON"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD",
      "SHILD"
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
      "ARCA",
      "HIST",
      "INVE",
      "MEDI",
      "NATR",
      "PERC",
      "SLEI"
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
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2109'::uuid, '8+CON'::text, '8+CON'::text, '["WIS", "CHA"]'::jsonb, '
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
      "SRW"
    ]
  },
  {
    "type": "ABILITY",
    "count": 2,
    "of": [
      "ARCA",
      "DECE",
      "HIST",
      "INTI",
      "INVE",
      "NATR",
      "RELI"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210a'::uuid, '8+CON'::text, '8+CON'::text, '["STR", "DEX"]'::jsonb, '
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
      "ACRO",
      "ATHL",
      "HIST",
      "INSI",
      "RELI",
      "STEA"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": 1,
    "of": [
      "CRAF",
      "MUSI"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210b'::uuid, '10+CON'::text, '10+CON'::text, '["WIS", "CHA"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "HAR",
      "SHLD",
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
      "ATHL",
      "INSI",
      "INTI",
      "MEDI",
      "PERS",
      "RELI"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210c'::uuid, '8+CON'::text, '8+CON'::text, '["DEX", "INT"]'::jsonb, '
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
    "count": 4,
    "of": [
      "ACRO",
      "ATHL",
      "DECE",
      "INSI",
      "INTI",
      "INVE",
      "PERC",
      "PERS",
      "SLEI",
      "STEA"
    ]
  },
  {
    "type": "INSTRUMENT",
    "count": -1,
    "of": [
      "THIE"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210d'::uuid, '6+CON'::text, '6+CON'::text, '["WIS", "INT"]'::jsonb, '
[
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
      "ARCA",
      "INSI",
      "INTI",
      "INVE",
      "MEDI",
      "PERC",
      "PERS"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210e'::uuid, '10+CON'::text, '10+CON'::text, '["STR", "DEX"]'::jsonb, '
[
  {
    "type": "ARMOR",
    "count": -1,
    "of": [
      "LAR",
      "MAR",
      "SHLD",
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
    "count": 3,
    "of": [
      "ANIM",
      "ATHL",
      "INSI",
      "INVE",
      "NATR",
      "PERC",
      "STEA",
      "SURV"
    ]
  }
]'::jsonb);

INSERT INTO rules.clazz_stats (id, hp_dice, start_hp, saving_throws_ability, available_skills)
VALUES ('c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210f'::uuid, '6+CON'::text, '6+CON'::text, '["CON", "CHA"]'::jsonb, '
[
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
      "ARCA",
      "DECE",
      "INSI",
      "INTI",
      "PERS",
      "RELI"
    ]
  }
]'::jsonb);

/* DND2024: привязка к корректным характеристикам классов */
UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2101'::uuid
WHERE code = 'BARD';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2102'::uuid
WHERE code = 'BARBARIAN';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2103'::uuid
WHERE code = 'FIGHTER';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2104'::uuid
WHERE code = 'WIZARD';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2105'::uuid
WHERE code = 'DRUID';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2106'::uuid
WHERE code = 'CLERIC';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2107'::uuid
WHERE code = 'ARTIFICER_UAA';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2108'::uuid
WHERE code = 'ARTIFICER_EFA';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f2109'::uuid
WHERE code = 'WARLOCK';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210a'::uuid
WHERE code = 'MONK';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210b'::uuid
WHERE code = 'PALADIN';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210c'::uuid
WHERE code = 'ROGUE';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210d'::uuid
WHERE code = 'PSION';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210e'::uuid
WHERE code = 'RANGER';

UPDATE rules.default_2024_clazz
SET clazz_stats_id = 'c6fca9a5-1f0c-4b42-8f95-7b1a9f9f210f'::uuid
WHERE code = 'SORCERER';

/* DND2024: описания (из 5e, так как в источнике отсутствуют) */
UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'BARD')
WHERE code = 'BARD';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'BARBARIAN')
WHERE code = 'BARBARIAN';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'FIGHTER')
WHERE code = 'FIGHTER';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'WIZARD')
WHERE code = 'WIZARD';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'DRUID')
WHERE code = 'DRUID';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'CLERIC')
WHERE code = 'CLERIC';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'ARTIFICER')
WHERE code IN ('ARTIFICER_UAA', 'ARTIFICER_EFA');

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'WARLOCK')
WHERE code = 'WARLOCK';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'MONK')
WHERE code = 'MONK';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'PALADIN')
WHERE code = 'PALADIN';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'ROGUE')
WHERE code = 'ROGUE';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'RANGER')
WHERE code = 'RANGER';

UPDATE rules.default_2024_clazz
SET description = (SELECT description FROM rules.default_5e_clazz WHERE code = 'SORCERER')
WHERE code = 'SORCERER';

UPDATE rules.default_2024_clazz
SET description = NULL
WHERE code = 'PSION';
