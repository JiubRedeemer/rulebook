package com.jiubredeemer.rulebook.domain.race.controller;

import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.race.dto.request.RoomIdRequestBody;
import com.jiubredeemer.rulebook.domain.race.service.RaceService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/races")
@RequiredArgsConstructor
@Tag(name = "Race Controller", description = "Управление расами в системе")
public class RaceController {

    private final RaceService raceService;

    @Operation(summary = "Получение доступных рас для комнаты",
            description = "Возвращает список доступных рас для указанной комнаты на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список рас успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<RaceDto> getRacesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой необходимо получить список рас", required = true)
            @RequestBody RoomIdRequestBody request) {
        return raceService.fetchAvailableRacesForRoom(request.getRoomId());
    }


    @Operation(summary = "Получение расы для комнаты по коду",
            description = "Возвращает расу для указанной комнаты на основе идентификатора комнаты и кода расы")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Раса успешно получена"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/{code}")
    public RaceDto getRaceByCode(
            @Parameter(description = "Идентификатор комнаты, для которой необходимо получить расу", required = true)
            @RequestBody RoomIdRequestBody request,
            @PathVariable String code) {
        return raceService.fetchByCode(code, request.getRoomId());
    }
}
