package com.jiubredeemer.rulebook.domain.states.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class StatesByRoomRequest {
    private UUID roomId;
}
