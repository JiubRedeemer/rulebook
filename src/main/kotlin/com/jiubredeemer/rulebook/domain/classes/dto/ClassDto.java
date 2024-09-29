package com.jiubredeemer.rulebook.domain.classes.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class ClassDto {
    private UUID id;
    private UUID roomId;
    private String name;
    private String description;
    private String code;
    private ClassStatsDto stats;
}
