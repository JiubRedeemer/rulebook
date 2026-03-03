package com.jiubredeemer.rulebook.dal.mapper.race;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiubredeemer.rulebook.dal.entity.tables.records.RaceStatsRecord;
import com.jiubredeemer.rulebook.dal.repository.race.RaceProficienciesRepository;
import com.jiubredeemer.rulebook.dal.repository.race.RaceTraitsRepository;
import com.jiubredeemer.rulebook.domain.race.dto.RaceStatsDto;
import lombok.RequiredArgsConstructor;
import org.jooq.JSONB;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class RaceStatsMapper implements RecordMapper<RaceStatsRecord, RaceStatsDto> {

    private final RaceTraitsRepository raceTraitsRepository;
    private final RaceProficienciesRepository raceProficienciesRepository;
    private final ObjectMapper objectMapper;

    @Override
    public RaceStatsDto map(RaceStatsRecord record) {
        RaceStatsDto raceStatsDto = record.into(RaceStatsDto.class);
        raceStatsDto.setTraits(raceTraitsRepository.findByRaceStatsId(record.getId()));
        raceStatsDto.setProficiencies(raceProficienciesRepository.findByRaceStatsId(record.getId()));
        return raceStatsDto;
    }

    public RaceStatsRecord mapToRecord(RaceStatsDto dto) throws JsonProcessingException {
        final RaceStatsRecord raceStatsRecord = new RaceStatsRecord();
        raceStatsRecord.setId(dto.getId());
        raceStatsRecord.setMaxAge(dto.getMaxAge() != null ? dto.getMaxAge() : 0);
        raceStatsRecord.setMaxHeight(dto.getMaxHeight() != null ? dto.getMaxHeight() : 0);
        raceStatsRecord.setMaxWeight(dto.getMaxWeight() != null ? dto.getMaxWeight() : 0);
        raceStatsRecord.setBaseSpeed(dto.getBaseSpeed());
        raceStatsRecord.setAbilityModifiers(JSONB.jsonb(objectMapper.writeValueAsString(dto.getAbilityModifiers())));
        return raceStatsRecord;
    }
}
