package com.jiubredeemer.rulebook.domain.background.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import com.jiubredeemer.rulebook.domain.background.service.BackgroundService;
import com.jiubredeemer.rulebook.domain.race.dto.request.RoomIdRequestBody;
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
@RequestMapping("/api/backgrounds")
@RequiredArgsConstructor
@Tag(name = "Background Controller", description = "Управление предысториями в системе")
public class BackgroundController {

    private final BackgroundService backgroundService;

    @Operation(summary = "Получение доступных предысторий для комнаты",
            description = "Возвращает список доступных предысторий для указанной комнаты (D&D 2024)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список предысторий успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<BackgroundDto> getBackgroundsForRoom(
            @Parameter(description = "Идентификатор комнаты", required = true)
            @RequestBody RoomIdRequestBody request) {
        return backgroundService.fetchAvailableBackgroundsForRoom(request.getRoomId(), request.getForceRuleType());
    }

    @Operation(summary = "Получение предыстории по коду",
            description = "Возвращает предысторию по коду для указанной комнаты (D&D 2024)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Предыстория успешно получена"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната или предыстория не найдена")
    })
    @PostMapping("/{code}")
    public BackgroundDto getBackgroundByCode(
            @Parameter(description = "Идентификатор комнаты", required = true)
            @RequestBody RoomIdRequestBody request,
            @PathVariable String code) {
        return backgroundService.fetchByCode(code, request.getRoomId());
    }

    @Operation(summary = "Создание предыстории",
            description = "Создаёт новую предысторию (D&D 2024)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Предыстория успешно создана"),
            @ApiResponse(responseCode = "400", description = "Некорректные данные запроса")
    })
    @PutMapping
    public BackgroundDto createBackground(
            @Parameter(description = "Данные предыстории для создания", required = true)
            @RequestBody BackgroundDto backgroundDto) throws JsonProcessingException {
        return backgroundService.create(backgroundDto);
    }

    @Operation(summary = "Обновление предыстории",
            description = "Обновляет предысторию (D&D 2024)")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Предыстория успешно изменена"),
            @ApiResponse(responseCode = "400", description = "Некорректные данные запроса")
    })
    @PatchMapping
    public BackgroundDto updateBackground(
            @Parameter(description = "Данные предыстории для обновления", required = true)
            @RequestBody BackgroundDto backgroundDto) throws JsonProcessingException {
        return backgroundService.update(backgroundDto);
    }

    @Operation(summary = "Установить флаг скрытия предыстории",
            description = "Устанавливает значение hidden для предыстории")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Флаг hidden успешно обновлён"),
            @ApiResponse(responseCode = "400", description = "Некорректные данные запроса")
    })
    @PatchMapping("/hidden/{id}")
    public BackgroundDto setHidden(
            @Parameter(description = "Идентификатор предыстории", required = true)
            @PathVariable UUID id,
            @Parameter(description = "Флаг скрытия", required = true)
            @RequestParam Boolean hidden) {
        return backgroundService.setHidden(id, hidden);
    }
}
