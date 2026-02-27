package com.jiubredeemer.rulebook.domain.clazz.controller;

import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzGroupDto;
import com.jiubredeemer.rulebook.domain.clazz.dto.request.ClassesByRoomRequest;
import com.jiubredeemer.rulebook.domain.clazz.service.ClazzService;
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
@RequestMapping("/api/class-groups")
@RequiredArgsConstructor
@Tag(name = "Class Grouping Controller", description = "Группировка подклассов по классам")
public class ClazzGroupingController {

    private final ClazzService clazzService;

    @Operation(summary = "Получение классов с подклассами для комнаты",
            description = "Возвращает список классов, где каждый класс содержит связанные подклассы")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список классов с подклассами успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<ClazzGroupDto> getGroupedClassesForRoom(
            @Parameter(description = "Идентификатор комнаты для получения классов и подклассов", required = true)
            @RequestBody ClassesByRoomRequest request) {
        return clazzService.fetchGroupedClassesForRoom(request.getRoomId());
    }
}
