package com.jiubredeemer.rulebook.domain.classes.controller;

import com.jiubredeemer.rulebook.domain.classes.dto.ClassDto;
import com.jiubredeemer.rulebook.domain.classes.dto.request.ClassesByRoomRequest;
import com.jiubredeemer.rulebook.domain.classes.service.ClassService;
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
@RequestMapping("/api/classes")
@RequiredArgsConstructor
@Tag(name = "Class Controller", description = "Управление классами в системе")
public class ClassController {

    private final ClassService classService;

    @Operation(summary = "Получение доступных классов для комнаты",
            description = "Возвращает список доступных классов на основе идентификатора комнаты")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Список классов успешно получен"),
            @ApiResponse(responseCode = "400", description = "Некорректный идентификатор комнаты"),
            @ApiResponse(responseCode = "404", description = "Комната не найдена")
    })
    @PostMapping()
    public List<ClassDto> getClassesForRoom(
            @Parameter(description = "Идентификатор комнаты, для которой нужно получить список классов", required = true)
            @RequestBody ClassesByRoomRequest request) {
        return classService.fetchAvailableClassesForRoom(request.getRoomId());
    }
}
