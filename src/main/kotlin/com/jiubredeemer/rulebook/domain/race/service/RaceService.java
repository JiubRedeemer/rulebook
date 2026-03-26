package com.jiubredeemer.rulebook.domain.race.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.dal.repository.race.RaceRepository;
import com.jiubredeemer.rulebook.dal.repository.race.RaceStatsRepository;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.race.dto.RaceGroupDto;
import com.jiubredeemer.rulebook.domain.race.dto.RaceStatsDto;
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
public class RaceService {
    public static final UUID ZERO_UUID = UUID.fromString("00000000-0000-0000-0000-000000000000");
    private final RaceRepository raceRepository;
    private final RaceStatsRepository raceStatsRepository;
    private final RoomService roomService;

    public List<RaceDto> fetchAvailableRacesForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        RoomDto roomDto;
        if (roomId.equals(ZERO_UUID)) {
            roomDto = new RoomDto();
            roomDto.setRuleType(forceRuleType);
            roomDto.setBaseRuleType(forceRuleType);
        } else {
            roomDto = roomService.getById(roomId);
        }
        return (switch (roomDto.getRuleType()) {
            case DND5E -> raceRepository.getFull5eRacesForRoom();
            case DND2024 -> raceRepository.getFull2024RacesForRoom();
            default -> raceRepository.getFullRacesForRoom(roomId);
        }).stream().peek(raceDto -> raceDto.setRoomId(roomId)).toList();
    }

    public List<RaceDto> fetchAvailableRootRacesForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        RoomDto roomDto;
        if (roomId.equals(ZERO_UUID)) {
            roomDto = new RoomDto();
            roomDto.setRuleType(forceRuleType);
            roomDto.setBaseRuleType(forceRuleType);
        } else {
            roomDto = roomService.getById(roomId);
        }
        return (switch (roomDto.getRuleType()) {
            case DND5E -> raceRepository.getFull5eRootRacesForRoom();
            case DND2024 -> raceRepository.getFull2024RootRacesForRoom();
            default -> raceRepository.getFullRootRacesForRoom(roomId);
        }).stream().peek(raceDto -> raceDto.setRoomId(roomId)).toList();
    }

    public RaceDto fetchByCode(String raceCode, UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> raceRepository.getFull5eRaceByCode(raceCode);
            case DND2024 -> raceRepository.getFull2024RaceByCode(raceCode);
            default -> raceRepository.getFullRaceByCode(raceCode, roomId);
        }).map(raceDto -> {
            raceDto.setRoomId(roomId);
            return raceDto;
        }).orElseThrow(() -> new NotFoundException("Race not found by code"));
    }

    public List<RaceDto> fetchSubspeciesByCode(String raceCode, UUID roomId, RuleTypeEnum forceRuleType) {
        RoomDto roomDto;
        if (roomId.equals(ZERO_UUID)) {
            roomDto = new RoomDto();
            roomDto.setRuleType(forceRuleType);
            roomDto.setBaseRuleType(forceRuleType);
        } else {
            roomDto = roomService.getById(roomId);
        }
        return (switch (roomDto.getRuleType()) {
            case DND5E -> raceRepository.getFull5eRaceSubspeciesByCode(raceCode);
            case DND2024 -> raceRepository.getFull2024RaceSubspeciesByCode(raceCode);
            default -> raceRepository.getFullRaceSubspeciesByCode(raceCode, roomId);
        }).stream().peek(raceDto -> raceDto.setRoomId(roomId)).toList();
    }

    public List<RaceGroupDto> fetchGroupedRacesForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        return fetchAvailableRacesForRoom(roomId, forceRuleType).stream()
                .collect(java.util.stream.Collectors.groupingBy(this::resolveGroupingKey))
                .values().stream()
                .map(this::toRaceGroup)
                .toList();
    }

    public List<RaceGroupDto> fetchGroupedRacesForRoom(UUID roomId) {
        return fetchAvailableRacesForRoom(roomId, null).stream()
                .collect(java.util.stream.Collectors.groupingBy(this::resolveGroupingKey))
                .values().stream()
                .map(this::toRaceGroup)
                .toList();
    }

    private String resolveGroupingKey(RaceDto raceDto) {
        return Optional.ofNullable(raceDto.getSpeciesCode())
                .filter(code -> !code.isBlank())
                .orElse(raceDto.getCode());
    }

    private RaceGroupDto toRaceGroup(List<RaceDto> raceDtos) {
        final String groupCode = resolveGroupingKey(raceDtos.getFirst());
        final List<RaceDto> sorted = raceDtos.stream()
                .sorted(Comparator
                        .comparing((RaceDto raceDto) -> !groupCode.equals(raceDto.getCode()))
                        .thenComparingInt((RaceDto raceDto) -> Optional.ofNullable(raceDto.getCode())
                                .map(String::length)
                                .orElse(Integer.MAX_VALUE))
                        .thenComparing(raceDto -> Optional.ofNullable(raceDto.getCode()).orElse("")))
                .toList();

        final RaceGroupDto group = new RaceGroupDto();
        group.setSpecies(sorted.getFirst());
        group.setSubspecies(sorted.stream().skip(1).toList());
        return group;
    }

    public RaceDto createRace(RaceDto raceDto) throws JsonProcessingException {
        roomService.getById(raceDto.getRoomId());
        raceDto.setId(UUID.randomUUID());
        raceDto.setCode(raceDto.getId().toString());
        raceDto.setSpeciesCode(raceDto.getSpeciesCode() == null ? raceDto.getCode() : raceDto.getSpeciesCode());
        raceDto.setImgUrl(raceDto.getImgUrl() == null ? raceDto.getId().toString() : raceDto.getImgUrl());
        if (raceDto.getStats().getId() != null) {
            raceDto.setStats(raceDto.getStats());
        } else {
            raceDto.getStats().setId(UUID.randomUUID());
            final RaceStatsDto raceStatsDto = raceStatsRepository.create(raceDto.getStats());
            raceDto.setStats(raceStatsDto);
        }
        return raceRepository.createRace(raceDto);
    }
}
