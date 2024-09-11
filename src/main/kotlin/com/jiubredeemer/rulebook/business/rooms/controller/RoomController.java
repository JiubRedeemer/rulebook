package com.jiubredeemer.rulebook.business.rooms.controller;

import com.jiubredeemer.rulebook.business.rooms.service.RoomsService;
import com.jiubredeemer.rulebook.dal.repository.RoomRepository;
import com.jiubredeemer.rulebook.business.rooms.dto.RoomDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/rooms")
@RequiredArgsConstructor
public class RoomController {

    private final RoomsService roomsService;


    @PostMapping()
    public RoomDto saveRoom(@RequestBody RoomDto roomDto) {
        return roomsService.saveOrGetRoom(roomDto);
    }
}
