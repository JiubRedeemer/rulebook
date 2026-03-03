package com.jiubredeemer.rulebook.domain.background.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class BackgroundTraitDto {
    private UUID id;
    private UUID backgroundStatsId;
    private String name;
    private String code;
    private String description;
}
