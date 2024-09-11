package com.jiubredeemer.rulebook.business.rooms.service;

import com.jiubredeemer.rulebook.business.rooms.dto.RoomDto;
import com.jiubredeemer.rulebook.dal.repository.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RoomsService {
    private final RoomRepository roomRepository;

    public RoomDto saveOrGetRoom(RoomDto roomDto) {
        return roomRepository.saveOrGetRoom(roomDto);
    }
}
