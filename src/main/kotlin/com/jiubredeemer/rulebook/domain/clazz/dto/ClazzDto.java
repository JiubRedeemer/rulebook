package com.jiubredeemer.rulebook.domain.clazz.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class ClazzDto {
    private UUID id;
    private UUID roomId;
    private String name;
    private String description;
    private String code;
    private String groupCode;
    private String imgUrl;
    private ClazzStatsDto stats;
}
