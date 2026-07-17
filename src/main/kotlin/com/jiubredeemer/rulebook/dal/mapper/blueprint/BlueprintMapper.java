package com.jiubredeemer.rulebook.dal.mapper.blueprint;

import com.jiubredeemer.rulebook.dal.entity.tables.records.BlueprintRecord;
import com.jiubredeemer.rulebook.dal.entity.tables.records.UsersBlueprintRecord;
import com.jiubredeemer.rulebook.domain.blueprint.dto.BlueprintDto;
import com.jiubredeemer.rulebook.domain.blueprint.dto.CustomizationEnum;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@Component
public class BlueprintMapper implements RecordMapper<BlueprintRecord, BlueprintDto> {

    @Override
    public BlueprintDto map(BlueprintRecord record) {
        BlueprintDto dto = new BlueprintDto();
        dto.setId(record.getId());
        dto.setCode(record.getCode());
        dto.setName(record.getName());
        dto.setDescription(record.getDescription());
        dto.setGroupCode(record.getGroupCode());
        dto.setRequiredLevel(record.getRequiredLevel());
        dto.setCustomization(toCustomization(record.getCustomization()));
        dto.setItemId(record.getItemId());
        dto.setImgUrl(record.getImgUrl());
        dto.setBundleId(record.getBundleId());
        dto.setHidden(record.getHidden());
        return dto;
    }

    public BlueprintDto mapUsers(UsersBlueprintRecord record) {
        BlueprintDto dto = new BlueprintDto();
        dto.setId(record.getId());
        dto.setCode(record.getCode());
        dto.setName(record.getName());
        dto.setDescription(record.getDescription());
        dto.setGroupCode(record.getGroupCode());
        dto.setRequiredLevel(record.getRequiredLevel());
        dto.setCustomization(toCustomization(record.getCustomization()));
        dto.setItemId(record.getItemId());
        dto.setImgUrl(record.getImgUrl());
        dto.setHidden(record.getHidden());
        dto.setRoomId(record.getRoomId());
        dto.setCreatorId(record.getCreatorId());
        return dto;
    }

    public UsersBlueprintRecord mapToUsersRecord(BlueprintDto dto) {
        UsersBlueprintRecord record = new UsersBlueprintRecord();
        record.setId(dto.getId());
        record.setRoomId(dto.getRoomId());
        record.setCreatorId(dto.getCreatorId());
        record.setCode(dto.getCode());
        record.setName(dto.getName());
        record.setDescription(dto.getDescription());
        record.setGroupCode(dto.getGroupCode());
        record.setRequiredLevel(dto.getRequiredLevel());
        record.setCustomization(dto.getCustomization() != null
                ? dto.getCustomization().name() : CustomizationEnum.NO.name());
        record.setItemId(dto.getItemId());
        record.setImgUrl(dto.getImgUrl());
        record.setHidden(dto.getHidden() != null ? dto.getHidden() : Boolean.FALSE);
        return record;
    }

    private CustomizationEnum toCustomization(String raw) {
        if (raw == null || raw.isBlank()) return CustomizationEnum.NO;
        try {
            return CustomizationEnum.valueOf(raw);
        } catch (IllegalArgumentException e) {
            return CustomizationEnum.NO;
        }
    }
}
