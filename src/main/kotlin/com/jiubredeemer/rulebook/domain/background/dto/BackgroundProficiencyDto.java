package com.jiubredeemer.rulebook.domain.background.dto;

import com.jiubredeemer.rulebook.domain.common.BackgroundProficiencyTypeEnum;
import lombok.Data;

import java.util.UUID;

@Data
public class BackgroundProficiencyDto {
    private UUID id;
    private UUID backgroundStatsId;
    private BackgroundProficiencyTypeEnum type;
    private String code;
}
