package com.jiubredeemer.rulebook.domain.race.dto;

import lombok.Data;

import java.util.List;

@Data
public class RaceGroupDto {
    private RaceDto species;
    private List<RaceDto> subspecies;
}
