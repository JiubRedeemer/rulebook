package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eRace;
import com.jiubredeemer.rulebook.dal.entity.tables.Race;
import com.jiubredeemer.rulebook.dal.mapper.race.Default5eRaceMapper;
import com.jiubredeemer.rulebook.dal.mapper.race.RaceMapper;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceRepository {
    private final DSLContext dsl;
    private final RaceMapper raceMapper;
    private final Default5eRaceMapper default5eRaceMapper;

    public List<RaceDto> getFullRacesForRoom(UUID roomId) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ROOM_ID.eq(roomId))
                .fetch()
                .map(raceMapper);
    }

    public List<RaceDto> getFull5eRacesForRoom() {
        return dsl.selectFrom(Default_5eRace.DEFAULT_5E_RACE)
                .fetch()
                .map(default5eRaceMapper);
    }

    public Optional<RaceDto> getFull5eRaceByCode(String raceCode) {
        return dsl.selectFrom(Default_5eRace.DEFAULT_5E_RACE)
                .where(Default_5eRace.DEFAULT_5E_RACE.CODE.eq(raceCode))
                .fetchOptional()
                .map(default5eRaceMapper);
    }

    public Optional<RaceDto> getFullRaceByCode(String raceCode, UUID roomId) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ROOM_ID.eq(roomId))
                .and(Race.RACE.CODE.eq(raceCode))
                .fetchOptional()
                .map(raceMapper);
    }
}
