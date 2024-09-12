package com.jiubredeemer.rulebook.dal.mapper.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.records.ClassesRecord;
import com.jiubredeemer.rulebook.dal.entity.tables.records.RacesRecord;
import com.jiubredeemer.rulebook.dal.repository.clazz.ClassStatsRepository;
import com.jiubredeemer.rulebook.dal.repository.race.RaceStatsRepository;
import com.jiubredeemer.rulebook.domain.classes.dto.ClassDto;
import com.jiubredeemer.rulebook.domain.races.dto.RaceDto;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class ClassMapper implements RecordMapper<ClassesRecord, ClassDto> {

    private final ClassStatsRepository classStatsRepository;

    @Override
    public ClassDto map(ClassesRecord record) {
        ClassDto classDto = record.into(ClassDto.class);
        classDto.setStats(classStatsRepository.findById(record.getClassStatsId()));
        return classDto;
    }
}
