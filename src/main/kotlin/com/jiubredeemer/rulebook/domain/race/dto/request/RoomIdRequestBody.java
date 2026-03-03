package com.jiubredeemer.rulebook.domain.race.dto.request;

import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import jakarta.annotation.Nullable;
import lombok.Data;

import java.util.UUID;

@Data
public class RoomIdRequestBody {
    private UUID roomId;
    @Nullable
    private RuleTypeEnum forceRuleType;
}
