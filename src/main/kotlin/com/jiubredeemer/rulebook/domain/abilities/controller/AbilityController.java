package com.jiubredeemer.rulebook.domain.abilities.controller;

import com.jiubredeemer.rulebook.domain.abilities.dto.AbilityDto;
import com.jiubredeemer.rulebook.domain.abilities.dto.request.AbilityByCodeRequest;
import com.jiubredeemer.rulebook.domain.abilities.dto.request.AbilityRequest;
import com.jiubredeemer.rulebook.domain.abilities.service.AbilityService;
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
@RequestMapping("/api/abilities")
@RequiredArgsConstructor
@Tag(name = "Ability Controller", description = "Управление характеристиками в системе")
public class AbilityController {

    private final AbilityService abilityService;

    @Operation(summary = "Получение доступных характеристик для комнаты",
            description = "Возвращает список доступных характеристик на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список характеристик успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<AbilityDto> getAbilitiesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить список характеристик", required = true)
            @RequestBody AbilityRequest request) {
        return abilityService.fetchAvailableAbilitiesForRoom(request.getRoomId());
    }

    @Operation(summary = "Получение характеристики по коду",
            description = "Возвращает характеристику по коду")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Характеристика"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/byCode")
    public AbilityDto getAbilityByCode(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить характеристику", required = true)
            @RequestBody AbilityByCodeRequest request) {
        return abilityService.fetchByCodeAndRoomId(request.getRoomId(), request.getCode());
    }
}
