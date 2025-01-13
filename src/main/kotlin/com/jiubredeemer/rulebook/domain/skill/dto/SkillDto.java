package com.jiubredeemer.rulebook.domain.skill.dto;

import com.jiubredeemer.rulebook.domain.ability.dto.AbilityDto;
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
