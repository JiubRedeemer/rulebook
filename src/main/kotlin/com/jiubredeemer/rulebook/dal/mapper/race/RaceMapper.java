package com.jiubredeemer.rulebook.dal.mapper.race;

import com.jiubredeemer.rulebook.dal.entity.tables.records.RaceRecord;
import com.jiubredeemer.rulebook.dal.repository.race.RaceStatsRepository;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class RaceMapper implements RecordMapper<RaceRecord, RaceDto> {

    private final RaceStatsRepository raceStatsRepository;

    @Override
    public RaceDto map(RaceRecord record) {
        RaceDto raceDto = record.into(RaceDto.class);
        raceDto.setStats(raceStatsRepository.findById(record.getRaceStatsId()));
        return raceDto;
    }
}
