package com.jiubredeemer.rulebook.domain.ability.service;

import com.jiubredeemer.rulebook.dal.repository.ability.AbilityRepository;
import com.jiubredeemer.rulebook.domain.ability.dto.AbilityDto;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AbilityService {
    private final RoomService roomService;
    private final AbilityRepository abilityRepository;

    public List<AbilityDto> fetchAvailableAbilitiesForRoom(UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> abilityRepository.getFull5eAbilitiesForRoom();
            default -> abilityRepository.getFullAbilitiesForRoom(roomId);
        }).stream().peek(abilityDto -> abilityDto.setRoomId(roomId)).toList();
    }

    public AbilityDto fetchByCodeAndRoomId(UUID roomId, String code) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E -> abilityRepository.get5eByCode(code);
            default -> abilityRepository.getByRoomIdAndCode(roomId, code);
        }).map(abilityDto -> {
            abilityDto.setRoomId(roomId);
            return abilityDto;
        }).orElseThrow();
    }

    public List<AbilityDto> fetchByIds(RoomDto roomDto, Set<UUID> abilityIds) {
        return (switch (roomDto.getRuleType()) {
            case DND5E -> abilityRepository.get5eByIds(abilityIds);
            default -> abilityRepository.getByIds(abilityIds);
        }).stream().peek(abilityDto -> abilityDto.setRoomId(roomDto.getRoomId())).toList();
    }
}
