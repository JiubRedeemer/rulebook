package com.jiubredeemer.rulebook.domain.rooms.service;

import com.jiubredeemer.rulebook.dal.repository.room.RoomRepository;
import com.jiubredeemer.rulebook.domain.rooms.dto.RoomDto;
import com.jiubredeemer.rulebook.exceptions.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RoomsService {
    private final RoomRepository roomRepository;

    public RoomDto saveOrGetRoom(RoomDto roomDto) {
        return roomRepository.saveOrGetRoom(roomDto);
    }

    public RoomDto getById(UUID roomId) {
        return roomRepository.getRoomByRoomId(roomId).orElseThrow(() -> new NotFoundException("Room not found by id"));
    }

    public void deleteRoom(UUID roomId) {
        roomRepository.deleteById(roomId);
    }
}
