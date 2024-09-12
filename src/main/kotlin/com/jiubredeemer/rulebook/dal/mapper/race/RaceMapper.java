package com.jiubredeemer.rulebook.dal.mapper.race;

import com.jiubredeemer.rulebook.domain.races.dto.RaceDto;
import com.jiubredeemer.rulebook.dal.entity.tables.records.RacesRecord;
import com.jiubredeemer.rulebook.dal.repository.race.RaceStatsRepository;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class RaceMapper implements RecordMapper<RacesRecord, RaceDto> {

    private final RaceStatsRepository raceStatsRepository;

    @Override
    public RaceDto map(RacesRecord record) {
        RaceDto raceDto = record.into(RaceDto.class);
        raceDto.setStats(raceStatsRepository.findById(record.getRaceStatsId()));
        return raceDto;
    }
}
