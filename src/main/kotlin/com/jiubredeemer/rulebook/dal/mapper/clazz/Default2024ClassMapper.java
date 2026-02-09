package com.jiubredeemer.rulebook.dal.mapper.clazz;

import com.jiubredeemer.rulebook.dal.repository.clazz.ClassStatsRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import lombok.RequiredArgsConstructor;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.RecordMapper;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Component;

import java.util.UUID;

@RequiredArgsConstructor
@Component
public class Default2024ClassMapper implements RecordMapper<Record, ClazzDto> {
    private static final Field<UUID> ID = DSL.field(DSL.name("id"), UUID.class);
    private static final Field<String> NAME = DSL.field(DSL.name("name"), String.class);
    private static final Field<String> DESCRIPTION = DSL.field(DSL.name("description"), String.class);
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<UUID> CLAZZ_STATS_ID = DSL.field(DSL.name("clazz_stats_id"), UUID.class);

    private final ClassStatsRepository classStatsRepository;

    @Override
    public ClazzDto map(Record record) {
        ClazzDto clazzDto = new ClazzDto();
        clazzDto.setId(record.get(ID));
        clazzDto.setName(record.get(NAME));
        clazzDto.setDescription(record.get(DESCRIPTION));
        clazzDto.setCode(record.get(CODE));

        UUID statsId = record.get(CLAZZ_STATS_ID);
        if (statsId != null) {
            clazzDto.setStats(classStatsRepository.findById(statsId));
        }
        return clazzDto;
    }
}
