package com.jiubredeemer.rulebook.domain.skills.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class SkillsByRoomAndClassRequest {
    private UUID roomId;
    private String classCode;
}
