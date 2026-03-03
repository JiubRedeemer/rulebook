package com.jiubredeemer.rulebook.dal.repository.race;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.dal.entity.tables.RaceStats;
import com.jiubredeemer.rulebook.dal.mapper.race.RaceStatsMapper;
import com.jiubredeemer.rulebook.domain.race.dto.RaceStatsDto;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.Objects;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceStatsRepository {
    private final DSLContext dsl;
    private final RaceStatsMapper raceStatsMapper;

    public RaceStatsDto findById(UUID raceStatsId) {
        return Objects.requireNonNull(dsl.selectFrom(RaceStats.RACE_STATS)
                        .where(RaceStats.RACE_STATS.ID.eq(raceStatsId))
                        .fetchOptional()).map(raceStatsMapper)
                .orElseThrow(() -> new NotFoundException("RaceStats not found by raceStatsId"));
    }

    public RaceStatsDto create(RaceStatsDto raceStatsDto) throws JsonProcessingException {
        dsl.insertInto(RaceStats.RACE_STATS)
                .set(raceStatsMapper.mapToRecord(raceStatsDto))
                .execute();

        return dsl.selectFrom(RaceStats.RACE_STATS)
                .where(RaceStats.RACE_STATS.ID.eq(raceStatsDto.getId()))
                .fetchOptional()
                .map(raceStatsMapper).orElseThrow(() -> new NotFoundException("RaceStats not found by raceStatsId"));
    }
}
