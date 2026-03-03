package com.jiubredeemer.rulebook.domain.clazz.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.clazz.dto.request.ClassesByRoomRequest;
import com.jiubredeemer.rulebook.domain.clazz.service.ClazzService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/classes")
@RequiredArgsConstructor
@Tag(name = "Class Controller", description = "Управление классами в системе")
public class ClazzController {

    private final ClazzService clazzService;

    @Operation(summary = "Получение доступных классов для комнаты",
            description = "Возвращает список доступных классов на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список классов успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<ClazzDto> getClassesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить список классов", required = true)
            @RequestBody ClassesByRoomRequest request) {
        return clazzService.fetchAvailableClassesForRoom(request.getRoomId());
    }

    @Operation(summary = "Получение доступных корневых классов для комнаты",
            description = "Возвращает список доступных корневых классов на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список классов успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/root")
    public List<ClazzDto> getRootClassesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить список корневых классов", required = true)
            @RequestBody ClassesByRoomRequest request) {
        return clazzService.fetchAvailableRootClassesForRoom(request.getRoomId());
    }

    @Operation(summary = "Получение доступных подклассов для комнаты",
            description = "Возвращает список доступных подклассов на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список подклассов успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/{code}/subclasses")
    public List<ClazzDto> getSubClassesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить список подклассов", required = true)
            @RequestBody ClassesByRoomRequest request,
            @PathVariable String code) {
        return clazzService.fetchAvailableSubClassesForRoom(request.getRoomId(), code);
    }

    @Operation(summary = "Получение доступных классов для комнаты",
            description = "Возвращает список доступных классов на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Класс по коду успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping("/{code}")
    public ClazzDto getClassByCode(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить класс по коду", required = true)
            @RequestBody ClassesByRoomRequest request,
            @PathVariable String code) {
        return clazzService.fetchByCode(request.getRoomId(), code);
    }

    @PutMapping()
    public ClazzDto create(@RequestBody ClazzDto clazzDto) throws JsonProcessingException {
        return clazzService.createClass(clazzDto);
    }
}
