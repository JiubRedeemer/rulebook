package com.jiubredeemer.rulebook.domain.ability.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class AbilitiesByRoomRequest {
    private UUID roomId;
}
