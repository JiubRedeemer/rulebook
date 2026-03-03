package com.jiubredeemer.rulebook.domain.background.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class BackgroundDto {
    private UUID id;
    private UUID roomId;
    private String name;
    private String description;
    private String code;
    private String imgUrl;
    private BackgroundStatsDto stats;
}
