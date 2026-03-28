package com.jiubredeemer.rulebook.domain.background.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.dal.repository.background.BackgroundRepository;
import com.jiubredeemer.rulebook.dal.repository.background.BackgroundStatsRepository;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundStatsDto;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BackgroundService {
    public static final UUID ZERO_UUID = UUID.fromString("00000000-0000-0000-0000-000000000000");

    private final BackgroundRepository backgroundRepository;
    private final BackgroundStatsRepository backgroundStatsRepository;
    private final RoomService roomService;

    public List<BackgroundDto> fetchAvailableBackgroundsForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        RoomDto roomDto;
        if (roomId.equals(ZERO_UUID)) {
            roomDto = new RoomDto();
            roomDto.setRuleType(forceRuleType);
            roomDto.setBaseRuleType(forceRuleType);
        } else {
            roomDto = roomService.getById(roomId);
        }
        if (roomDto.getRuleType() != RuleTypeEnum.DND2024 && roomDto.getBaseRuleType() != RuleTypeEnum.DND2024) {
            return List.of();
        }
        if (roomDto.getRuleType().equals(RuleTypeEnum.DND2024)) {
            List<BackgroundDto> list = new ArrayList<>(backgroundRepository.getFull2024BackgroundsForRoom());
            list.addAll(backgroundRepository.getFullEberronBackgroundsForRoom());
            return list.stream()
                    .map(dto -> enrichOnRead(dto, roomId))
                    .toList();
        } else {
            List<BackgroundDto> list = new ArrayList<>(backgroundRepository.getFullBackgroundsForRoom(roomId));
            return list.stream()
                    .map(dto -> enrichOnRead(dto, roomId))
                    .toList();
        }
    }

    public BackgroundDto fetchByCode(String code, UUID roomId) {
        RoomDto roomDto = roomService.getById(roomId);
        if (roomDto.getRuleType() != RuleTypeEnum.DND2024 && roomDto.getBaseRuleType() != RuleTypeEnum.DND2024) {
            throw new NotFoundException("Backgrounds are only available for D&D 2024 rules");
        }
        if (roomDto.getRuleType().equals(RuleTypeEnum.HOMEBREW)) {
            return backgroundRepository.getFullBackgroundByCode(code)
                    .map(dto -> {
                        dto.setRoomId(roomId);
                        return dto;
                    })
                    .orElseThrow(() -> new NotFoundException("Background not found by code"));
        }
        return backgroundRepository.getFull2024BackgroundByCode(code)
                .or(() -> backgroundRepository.getFullEberronBackgroundByCode(code))
                .map(dto -> {
                    dto.setRoomId(roomId);
                    return dto;
                })
                .orElseThrow(() -> new NotFoundException("Background not found by code"));
    }

    public BackgroundDto create(BackgroundDto backgroundDto) throws JsonProcessingException {
        RoomDto roomDto = roomService.getById(backgroundDto.getRoomId());
        backgroundDto.setId(UUID.randomUUID());
        backgroundDto.setImgUrl(backgroundDto.getImgUrl() == null ? backgroundDto.getId().toString() : backgroundDto.getImgUrl());
        backgroundDto.setCode(backgroundDto.getCode() == null ? backgroundDto.getId().toString() : backgroundDto.getCode());
        if (backgroundDto.getStats().getId() != null) {
            backgroundDto.getStats().setId(backgroundDto.getStats().getId());
        } else {
            backgroundDto.getStats().setId(UUID.randomUUID());
            final BackgroundStatsDto backgroundStatsDto = backgroundStatsRepository.create(backgroundDto.getStats());
            backgroundDto.setStats(backgroundStatsDto);
        }
        return backgroundRepository.create(backgroundDto);
    }

    private BackgroundDto enrichOnRead(BackgroundDto dto, UUID roomId) {
        dto.setRoomId(roomId);
        if (dto.getStats() != null && dto.getStats().getId() != null) {
            dto.setStats(backgroundStatsRepository.findById(dto.getStats().getId()));
        }
        return dto;
    }
}
