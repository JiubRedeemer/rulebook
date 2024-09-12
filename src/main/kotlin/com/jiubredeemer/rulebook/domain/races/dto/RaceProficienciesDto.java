package com.jiubredeemer.rulebook.domain.races.dto;

import com.jiubredeemer.rulebook.domain.common.RaceProficienciesTypeEnum;
import lombok.Data;

import java.util.UUID;

@Data
public class RaceProficienciesDto {
    private UUID id;
    private UUID raceStatsId;
    private RaceProficienciesTypeEnum type;
    private String code;
}
