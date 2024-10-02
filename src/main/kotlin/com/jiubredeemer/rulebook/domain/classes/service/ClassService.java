package com.jiubredeemer.rulebook.domain.classes.service;

import com.jiubredeemer.rulebook.dal.repository.clazz.ClassRepository;
import com.jiubredeemer.rulebook.domain.classes.dto.ClassDto;
import com.jiubredeemer.rulebook.domain.rooms.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.rooms.service.RoomsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ClassService {
    private final ClassRepository classRepository;
    private final RoomsService roomsService;

    public List<ClassDto> fetchAvailableClassesForRoom(UUID roomId) {
        final RoomDto roomDto = roomsService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eClassesForRoom();
            default -> classRepository.getFullClassesForRoom(roomId);
        }).stream().peek(classDto -> classDto.setRoomId(roomId)).toList();
    }
}
