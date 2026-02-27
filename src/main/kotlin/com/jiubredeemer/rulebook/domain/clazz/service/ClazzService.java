package com.jiubredeemer.rulebook.domain.clazz.service;

import com.jiubredeemer.rulebook.dal.repository.clazz.ClassRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzGroupDto;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
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

    public List<ClazzGroupDto> fetchGroupedClassesForRoom(UUID roomId) {
        return fetchAvailableClassesForRoom(roomId).stream()
                .collect(java.util.stream.Collectors.groupingBy(this::resolveGroupingKey))
                .values().stream()
                .map(this::toClazzGroup)
                .toList();
    }

    private String resolveGroupingKey(ClazzDto clazzDto) {
        return Optional.ofNullable(clazzDto.getGroupCode())
                .filter(code -> !code.isBlank())
                .orElse(clazzDto.getCode());
    }

    private ClazzGroupDto toClazzGroup(List<ClazzDto> clazzes) {
        final String groupCode = resolveGroupingKey(clazzes.get(0));
        final List<ClazzDto> sorted = clazzes.stream()
                .sorted(Comparator
                        .comparing((ClazzDto clazzDto) -> !groupCode.equals(clazzDto.getCode()))
                        .thenComparingInt((ClazzDto clazzDto) -> Optional.ofNullable(clazzDto.getCode())
                                .map(String::length)
                                .orElse(Integer.MAX_VALUE))
                        .thenComparing(clazzDto -> Optional.ofNullable(clazzDto.getCode()).orElse("")))
                .toList();

        final ClazzGroupDto group = new ClazzGroupDto();
        group.setClazz(sorted.get(0));
        group.setSubClazzes(sorted.stream().skip(1).toList());
        return group;
    }
}
