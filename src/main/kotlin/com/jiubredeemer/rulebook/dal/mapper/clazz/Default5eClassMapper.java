package com.jiubredeemer.rulebook.dal.mapper.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.records.Default_5eClassesRecord;
import com.jiubredeemer.rulebook.dal.repository.clazz.ClassStatsRepository;
import com.jiubredeemer.rulebook.domain.classes.dto.ClassDto;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class Default5eClassMapper implements RecordMapper<Default_5eClassesRecord, ClassDto> {

    private final ClassStatsRepository classStatsRepository;

    @Override
    public ClassDto map(Default_5eClassesRecord record) {
        ClassDto classDto = record.into(ClassDto.class);
        classDto.setStats(classStatsRepository.findById(record.getClassStatsId()));
        return classDto;
    }
}
