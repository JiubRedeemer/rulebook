package com.jiubredeemer.rulebook.domain.rooms.controller;

import com.jiubredeemer.rulebook.domain.rooms.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.rooms.service.RoomsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/rooms")
@RequiredArgsConstructor
public class RoomController {

    private final RoomsService roomsService;


    @PutMapping()
    public RoomDto saveRoom(@RequestBody RoomDto roomDto) {
        return roomsService.saveOrGetRoom(roomDto);
    }
}
