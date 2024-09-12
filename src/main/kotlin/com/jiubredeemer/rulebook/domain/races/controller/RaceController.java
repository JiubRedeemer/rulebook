package com.jiubredeemer.rulebook.domain.races.controller;

import com.jiubredeemer.rulebook.domain.races.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.races.service.RaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/races")
@RequiredArgsConstructor
public class RaceController {

    private final RaceService raceService;


    @GetMapping()
    public List<RaceDto> getRacesForRoom(@RequestBody UUID roomId) {
        return raceService.fetchAvailableRacesForRoom(roomId);
    }
}
