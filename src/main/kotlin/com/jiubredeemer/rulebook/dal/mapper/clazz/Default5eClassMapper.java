package com.jiubredeemer.rulebook.dal.mapper.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.records.Default_5eClazzRecord;
import com.jiubredeemer.rulebook.dal.repository.clazz.ClassStatsRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class Default5eClassMapper implements RecordMapper<Default_5eClazzRecord, ClazzDto> {

    private final ClassStatsRepository classStatsRepository;

    @Override
    public ClazzDto map(Default_5eClazzRecord record) {
        ClazzDto clazzDto = record.into(ClazzDto.class);
        clazzDto.setGroupCode(record.getCode());
        clazzDto.setStats(classStatsRepository.findById(record.getClazzStatsId()));
        return clazzDto;
    }
}
