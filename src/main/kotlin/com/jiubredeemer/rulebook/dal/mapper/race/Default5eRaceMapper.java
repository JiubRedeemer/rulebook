package com.jiubredeemer.rulebook.dal.mapper.race;

import com.jiubredeemer.rulebook.dal.entity.tables.records.Default_5eRaceRecord;
import com.jiubredeemer.rulebook.dal.repository.race.RaceStatsRepository;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class Default5eRaceMapper implements RecordMapper<Default_5eRaceRecord, RaceDto> {

    private final RaceStatsRepository raceStatsRepository;

    @Override
    public RaceDto map(Default_5eRaceRecord record) {
        RaceDto raceDto = record.into(RaceDto.class);
        raceDto.setStats(raceStatsRepository.findById(record.getRaceStatsId()));
        return raceDto;
    }
}
