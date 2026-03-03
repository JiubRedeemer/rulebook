package com.jiubredeemer.rulebook.dal.mapper.background;

import com.jiubredeemer.rulebook.dal.repository.background.BackgroundStatsRepository;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import lombok.RequiredArgsConstructor;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.RecordMapper;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
@RequiredArgsConstructor
public class Default2024BackgroundMapper implements RecordMapper<Record, BackgroundDto> {
    private static final Field<UUID> ID = DSL.field(DSL.name("id"), UUID.class);
    private static final Field<String> NAME = DSL.field(DSL.name("name"), String.class);
    private static final Field<String> DESCRIPTION = DSL.field(DSL.name("description"), String.class);
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<String> IMG_URL = DSL.field(DSL.name("img_url"), String.class);
    private static final Field<UUID> BACKGROUND_STATS_ID = DSL.field(DSL.name("background_stats_id"), UUID.class);

    private final BackgroundStatsRepository backgroundStatsRepository;

    @Override
    public BackgroundDto map(Record record) {
        BackgroundDto dto = new BackgroundDto();
        dto.setId(record.get(ID));
        dto.setName(record.get(NAME));
        dto.setDescription(record.get(DESCRIPTION));
        dto.setCode(record.get(CODE));
        dto.setImgUrl(record.get(IMG_URL));
        UUID statsId = record.get(BACKGROUND_STATS_ID);
        if (statsId != null) {
            dto.setStats(backgroundStatsRepository.findById(statsId));
        }
        return dto;
    }
}
