package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.dal.entity.tables.RaceProficiency;
import com.jiubredeemer.rulebook.domain.race.dto.RaceProficiencyDto;
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

    public List<RaceProficiencyDto> findByRaceStatsId(UUID raceStatsId) {
        return Objects.requireNonNull(dsl.selectFrom(RaceProficiency.RACE_PROFICIENCY)
                .where(RaceProficiency.RACE_PROFICIENCY.RACE_STATS_ID.eq(raceStatsId))
                .fetch()).map(raceTraitsRecord -> raceTraitsRecord.into(RaceProficiencyDto.class));
    }
}
