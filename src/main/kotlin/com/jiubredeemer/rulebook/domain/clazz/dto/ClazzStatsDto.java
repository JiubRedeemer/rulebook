package com.jiubredeemer.rulebook.domain.clazz.dto;

import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
public class ClazzStatsDto {
    private UUID id;
    private String hpDice;
    private List<AbilityShortDto> savingThrowsAbilities;
    private List<AvailableSkillDto> availableSkills;
}
