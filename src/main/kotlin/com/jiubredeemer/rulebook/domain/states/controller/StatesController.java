package com.jiubredeemer.rulebook.domain.states.controller;

import com.jiubredeemer.rulebook.domain.states.dto.StateDto;
import com.jiubredeemer.rulebook.domain.states.dto.request.StateByRoomAndCodeRequest;
import com.jiubredeemer.rulebook.domain.states.dto.request.StatesByRoomRequest;
import com.jiubredeemer.rulebook.domain.states.service.StatesService;
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
@RequestMapping("/api/states")
@RequiredArgsConstructor
@Tag(name = "States Controller", description = "Управление состояниями персонажа в системе")
public class StatesController {

    private final StatesService statesService;

    @Operation(summary = "Получение доступных состояний для комнаты",
            description = "Возвращает список доступных состояний на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список состояний успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<StateDto> getStatesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить список состояний", required = true)
            @RequestBody StatesByRoomRequest request) {
        return statesService.fetchAvailableForRoomId(request.getRoomId());
    }

    @Operation(summary = "Получение состояний по коду",
            description = "Возвращает состояний по коду")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Навык"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/byCode")
    public StateDto getSkillByCode(
            @RequestBody StateByRoomAndCodeRequest request) {
        return statesService.fetchByRoomIdAndCode(request.getRoomId(), request.getCode());
    }
}
