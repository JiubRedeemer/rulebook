package com.jiubredeemer.rulebook.domain.states.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class StateDto {
    private UUID id;
    private String name;
    private String code;
    private String description;
}
