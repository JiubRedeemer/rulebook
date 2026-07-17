package com.jiubredeemer.rulebook.domain.blueprint.controller;

import com.jiubredeemer.rulebook.domain.blueprint.dto.BlueprintDto;
import com.jiubredeemer.rulebook.domain.blueprint.service.BlueprintService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/blueprints")
@RequiredArgsConstructor
@Tag(name = "Blueprints Controller", description = "Чертежи магических предметов")
public class BlueprintController {

    private final BlueprintService blueprintService;

    @Operation(summary = "Чертежи, доступные комнате",
            description = "Каталожные (из включённых бандлов) + пользовательские чертежи комнаты")
    @GetMapping("/room/{roomId}")
    public List<BlueprintDto> getForRoom(
            @Parameter(description = "Идентификатор комнаты", required = true)
            @PathVariable UUID roomId,
            @Parameter(description = "Код класса, например ARTIFICER")
            @RequestParam(required = false) String groupCode,
            @Parameter(description = "Максимальный уровень (уровень персонажа)")
            @RequestParam(required = false) Integer maxLevel
    ) {
        return blueprintService.fetchAvailableForRoom(roomId, groupCode, maxLevel);
    }

    @Operation(summary = "Чертёж по id")
    @GetMapping("/{id}")
    public BlueprintDto getById(@PathVariable UUID id) {
        return blueprintService.fetchById(id);
    }

    @Operation(summary = "Чертежи набора")
    @GetMapping("/bundle/{bundleId}")
    public List<BlueprintDto> getByBundle(@PathVariable UUID bundleId) {
        return blueprintService.fetchByBundle(bundleId);
    }

    @Operation(summary = "Создать/обновить пользовательский чертёж")
    @PutMapping
    public BlueprintDto saveUserBlueprint(@RequestBody BlueprintDto request) {
        return blueprintService.saveUserBlueprint(request);
    }

    @Operation(summary = "Удалить пользовательский чертёж")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUserBlueprint(@PathVariable UUID id) {
        blueprintService.deleteUserBlueprint(id);
        return ResponseEntity.ok().build();
    }
}
