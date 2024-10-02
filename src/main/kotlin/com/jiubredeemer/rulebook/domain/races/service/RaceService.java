package com.jiubredeemer.rulebook.domain.races.service;

import com.jiubredeemer.rulebook.domain.races.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.rooms.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.rooms.service.RoomsService;
import com.jiubredeemer.rulebook.dal.repository.race.RaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RaceService {
    private final RaceRepository raceRepository;
    private final RoomsService roomsService;

    public List<RaceDto> fetchAvailableRacesForRoom(UUID roomId) {
        final RoomDto roomDto = roomsService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> raceRepository.getFull5eRacesForRoom();
            default -> raceRepository.getFullRacesForRoom(roomId);
        }).stream().peek(raceDto -> raceDto.setRoomId(roomId)).toList();
    }
}
