package com.jiubredeemer.rulebook.domain.race.controller;

import com.jiubredeemer.rulebook.domain.race.dto.RaceGroupDto;
import com.jiubredeemer.rulebook.domain.race.dto.request.RoomIdRequestBody;
import com.jiubredeemer.rulebook.domain.race.service.RaceService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/race-species")
@RequiredArgsConstructor
@Tag(name = "Race Grouping Controller", description = "Группировка подвидов по видам")
public class RaceGroupingController {

    private final RaceService raceService;

    @Operation(summary = "Получение видов с подвидами для комнаты",
            description = "Возвращает список видов, где каждый вид содержит связанные подвиды")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список видов с подвидами успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<RaceGroupDto> getGroupedRacesForRoom(
            @Parameter(description = "Идентификатор комнаты для получения видов и подвидов", required = true)
            @RequestBody RoomIdRequestBody request) {
        return raceService.fetchGroupedRacesForRoom(request.getRoomId());
    }
}
