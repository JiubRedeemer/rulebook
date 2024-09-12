package com.jiubredeemer.rulebook.domain.races.dto;

import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
public class RaceStatsDto {
    private UUID id;
    private Integer maxAge;
    private Integer maxHeight;
    private Integer maxWeight;
    private Integer baseSpeed;
    private List<AbilityModifierDto> abilityModifiers;
    private List<RaceTraitsDto> traits;
    private List<RaceProficienciesDto> proficiencies;
}
