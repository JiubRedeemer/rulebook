package com.jiubredeemer.rulebook.domain.abilities.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class AbilitiesByRoomRequest {
    private UUID roomId;
}
