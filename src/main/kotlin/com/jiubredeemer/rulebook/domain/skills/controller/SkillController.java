package com.jiubredeemer.rulebook.domain.skills.controller;

import com.jiubredeemer.rulebook.domain.skills.dto.SkillDto;
import com.jiubredeemer.rulebook.domain.skills.dto.request.SkillByRoomAndCodeRequest;
import com.jiubredeemer.rulebook.domain.skills.dto.request.SkillsByRoomAndClassRequest;
import com.jiubredeemer.rulebook.domain.skills.dto.request.SkillsByRoomRequest;
import com.jiubredeemer.rulebook.domain.skills.service.SkillService;
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
@RequestMapping("/api/skills")
@RequiredArgsConstructor
@Tag(name = "Skill Controller", description = "Управление навыками в системе")
public class SkillController {

    private final SkillService skillService;

    @Operation(summary = "Получение доступных навыков для комнаты",
            description = "Возвращает список доступных навыков на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список навыков успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<SkillDto> getSkillsForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить список навыков", required = true)
            @RequestBody SkillsByRoomRequest request) {
        return skillService.fetchAvailableForRoomId(request.getRoomId());
    }

    @Operation(summary = "Получение навыков по коду",
            description = "Возвращает навыков по коду")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Навык"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/byCode")
    public SkillDto getSkillByCode(
            @RequestBody SkillByRoomAndCodeRequest request) {
        return skillService.fetchByRoomIdAndCode(request.getRoomId(), request.getCode());
    }

    @Operation(summary = "Получение навыков по коду класса",
            description = "Возвращает навыков по коду класса")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Навык"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/byClass")
    public List<SkillDto> getSkillByClassCode(
            @RequestBody SkillsByRoomAndClassRequest request) {
        return skillService.fetchByRoomIdAndClassCode(request.getRoomId(), request.getClassCode());
    }
}
