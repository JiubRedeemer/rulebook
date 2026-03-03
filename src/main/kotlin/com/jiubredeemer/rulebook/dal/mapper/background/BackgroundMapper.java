package com.jiubredeemer.rulebook.dal.mapper.background;

import com.jiubredeemer.rulebook.dal.entity.tables.records.BackgroundRecord;
import com.jiubredeemer.rulebook.dal.repository.background.BackgroundStatsRepository;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import lombok.RequiredArgsConstructor;
import org.jetbrains.annotations.Nullable;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class BackgroundMapper implements RecordMapper<BackgroundRecord, BackgroundDto> {

    private final BackgroundStatsRepository backgroundStatsRepository;

    public BackgroundRecord mapToRecord(BackgroundDto dto) {
        final BackgroundRecord backgroundRecord = new BackgroundRecord();
        backgroundRecord.setId(dto.getId());
        backgroundRecord.setRoomid(dto.getRoomId());
        backgroundRecord.setName(dto.getName());
        backgroundRecord.setDescription(dto.getDescription());
        backgroundRecord.setCode(dto.getCode());
        backgroundRecord.setImgUrl(dto.getImgUrl());
        backgroundRecord.setBackgroundStatsId(dto.getStats().getId());
        return backgroundRecord;

    }

    @Nullable
    @Override
    public BackgroundDto map(BackgroundRecord backgroundRecord) {
        BackgroundDto backgroundDto = backgroundRecord.into(BackgroundDto.class);
        backgroundDto.setStats(backgroundStatsRepository.findById(backgroundRecord.getBackgroundStatsId()));
        backgroundDto.setRoomId(backgroundRecord.getRoomid());
        return backgroundDto;
    }
}
