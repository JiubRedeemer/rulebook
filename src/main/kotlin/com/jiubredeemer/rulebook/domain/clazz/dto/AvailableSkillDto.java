package com.jiubredeemer.rulebook.domain.clazz.dto;

import com.jiubredeemer.rulebook.domain.common.SkillTypeEnum;
import lombok.Data;

import java.util.List;

@Data
public class AvailableSkillDto {
    private SkillTypeEnum type;
    private Integer count;
    private List<String> of;
}
