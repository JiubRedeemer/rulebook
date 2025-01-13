package com.jiubredeemer.rulebook.domain.race.service;

import com.jiubredeemer.rulebook.dal.repository.race.RaceRepository;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
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
            default -> raceRepository.getFullRacesForRoom(roomId);
        }).stream().peek(raceDto -> raceDto.setRoomId(roomId)).toList();
    }

    public RaceDto fetchByCode(String raceCode, UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> raceRepository.getFull5eRaceByCode(raceCode);
            default -> raceRepository.getFullRaceByCode(raceCode, roomId);
        }).map(raceDto -> {
            raceDto.setRoomId(roomId);
            return raceDto;
        }).orElseThrow(() -> new NotFoundException("Race not found by code"));
    }
}
