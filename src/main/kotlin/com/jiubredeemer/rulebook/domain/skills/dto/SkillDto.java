package com.jiubredeemer.rulebook.domain.skills.dto;

import com.jiubredeemer.rulebook.domain.abilities.dto.AbilityDto;
import lombok.Data;

import java.util.UUID;

@Data
public class SkillDto {
    private UUID id;
    private String name;
    private String code;
    private UUID dependOnAbility;
    private AbilityDto ability;
}
