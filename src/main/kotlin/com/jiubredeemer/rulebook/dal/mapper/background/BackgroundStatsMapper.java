package com.jiubredeemer.rulebook.dal.mapper.background;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiubredeemer.rulebook.dal.entity.tables.records.BackgroundStatsRecord;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundStatsDto;
import lombok.RequiredArgsConstructor;
import org.jooq.JSONB;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class BackgroundStatsMapper {
    private final ObjectMapper objectMapper;

    public BackgroundStatsRecord mapToRecord(BackgroundStatsDto dto) throws JsonProcessingException {
        final BackgroundStatsRecord backgroundStatsRecord = new BackgroundStatsRecord();
        backgroundStatsRecord.setId(dto.getId());
        backgroundStatsRecord.setAbilityModifiers(JSONB.jsonb(objectMapper.writeValueAsString(dto.getAbilityModifiers())));
        return backgroundStatsRecord;
    }
}
