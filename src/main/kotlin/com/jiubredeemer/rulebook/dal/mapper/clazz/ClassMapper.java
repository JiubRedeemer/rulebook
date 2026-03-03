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
        clazzDto.setGroupCode(record.getCode());
        clazzDto.setStats(classStatsRepository.findById(record.getClazzStatsId()));
        return clazzDto;
    }

    public ClazzRecord mapToRecord(ClazzDto clazzDto) {
        final ClazzRecord clazzRecord = new ClazzRecord();
        clazzRecord.setId(clazzDto.getId());
        clazzRecord.setRoomId(clazzDto.getRoomId());
        clazzRecord.setName(clazzDto.getName());
        clazzRecord.setDescription(clazzDto.getDescription());
        clazzRecord.setCode(clazzDto.getCode());
        clazzRecord.setGroupCode(clazzDto.getGroupCode());
        clazzRecord.setImgUrl(clazzDto.getImgUrl());
        clazzRecord.setClazzStatsId(clazzDto.getStats().getId());
        return clazzRecord;
    }
}
