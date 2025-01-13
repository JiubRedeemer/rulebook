package com.jiubredeemer.rulebook.dal.mapper.race;

import com.jiubredeemer.rulebook.domain.race.dto.RaceStatsDto;
import com.jiubredeemer.rulebook.dal.entity.tables.records.RaceStatsRecord;
import com.jiubredeemer.rulebook.dal.repository.race.RaceProficienciesRepository;
import com.jiubredeemer.rulebook.dal.repository.race.RaceTraitsRepository;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class RaceStatsMapper implements RecordMapper<RaceStatsRecord, RaceStatsDto> {

    private final RaceTraitsRepository raceTraitsRepository;
    private final RaceProficienciesRepository raceProficienciesRepository;

    @Override
    public RaceStatsDto map(RaceStatsRecord record) {
        RaceStatsDto raceStatsDto = record.into(RaceStatsDto.class);
        raceStatsDto.setTraits(raceTraitsRepository.findByRaceStatsId(record.getId()));
        raceStatsDto.setProficiencies(raceProficienciesRepository.findByRaceStatsId(record.getId()));
        return raceStatsDto;
    }
}
