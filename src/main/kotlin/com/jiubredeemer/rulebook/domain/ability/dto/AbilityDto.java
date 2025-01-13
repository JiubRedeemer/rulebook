package com.jiubredeemer.rulebook.domain.ability.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class AbilityDto {
    public UUID id;
    public UUID roomId;
    public String code;
    public String name;
}
