package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.domain.races.dto.RaceTraitsDto;
import com.jiubredeemer.rulebook.dal.entity.tables.RaceTraits;
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

    public List<RaceTraitsDto> findByRaceStatsId(UUID raceStatsId) {
        return Objects.requireNonNull(dsl.selectFrom(RaceTraits.RACE_TRAITS)
                .where(RaceTraits.RACE_TRAITS.RACE_STATS_ID.eq(raceStatsId))
                .fetch()).map(raceTraitsRecord -> raceTraitsRecord.into(RaceTraitsDto.class));
    }
}
