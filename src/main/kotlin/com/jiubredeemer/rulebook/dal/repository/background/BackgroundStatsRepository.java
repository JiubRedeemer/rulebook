package com.jiubredeemer.rulebook.dal.repository.background;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiubredeemer.rulebook.dal.mapper.background.BackgroundStatsMapper;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundStatsDto;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.jooq.*;
import org.jooq.Record;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class BackgroundStatsRepository {
    private static final Table<Record> BACKGROUND_STATS = DSL.table(DSL.name("rules", "background_stats"));
    private static final Field<UUID> ID = DSL.field(DSL.name("id"), UUID.class);
    private static final Field<Object> ABILITY_MODIFIERS = DSL.field(DSL.name("ability_modifiers"), Object.class);

    private final DSLContext dsl;
    private final BackgroundTraitsRepository backgroundTraitsRepository;
    private final BackgroundProficienciesRepository backgroundProficienciesRepository;
    private final BackgroundStatsMapper backgroundStatsMapper;
    private final ObjectMapper objectMapper;

    public BackgroundStatsDto findById(UUID backgroundStatsId) {
        Record record = dsl.selectFrom(BACKGROUND_STATS)
                .where(ID.eq(backgroundStatsId))
                .fetchOptional()
                .orElseThrow(() -> new NotFoundException("BackgroundStats not found"));

        BackgroundStatsDto dto = new BackgroundStatsDto();
        dto.setId(record.get(ID));
        dto.setAbilityModifiers(parseAbilityModifiers(record.get(ABILITY_MODIFIERS)));
        dto.setTraits(backgroundTraitsRepository.findByBackgroundStatsId(backgroundStatsId));
        dto.setProficiencies(backgroundProficienciesRepository.findByBackgroundStatsId(backgroundStatsId));
        return dto;
    }

    private List<String> parseAbilityModifiers(Object value) {
        if (value == null) {
            return List.of();
        }
        try {
            String json;
            if (value instanceof JSONB jsonb) {
                json = jsonb.data();
            } else if (value instanceof String s) {
                json = s;
            } else {
                json = objectMapper.writeValueAsString(value);
            }
            return objectMapper.readValue(json, new TypeReference<>() {
            });
        } catch (Exception e) {
            return List.of();
        }
    }

    public BackgroundStatsDto create(BackgroundStatsDto stats) throws JsonProcessingException {
        dsl.insertInto(BACKGROUND_STATS)
                .set(backgroundStatsMapper.mapToRecord(stats))
                .execute();
        stats.setTraits(backgroundTraitsRepository.create(stats.getTraits(), stats.getId()));
        stats.setProficiencies(backgroundProficienciesRepository.create(stats.getProficiencies(), stats.getId()));
        return findById(stats.getId());
    }
}
