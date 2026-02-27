package com.jiubredeemer.rulebook.dal.mapper.race;

import com.jiubredeemer.rulebook.dal.repository.race.RaceStatsRepository;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import lombok.RequiredArgsConstructor;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.RecordMapper;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Component;

import java.util.UUID;

@RequiredArgsConstructor
@Component
public class Default2024RaceMapper implements RecordMapper<Record, RaceDto> {
    private static final Field<UUID> ID = DSL.field(DSL.name("id"), UUID.class);
    private static final Field<String> NAME = DSL.field(DSL.name("name"), String.class);
    private static final Field<String> DESCRIPTION = DSL.field(DSL.name("description"), String.class);
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<String> SPECIES_CODE = DSL.field(DSL.name("species_code"), String.class);
    private static final Field<UUID> RACE_STATS_ID = DSL.field(DSL.name("race_stats_id"), UUID.class);
    private static final Field<String> IMG_URL = DSL.field(DSL.name("img_url"), String.class);

    private final RaceStatsRepository raceStatsRepository;

    @Override
    public RaceDto map(Record record) {
        RaceDto raceDto = new RaceDto();
        raceDto.setId(record.get(ID));
        raceDto.setName(record.get(NAME));
        raceDto.setDescription(record.get(DESCRIPTION));
        raceDto.setCode(record.get(CODE));
        raceDto.setSpeciesCode(record.get(SPECIES_CODE));
        raceDto.setImgUrl(record.get(IMG_URL));

        UUID statsId = record.get(RACE_STATS_ID);
        if (statsId != null) {
            raceDto.setStats(raceStatsRepository.findById(statsId));
        }
        return raceDto;
    }
}
