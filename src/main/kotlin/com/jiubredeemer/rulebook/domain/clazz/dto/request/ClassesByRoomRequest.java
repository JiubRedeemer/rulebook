package com.jiubredeemer.rulebook.domain.clazz.dto.request;

import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import jakarta.annotation.Nullable;
import lombok.Data;

import java.util.UUID;

@Data
public class ClassesByRoomRequest {
    private UUID roomId;
    @Nullable
    private RuleTypeEnum forceRuleType;

}
