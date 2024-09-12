package com.jiubredeemer.rulebook.domain.races.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class RaceTraitsDto {
    private UUID id;
    private UUID raceStatsId;
    private String name;
    private String code;
    private String description;
}
