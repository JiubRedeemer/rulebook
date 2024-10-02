package com.jiubredeemer.rulebook.domain.classes.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class ClassesByRoomRequest {
    private UUID roomId;

}
