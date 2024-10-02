package com.jiubredeemer.rulebook.domain.races.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class RacesByRoomRequest {
    private UUID roomId;
}
