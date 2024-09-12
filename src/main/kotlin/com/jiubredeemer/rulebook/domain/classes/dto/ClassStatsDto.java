package com.jiubredeemer.rulebook.domain.classes.dto;

import kotlin.Pair;
import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
public class ClassStatsDto {
    private UUID id;
    private String hpDice;
    private List<AbilityShortDto> savingThrowsAbilities;
    private List<AvailableSkillDto> availableSkills;
}
