package com.jiubredeemer.rulebook.domain.race.service;

import com.jiubredeemer.rulebook.dal.repository.race.RaceRepository;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.race.dto.RaceGroupDto;
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
public class RaceService {
    private final RaceRepository raceRepository;
    private final RoomService roomService;

    public List<RaceDto> fetchAvailableRacesForRoom(UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> raceRepository.getFull5eRacesForRoom();
            case DND2024 -> raceRepository.getFull2024RacesForRoom();
            default -> raceRepository.getFullRacesForRoom(roomId);
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

    public List<RaceGroupDto> fetchGroupedRacesForRoom(UUID roomId) {
        return fetchAvailableRacesForRoom(roomId).stream()
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
        final String groupCode = resolveGroupingKey(raceDtos.get(0));
        final List<RaceDto> sorted = raceDtos.stream()
                .sorted(Comparator
                        .comparing((RaceDto raceDto) -> !groupCode.equals(raceDto.getCode()))
                        .thenComparingInt((RaceDto raceDto) -> Optional.ofNullable(raceDto.getCode())
                                .map(String::length)
                                .orElse(Integer.MAX_VALUE))
                        .thenComparing(raceDto -> Optional.ofNullable(raceDto.getCode()).orElse("")))
                .toList();

        final RaceGroupDto group = new RaceGroupDto();
        group.setSpecies(sorted.get(0));
        group.setSubspecies(sorted.stream().skip(1).toList());
        return group;
    }
}
