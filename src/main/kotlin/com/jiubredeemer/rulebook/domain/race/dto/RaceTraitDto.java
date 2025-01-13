package com.jiubredeemer.rulebook.domain.race.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class RaceTraitDto {
    private UUID id;
    private UUID raceStatsId;
    private String name;
    private String code;
    private String description;
}
