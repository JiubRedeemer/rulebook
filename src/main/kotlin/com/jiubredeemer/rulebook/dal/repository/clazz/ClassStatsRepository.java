package com.jiubredeemer.rulebook.dal.repository.clazz;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.dal.entity.tables.ClazzStats;
import com.jiubredeemer.rulebook.dal.mapper.clazz.ClassStatsMapper;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzStatsDto;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.Objects;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class ClassStatsRepository {
    private final DSLContext dsl;
    private final ClassStatsMapper classStatsMapper;

    public ClazzStatsDto findById(UUID classStatsId) {
        return Objects.requireNonNull(dsl.selectFrom(ClazzStats.CLAZZ_STATS)
                        .where(ClazzStats.CLAZZ_STATS.ID.eq(classStatsId))
                        .fetchOptional()).map(classStatsMapper)
                .orElseThrow(() -> new NotFoundException("ClassStats not found by classStatsId"));
    }

    public ClazzStatsDto create(ClazzStatsDto stats) throws JsonProcessingException {
        dsl.insertInto(ClazzStats.CLAZZ_STATS)
                .set(classStatsMapper.mapToRecord(stats))
                .execute();
        return findById(stats.getId());
    }
}
