package com.jiubredeemer.rulebook.dal.repository.race;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiubredeemer.rulebook.domain.race.dto.RaceTraitDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.JSONB;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceTraitsRepository {
    private final DSLContext dsl;
    private final ObjectMapper objectMapper;
    private static final Field<JSONB> RACE_STATS_RACE_TRAITS_JSON =
            DSL.field(DSL.name("race_stats", "race_traits"), JSONB.class);
    private static final Field<UUID> RACE_STATS_ID =
            DSL.field(DSL.name("race_stats", "id"), UUID.class);

    public List<RaceTraitDto> findByRaceStatsId(UUID raceStatsId) {
        final var raceTraitsJson = dsl.select(RACE_STATS_RACE_TRAITS_JSON)
                .from(DSL.table(DSL.name("rules", "race_stats")))
                .where(RACE_STATS_ID.eq(raceStatsId))
                .fetchOne(RACE_STATS_RACE_TRAITS_JSON);

        if (raceTraitsJson != null && raceTraitsJson.data() != null && !raceTraitsJson.data().isBlank()) {
            try {
                return objectMapper.readValue(raceTraitsJson.data(), new TypeReference<>() {});
            } catch (JsonProcessingException ignored) {
                return Collections.emptyList();
            }
        }

        return Collections.emptyList();
    }
}
