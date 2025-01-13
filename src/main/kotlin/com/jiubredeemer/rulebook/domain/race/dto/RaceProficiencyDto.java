package com.jiubredeemer.rulebook.domain.race.dto;

import com.jiubredeemer.rulebook.domain.common.RaceProficiencyTypeEnum;
import lombok.Data;

import java.util.UUID;

@Data
public class RaceProficiencyDto {
    private UUID id;
    private UUID raceStatsId;
    private RaceProficiencyTypeEnum type;
    private String code;
}
