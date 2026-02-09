package com.jiubredeemer.rulebook.domain.clazz.service;

import com.jiubredeemer.rulebook.dal.repository.clazz.ClassRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ClazzService {
    private final ClassRepository classRepository;
    private final RoomService roomService;

    public List<ClazzDto> fetchAvailableClassesForRoom(UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eClassesForRoom();
            case DND2024 -> classRepository.getFull2024ClassesForRoom();
            default -> classRepository.getFullClassesForRoom(roomId);
        }).stream().peek(classDto -> classDto.setRoomId(roomId)).toList();
    }

    public ClazzDto fetchByRoomAndCode(UUID roomId, String code) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eClassByCode(code);
            case DND2024 -> classRepository.getFull2024ClassByCode(code);
            default -> classRepository.getFullClassByCode(roomId, code);
        }).map(classDto -> {
            classDto.setRoomId(roomId);
            return classDto;
        }).orElseThrow();
    }

    public ClazzDto fetchByCode(UUID roomId, String code) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eRaceByCode(code);
            case DND2024 -> classRepository.getFull2024ClassByCode(code);
            default -> classRepository.getFullRaceByCode(code, roomId);
        }).map(classDto -> {
            classDto.setRoomId(roomId);
            return classDto;
        }).orElseThrow(() -> new NotFoundException("Class not found by code"));
    }
}
