package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.domain.races.dto.RaceDto;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eRaces;
import com.jiubredeemer.rulebook.dal.entity.tables.Races;
import com.jiubredeemer.rulebook.dal.mapper.race.Default5eRaceMapper;
import com.jiubredeemer.rulebook.dal.mapper.race.RaceMapper;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceRepository {
    private final DSLContext dsl;
    private final RaceMapper raceMapper;
    private final Default5eRaceMapper default5eRaceMapper;

    public List<RaceDto> getFullRacesForRoom(UUID roomId) {
        return dsl.selectFrom(Races.RACES)
                .where(Races.RACES.ROOM_ID.eq(roomId))
                .fetch()
                .map(raceMapper);
    }

    public List<RaceDto> getFull5eRacesForRoom() {
        return dsl.selectFrom(Default_5eRaces.DEFAULT_5E_RACES)
                .fetch()
                .map(default5eRaceMapper);
    }
}
