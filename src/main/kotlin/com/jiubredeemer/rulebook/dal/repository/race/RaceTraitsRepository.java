package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.dal.entity.tables.RaceTrait;
import com.jiubredeemer.rulebook.domain.race.dto.RaceTraitDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceTraitsRepository {
    private final DSLContext dsl;

    public List<RaceTraitDto> findByRaceStatsId(UUID raceStatsId) {
        return Objects.requireNonNull(dsl.selectFrom(RaceTrait.RACE_TRAIT)
                .where(RaceTrait.RACE_TRAIT.RACE_STATS_ID.eq(raceStatsId))
                .fetch()).map(raceTraitsRecord -> raceTraitsRecord.into(RaceTraitDto.class));
    }
}
