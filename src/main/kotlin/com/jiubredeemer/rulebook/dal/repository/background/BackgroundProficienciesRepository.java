package com.jiubredeemer.rulebook.dal.repository.background;

import com.jiubredeemer.rulebook.domain.background.dto.BackgroundProficiencyDto;
import com.jiubredeemer.rulebook.domain.common.BackgroundProficiencyTypeEnum;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class BackgroundProficienciesRepository {
    private static final Table<Record> BACKGROUND_PROFICIENCY = DSL.table(DSL.name("rules", "background_proficiency"));
    private static final Field<UUID> ID = DSL.field(DSL.name("id"), UUID.class);
    private static final Field<UUID> BACKGROUND_STATS_ID = DSL.field(DSL.name("background_stats_id"), UUID.class);
    private static final Field<String> TYPE = DSL.field(DSL.name("type"), String.class);
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);

    private final DSLContext dsl;

    public List<BackgroundProficiencyDto> findByBackgroundStatsId(UUID backgroundStatsId) {
        return dsl.selectFrom(BACKGROUND_PROFICIENCY)
                .where(BACKGROUND_STATS_ID.eq(backgroundStatsId))
                .fetch()
                .map(this::toDto);
    }

    private BackgroundProficiencyDto toDto(Record r) {
        BackgroundProficiencyDto dto = new BackgroundProficiencyDto();
        dto.setId(r.get(ID));
        dto.setBackgroundStatsId(r.get(BACKGROUND_STATS_ID));
        dto.setType(BackgroundProficiencyTypeEnum.valueOf(r.get(TYPE)));
        dto.setCode(r.get(CODE));
        return dto;
    }
}
