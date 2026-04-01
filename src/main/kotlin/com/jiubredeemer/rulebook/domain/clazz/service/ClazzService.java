package com.jiubredeemer.rulebook.domain.clazz.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.configuration.LicenseMode;
import com.jiubredeemer.rulebook.dal.repository.clazz.ClassRepository;
import com.jiubredeemer.rulebook.dal.repository.clazz.ClassStatsRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzGroupDto;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzStatsDto;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
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
    public static final UUID ZERO_UUID = UUID.fromString("00000000-0000-0000-0000-000000000000");

    private final ClassRepository classRepository;
    private final ClassStatsRepository classStatsRepository;
    private final RoomService roomService;
    private final LicenseMode licenseMode;

    public List<ClazzDto> fetchAvailableClassesForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        RoomDto roomDto;
        if (roomId.equals(ZERO_UUID)) {
            roomDto = new RoomDto();
            roomDto.setRuleType(forceRuleType);
            roomDto.setBaseRuleType(forceRuleType);
        } else {
            roomDto = roomService.getById(roomId);
        }
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eClassesForRoom();
            case DND2024 -> {
                if (licenseMode.getCcBy4()) {
                    yield classRepository.getFull2024SrdClassesForRoom();
                } else {
                    yield classRepository.getFull2024ClassesForRoom();
                }
            }
            default -> classRepository.getFullClassesForRoom(roomId);
        }).stream().peek(classDto -> classDto.setRoomId(roomId)).toList();
    }

    public ClazzDto fetchByRoomAndCode(UUID roomId, String code) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eClassByCode(code);
            case DND2024 -> {
                if (licenseMode.getCcBy4()) {
                    yield classRepository.getFull2024SrdClassByCode(code);
                } else {
                    yield classRepository.getFull2024ClassByCode(code);
                }
            }
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
            case DND2024 -> {
                if (licenseMode.getCcBy4()) {
                    yield classRepository.getFull2024SrdClassByCode(code);
                } else {
                    yield classRepository.getFull2024ClassByCode(code);
                }
            }
            default -> classRepository.getFullRaceByCode(code, roomId);
        }).map(classDto -> {
            classDto.setRoomId(roomId);
            return classDto;
        }).orElseThrow(() -> new NotFoundException("Class not found by code"));
    }

    public List<ClazzGroupDto> fetchGroupedClassesForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        return fetchAvailableClassesForRoom(roomId, forceRuleType).stream()
                .collect(java.util.stream.Collectors.groupingBy(this::resolveGroupingKey))
                .values().stream()
                .map(this::toClazzGroup)
                .toList();
    }

    public List<ClazzGroupDto> fetchGroupedClassesForRoom(UUID roomId) {
        return fetchAvailableClassesForRoom(roomId, null).stream()
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
        final String groupCode = resolveGroupingKey(clazzes.getFirst());
        final List<ClazzDto> sorted = clazzes.stream()
                .sorted(Comparator
                        .comparing((ClazzDto clazzDto) -> !groupCode.equals(clazzDto.getCode()))
                        .thenComparingInt((ClazzDto clazzDto) -> Optional.ofNullable(clazzDto.getCode())
                                .map(String::length)
                                .orElse(Integer.MAX_VALUE))
                        .thenComparing(clazzDto -> Optional.ofNullable(clazzDto.getCode()).orElse("")))
                .toList();

        final ClazzGroupDto group = new ClazzGroupDto();
        group.setClazz(sorted.getFirst());
        group.setSubClazzes(sorted.stream().skip(1).toList());
        return group;
    }

    public List<ClazzDto> fetchAvailableRootClassesForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        RoomDto roomDto;
        if (roomId.equals(ZERO_UUID)) {
            roomDto = new RoomDto();
            roomDto.setRuleType(forceRuleType);
            roomDto.setBaseRuleType(forceRuleType);
        } else {
            roomDto = roomService.getById(roomId);
        }
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eRootClassesForRoom();
            case DND2024 -> {
                if (licenseMode.getCcBy4()) {
                    yield classRepository.getFull2024SrdRootClassesForRoom();
                } else {
                    yield classRepository.getFull2024RootClassesForRoom();
                }
            }
            default -> classRepository.getFullRootClassesForRoom(roomId);
        }).stream().peek(classDto -> classDto.setRoomId(roomId)).toList();
    }

    public List<ClazzDto> fetchAvailableSubClassesForRoom(UUID roomId, String code, RuleTypeEnum forceRuleType) {
        RoomDto roomDto;
        if (roomId.equals(ZERO_UUID)) {
            roomDto = new RoomDto();
            roomDto.setRuleType(forceRuleType);
            roomDto.setBaseRuleType(forceRuleType);
        } else {
            roomDto = roomService.getById(roomId);
        }
        return (switch (roomDto.getRuleType()) {
            case DND5E -> classRepository.getFull5eSubClassesForRoom(code);
            case DND2024 -> {
                if (licenseMode.getCcBy4()) {
                    yield classRepository.getFull2024SrdSubClassesForRoom(code);
                } else {
                    yield classRepository.getFull2024SubClassesForRoom(code);
                }
            }
            default -> classRepository.getFullSubClassesForRoom(roomId, code);
        }).stream().peek(classDto -> classDto.setRoomId(roomId)).toList();
    }

    public ClazzDto createClass(ClazzDto clazzDto) throws JsonProcessingException {
        clazzDto.setId(UUID.randomUUID());
        clazzDto.setHidden(clazzDto.getHidden() != null ? clazzDto.getHidden() : false);
        if (clazzDto.getImgUrl() != null) {
            clazzDto.setImgUrl(clazzDto.getImgUrl());
        } else {
            clazzDto.setImgUrl(clazzDto.getId().toString());
        }

        if (clazzDto.getCode() == null) {
            clazzDto.setCode(clazzDto.getId().toString());
        }

        clazzDto.getStats().setId(UUID.randomUUID());
        final ClazzStatsDto clazzStatsDto = classStatsRepository.create(clazzDto.getStats());
        clazzDto.setStats(clazzStatsDto);

        return classRepository.createClass(clazzDto);
    }

    public ClazzDto updateClass(ClazzDto clazzDto) throws JsonProcessingException {
        final ClazzDto existing = classRepository.getFullClassById(clazzDto.getId())
                .orElseThrow(() -> new NotFoundException("Class not found by id"));
        final UUID roomId = clazzDto.getRoomId() != null ? clazzDto.getRoomId() : existing.getRoomId();
        roomService.getById(roomId);

        clazzDto.setRoomId(roomId);
        clazzDto.setName(clazzDto.getName() != null ? clazzDto.getName() : existing.getName());
        clazzDto.setDescription(clazzDto.getDescription() != null ? clazzDto.getDescription() : existing.getDescription());
        clazzDto.setHidden(clazzDto.getHidden() != null ? clazzDto.getHidden() : existing.getHidden());
        clazzDto.setCode(clazzDto.getCode() != null ? clazzDto.getCode() : existing.getCode());
        clazzDto.setGroupCode(clazzDto.getGroupCode() != null ? clazzDto.getGroupCode() : existing.getGroupCode());
        clazzDto.setImgUrl(clazzDto.getImgUrl() != null ? clazzDto.getImgUrl() : existing.getImgUrl());

        final ClazzStatsDto statsForUpdate = clazzDto.getStats() != null ? clazzDto.getStats() : existing.getStats();
        if (statsForUpdate == null) {
            throw new NotFoundException("Class stats not found");
        }
        statsForUpdate.setId(UUID.randomUUID());
        final ClazzStatsDto clazzStatsDto = classStatsRepository.create(statsForUpdate);
        clazzDto.setStats(clazzStatsDto);

        return classRepository.updateClass(clazzDto);
    }

    public ClazzDto setHidden(UUID id, Boolean hidden) {
        return classRepository.setHidden(id, hidden);
    }
}
