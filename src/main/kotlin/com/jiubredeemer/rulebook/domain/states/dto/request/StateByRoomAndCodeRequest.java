package com.jiubredeemer.rulebook.domain.states.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class StateByRoomAndCodeRequest {
    private UUID roomId;
    private String code;
}
