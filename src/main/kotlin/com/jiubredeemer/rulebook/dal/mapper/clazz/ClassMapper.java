package com.jiubredeemer.rulebook.dal.mapper.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.records.ClazzRecord;
import com.jiubredeemer.rulebook.dal.repository.clazz.ClassStatsRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import lombok.RequiredArgsConstructor;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class ClassMapper implements RecordMapper<ClazzRecord, ClazzDto> {

    private final ClassStatsRepository classStatsRepository;

    @Override
    public ClazzDto map(ClazzRecord record) {
        ClazzDto clazzDto = record.into(ClazzDto.class);
        clazzDto.setStats(classStatsRepository.findById(record.getClazzStatsId()));
        return clazzDto;
    }
}
