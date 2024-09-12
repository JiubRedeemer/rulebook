package com.jiubredeemer.rulebook.domain.races.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class RaceDto {
    private UUID id;
    private UUID roomId;
    private String name;
    private String description;
    private RaceStatsDto stats;
}
