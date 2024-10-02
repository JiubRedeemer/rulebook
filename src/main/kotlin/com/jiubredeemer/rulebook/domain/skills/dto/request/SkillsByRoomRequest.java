package com.jiubredeemer.rulebook.domain.skills.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class SkillsByRoomRequest {
    private UUID roomId;
}
