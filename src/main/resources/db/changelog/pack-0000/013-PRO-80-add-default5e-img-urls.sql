UPDATE rules.default_5e_race
SET img_url = CASE code
    WHEN 'HIGH_ELF' THEN 'image_HIGH_ELF_M.png'
    WHEN 'MOUNTAIN_DWARF' THEN 'image_MOUNTAIN_DWARF_M.png'
    WHEN 'DRAGONBORN' THEN 'image_DRAGONBORN_M.png'
    WHEN 'STOUT_HALFLING' THEN 'image_STOUT_HALFLING_M.png'
    WHEN 'LIGHTFOOT_HALFLING' THEN 'image_LIGHTFOOT_HALFLING_M.png'
    WHEN 'FOREST_GNOME' THEN 'image_FOREST_GNOME_M.png'
    WHEN 'WOOD_ELF' THEN 'image_WOOD_ELF_M.png'
    WHEN 'HALF_ORC' THEN 'image_HALF_ORC_M.png'
    WHEN 'HALF_ELF' THEN 'image_HALF_ELF_M.png'
    WHEN 'ROCK_GNOME' THEN 'image_ROCK_GNOME_M.png'
    WHEN 'DROW' THEN 'image_DROW_M.png'
    WHEN 'TIEFLING' THEN 'image_TIEFLING_M.png'
    WHEN 'HILL_DWARF' THEN 'image_HILL_DWARF_M.png'
    WHEN 'HUMAN' THEN 'image_HUMAN_M.png'
END
WHERE code IN (
    'HIGH_ELF',
    'MOUNTAIN_DWARF',
    'DRAGONBORN',
    'STOUT_HALFLING',
    'LIGHTFOOT_HALFLING',
    'FOREST_GNOME',
    'WOOD_ELF',
    'HALF_ORC',
    'HALF_ELF',
    'ROCK_GNOME',
    'DROW',
    'TIEFLING',
    'HILL_DWARF',
    'HUMAN'
);

UPDATE rules.default_5e_clazz
SET img_url = CASE code
    WHEN 'ARTIFICER' THEN 'image_ARTIFICER_M.png'
    WHEN 'BARBARIAN' THEN 'image_BARBARIAN_M.png'
    WHEN 'BARD' THEN 'image_BARD_M.png'
    WHEN 'CLERIC' THEN 'image_CLERIC_M.png'
    WHEN 'DRUID' THEN 'image_DRUID_M.png'
    WHEN 'FIGHTER' THEN 'image_FIGHTER_M.png'
    WHEN 'MONK' THEN 'image_MONK_M.png'
    WHEN 'PALADIN' THEN 'image_PALADIN_M.png'
    WHEN 'RANGER' THEN 'image_RANGER_M.png'
    WHEN 'ROGUE' THEN 'image_ROGUE_M.png'
    WHEN 'SORCERER' THEN 'image_SORCERER_M.png'
    WHEN 'WARLOCK' THEN 'image_WARLOCK_M.png'
    WHEN 'WIZARD' THEN 'image_WIZARD_M.png'
END
WHERE code IN (
    'ARTIFICER',
    'BARBARIAN',
    'BARD',
    'CLERIC',
    'DRUID',
    'FIGHTER',
    'MONK',
    'PALADIN',
    'RANGER',
    'ROGUE',
    'SORCERER',
    'WARLOCK',
    'WIZARD'
);
