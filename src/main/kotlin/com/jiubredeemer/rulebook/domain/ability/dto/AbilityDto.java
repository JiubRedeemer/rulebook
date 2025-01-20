package com.jiubredeemer.rulebook.domain.ability.dto;

import com.jiubredeemer.rulebook.domain.skill.dto.SkillDto;
import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
public class AbilityDto {
    public UUID id;
    public UUID roomId;
    public String code;
    public String name;
    public List<SkillDto> skills;
}
