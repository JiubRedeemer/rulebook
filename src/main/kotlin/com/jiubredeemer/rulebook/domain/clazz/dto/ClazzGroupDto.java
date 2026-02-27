package com.jiubredeemer.rulebook.domain.clazz.dto;

import lombok.Data;

import java.util.List;

@Data
public class ClazzGroupDto {
    private ClazzDto clazz;
    private List<ClazzDto> subClazzes;
}
