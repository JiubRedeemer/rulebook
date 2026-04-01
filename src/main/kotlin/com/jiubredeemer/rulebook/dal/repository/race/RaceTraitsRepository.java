package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.domain.race.dto.RaceTraitDto;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import lombok.RequiredArgsConstructor;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceTraitsRepository {
    private static final Table<Record> RACE_TRAIT = DSL.table(DSL.name("rules", "race_trait"));
    private static final Field<UUID> ID = DSL.field(DSL.name("id"), UUID.class);
    private static final Field<UUID> RACE_STATS_ID_COLUMN = DSL.field(DSL.name("race_stats_id"), UUID.class);
    private static final Field<String> NAME = DSL.field(DSL.name("name"), String.class);
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<String> DESCRIPTION = DSL.field(DSL.name("description"), String.class);

    private final DSLContext dsl;

    public List<RaceTraitDto> findByRaceStatsId(UUID raceStatsId) {
        return dsl.selectFrom(RACE_TRAIT)
                .where(RACE_STATS_ID_COLUMN.eq(raceStatsId))
                .fetch()
                .map(this::toDto);
    }

    public List<RaceTraitDto> create(List<RaceTraitDto> traits, UUID raceStatsId) {
        if (traits == null || traits.isEmpty()) {
            return List.of();
        }

        traits.forEach(trait -> {
            trait.setId(UUID.randomUUID());
            trait.setCode(trait.getCode() == null ? trait.getId().toString() : trait.getCode());
            trait.setRaceStatsId(raceStatsId);
            dsl.insertInto(RACE_TRAIT)
                    .columns(ID, RACE_STATS_ID_COLUMN, NAME, CODE, DESCRIPTION)
                    .values(trait.getId(), trait.getRaceStatsId(), trait.getName(), trait.getCode(), trait.getDescription())
                    .execute();
        });

        return findByRaceStatsId(raceStatsId);
    }

    private RaceTraitDto toDto(Record r) {
        RaceTraitDto dto = new RaceTraitDto();
        dto.setId(r.get(ID));
        dto.setRaceStatsId(r.get(RACE_STATS_ID_COLUMN));
        dto.setName(r.get(NAME));
        dto.setCode(r.get(CODE));
        dto.setDescription(r.get(DESCRIPTION));
        return dto;
    }
}
