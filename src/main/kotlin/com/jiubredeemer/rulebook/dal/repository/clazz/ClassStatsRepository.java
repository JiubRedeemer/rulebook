package com.jiubredeemer.rulebook.dal.repository.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.ClassStats;
import com.jiubredeemer.rulebook.dal.mapper.clazz.ClassStatsMapper;
import com.jiubredeemer.rulebook.domain.classes.dto.ClassStatsDto;
import com.jiubredeemer.rulebook.exceptions.NotFoundException;
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

    public ClassStatsDto findById(UUID classStatsId) {
        return Objects.requireNonNull(dsl.selectFrom(ClassStats.CLASS_STATS)
                        .where(ClassStats.CLASS_STATS.ID.eq(classStatsId))
                        .fetchOptional()).map(classStatsMapper)
                .orElseThrow(() -> new NotFoundException("ClassStats not found by classStatsId"));
    }
}
