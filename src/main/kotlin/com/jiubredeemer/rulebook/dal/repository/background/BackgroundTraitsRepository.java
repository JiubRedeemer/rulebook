package com.jiubredeemer.rulebook.dal.repository.background;

import com.jiubredeemer.rulebook.domain.background.dto.BackgroundTraitDto;
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
public class BackgroundTraitsRepository {
    private static final Table<Record> BACKGROUND_TRAIT = DSL.table(DSL.name("rules", "background_trait"));
    private static final Field<UUID> ID = DSL.field(DSL.name("id"), UUID.class);
    private static final Field<UUID> BACKGROUND_STATS_ID = DSL.field(DSL.name("background_stats_id"), UUID.class);
    private static final Field<String> NAME = DSL.field(DSL.name("name"), String.class);
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<String> DESCRIPTION = DSL.field(DSL.name("description"), String.class);

    private final DSLContext dsl;

    public List<BackgroundTraitDto> findByBackgroundStatsId(UUID backgroundStatsId) {
        return dsl.selectFrom(BACKGROUND_TRAIT)
                .where(BACKGROUND_STATS_ID.eq(backgroundStatsId))
                .fetch()
                .map(this::toDto);
    }

    public List<BackgroundTraitDto> create(List<BackgroundTraitDto> traits, UUID backgroundStatsId) {
        if (traits == null || traits.isEmpty()) {
            return List.of();
        }

        traits.forEach(trait -> {
            trait.setId(trait.getId() == null ? UUID.randomUUID() : trait.getId());
            trait.setBackgroundStatsId(backgroundStatsId);
            dsl.insertInto(BACKGROUND_TRAIT)
                    .columns(ID, BACKGROUND_STATS_ID, NAME, CODE, DESCRIPTION)
                    .values(trait.getId(), trait.getBackgroundStatsId(), trait.getName(), trait.getCode(), trait.getDescription())
                    .execute();
        });

        return findByBackgroundStatsId(backgroundStatsId);
    }

    private BackgroundTraitDto toDto(Record r) {
        BackgroundTraitDto dto = new BackgroundTraitDto();
        dto.setId(r.get(ID));
        dto.setBackgroundStatsId(r.get(BACKGROUND_STATS_ID));
        dto.setName(r.get(NAME));
        dto.setCode(r.get(CODE));
        dto.setDescription(r.get(DESCRIPTION));
        return dto;
    }
}
