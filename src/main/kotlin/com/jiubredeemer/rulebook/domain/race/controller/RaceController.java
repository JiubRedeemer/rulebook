package com.jiubredeemer.rulebook.domain.race.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
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
import java.util.UUID;

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
        return raceService.fetchAvailableRacesForRoom(request.getRoomId(), request.getForceRuleType());
    }

    @Operation(summary = "Получение доступных корневых рас для комнаты",
            description = "Возвращает список доступных корневых рас для указанной комнаты на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список корневых рас успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/root")
    public List<RaceDto> getRootRacesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой необходимо получить список рас", required = true)
            @RequestBody RoomIdRequestBody request) {
        return raceService.fetchAvailableRootRacesForRoom(request.getRoomId(), request.getForceRuleType());
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

    @Operation(summary = "Получение подрасы для комнаты по коду",
            description = "Возвращает подрасы для указанной комнаты на основе идентификатора комнаты и кода расы")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Раса успешно получена"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/{code}/subspecies")
    public List<RaceDto> getRaceSubspeciesByCode(
            @Parameter(description = "Идентификатор комнаты, для которой необходимо получить подрасы", required = true)
            @RequestBody RoomIdRequestBody request,
            @PathVariable String code) {
        return raceService.fetchSubspeciesByCode(code, request.getRoomId(), request.getForceRuleType());
    }

    @Operation(summary = "Создание расы",
            description = "Создаёт новую расу (вид или подвид)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Раса успешно создана"),
            @ApiResponse(responseCode = "400", description = "Некорректные данные запроса")
    })
    @PutMapping()
    public RaceDto createRace(
            @Parameter(description = "Данные расы для создания", required = true)
            @RequestBody RaceDto raceDto) throws JsonProcessingException {
        return raceService.createRace(raceDto);
    }

    @Operation(summary = "Обновление расы",
            description = "Обновляет расу (вид или подвид)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Раса успешно обновлена"),
            @ApiResponse(responseCode = "400", description = "Некорректные данные запроса")
    })
    @PatchMapping()
    public RaceDto updateRace(
            @Parameter(description = "Данные расы для обновления", required = true)
            @RequestBody RaceDto raceDto) throws JsonProcessingException {
        return raceService.updateRace(raceDto);
    }

    @Operation(summary = "Установить флаг скрытия расы",
            description = "Устанавливает значение hidden для расы")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Флаг hidden успешно обновлён"),
            @ApiResponse(responseCode = "400", description = "Некорректные данные запроса")
    })
    @PatchMapping("/hidden/{id}")
    public RaceDto setHidden(
            @Parameter(description = "Идентификатор расы", required = true)
            @PathVariable UUID id,
            @Parameter(description = "Флаг скрытия", required = true)
            @RequestParam Boolean hidden) {
        return raceService.setHidden(id, hidden);
    }
}
