package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.domain.races.dto.RaceProficienciesDto;
import com.jiubredeemer.rulebook.dal.entity.tables.RaceProficiencies;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceProficienciesRepository {
    private final DSLContext dsl;

    public List<RaceProficienciesDto> findByRaceStatsId(UUID raceStatsId) {
        return Objects.requireNonNull(dsl.selectFrom(RaceProficiencies.RACE_PROFICIENCIES)
                .where(RaceProficiencies.RACE_PROFICIENCIES.RACE_STATS_ID.eq(raceStatsId))
                .fetch()).map(raceTraitsRecord -> raceTraitsRecord.into(RaceProficienciesDto.class));
    }
}
