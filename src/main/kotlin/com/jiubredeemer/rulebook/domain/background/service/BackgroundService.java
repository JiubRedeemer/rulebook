package com.jiubredeemer.rulebook.domain.background.service;

import com.jiubredeemer.rulebook.dal.repository.background.BackgroundRepository;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
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
    private final BackgroundRepository backgroundRepository;
    private final RoomService roomService;

    public List<BackgroundDto> fetchAvailableBackgroundsForRoom(UUID roomId) {
        RoomDto roomDto = roomService.getById(roomId);
        if (roomDto.getRuleType() != RuleTypeEnum.DND2024) {
            return List.of();
        }
        List<BackgroundDto> list = new ArrayList<>(backgroundRepository.getFull2024BackgroundsForRoom());
        list.addAll(backgroundRepository.getFullEberronBackgroundsForRoom());
        return list.stream().peek(dto -> dto.setRoomId(roomId)).toList();
    }

    public BackgroundDto fetchByCode(String code, UUID roomId) {
        RoomDto roomDto = roomService.getById(roomId);
        if (roomDto.getRuleType() != RuleTypeEnum.DND2024) {
            throw new NotFoundException("Backgrounds are only available for D&D 2024 rules");
        }
        return backgroundRepository.getFull2024BackgroundByCode(code)
                .or(() -> backgroundRepository.getFullEberronBackgroundByCode(code))
                .map(dto -> {
                    dto.setRoomId(roomId);
                    return dto;
                })
                .orElseThrow(() -> new NotFoundException("Background not found by code"));
    }
}
