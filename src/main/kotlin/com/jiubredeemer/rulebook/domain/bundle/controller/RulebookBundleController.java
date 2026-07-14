package com.jiubredeemer.rulebook.domain.bundle.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import com.jiubredeemer.rulebook.domain.background.service.BackgroundService;
import com.jiubredeemer.rulebook.domain.bundle.dto.RulebookBundleDto;
import com.jiubredeemer.rulebook.domain.bundle.service.RulebookBundleService;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.clazz.service.ClazzService;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.race.service.RaceService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/rulebook-bundles")
@RequiredArgsConstructor
@Tag(name = "Rulebook Bundle Controller", description = "Наборы правил (издания) рас/классов/предысторий")
public class RulebookBundleController {

    private final RulebookBundleService rulebookBundleService;
    private final RaceService raceService;
    private final ClazzService clazzService;
    private final BackgroundService backgroundService;

    // ---- Реестр / вкл-выкл в комнате ----

    @GetMapping
    public List<RulebookBundleDto> getAllBundles() {
        return rulebookBundleService.getAllBundles();
    }

    @GetMapping("/rooms/{roomId}")
    public List<RulebookBundleDto> getBundlesForRoom(@PathVariable UUID roomId) {
        return rulebookBundleService.getBundlesForRoom(roomId);
    }

    @PutMapping("/rooms/{roomId}/{bundleId}")
    public void enableBundleForRoom(@PathVariable UUID roomId, @PathVariable UUID bundleId) {
        rulebookBundleService.enableForRoom(roomId, bundleId);
    }

    @DeleteMapping("/rooms/{roomId}/{bundleId}")
    public void disableBundleForRoom(@PathVariable UUID roomId, @PathVariable UUID bundleId) {
        rulebookBundleService.disableForRoom(roomId, bundleId);
    }

    // ---- Точечный выбор элементов набора в комнате ----

    @GetMapping("/rooms/{roomId}/{bundleId}/content")
    public List<com.jiubredeemer.rulebook.domain.bundle.dto.RulebookBundleContentDto> getBundleContentForRoom(
            @PathVariable UUID roomId, @PathVariable UUID bundleId) {
        return rulebookBundleService.getBundleContentForRoom(roomId, bundleId);
    }

    @PutMapping("/rooms/{roomId}/content/{contentId}")
    public void enableContentForRoom(@PathVariable UUID roomId, @PathVariable UUID contentId) {
        rulebookBundleService.enableContentForRoom(roomId, contentId);
    }

    @DeleteMapping("/rooms/{roomId}/content/{contentId}")
    public void disableContentForRoom(@PathVariable UUID roomId, @PathVariable UUID contentId) {
        rulebookBundleService.disableContentForRoom(roomId, contentId);
    }

    // ---- Авторство бандлов ----

    @GetMapping("/visible/{userId}")
    public List<RulebookBundleDto> getVisibleBundles(@PathVariable UUID userId) {
        return rulebookBundleService.getVisibleBundles(userId);
    }

    @GetMapping("/own/{userId}")
    public List<RulebookBundleDto> getOwnBundles(@PathVariable UUID userId) {
        return rulebookBundleService.getOwnBundles(userId);
    }

    @GetMapping("/{bundleId}")
    public RulebookBundleDto getBundle(@PathVariable UUID bundleId) {
        return rulebookBundleService.getBundle(bundleId);
    }

    @PostMapping("/{userId}")
    public RulebookBundleDto createBundle(@PathVariable UUID userId, @RequestBody RulebookBundleDto dto) {
        return rulebookBundleService.createBundle(userId, dto);
    }

    @PutMapping("/{bundleId}/{userId}")
    public RulebookBundleDto updateBundle(@PathVariable UUID bundleId, @PathVariable UUID userId,
                                          @RequestBody RulebookBundleDto dto) {
        return rulebookBundleService.updateBundle(bundleId, userId, dto);
    }

    @DeleteMapping("/{bundleId}/{userId}")
    public void deleteBundle(@PathVariable UUID bundleId, @PathVariable UUID userId) {
        rulebookBundleService.deleteBundle(bundleId, userId);
    }

    // ---- Контент бандла: расы ----

    @GetMapping("/{bundleId}/races")
    public List<RaceDto> getBundleRaces(@PathVariable UUID bundleId) {
        return raceService.getRacesByBundle(bundleId);
    }

    @PutMapping("/{bundleId}/races")
    public RaceDto saveBundleRace(@PathVariable UUID bundleId, @RequestBody RaceDto raceDto) throws JsonProcessingException {
        return raceService.saveRaceInBundle(bundleId, raceDto);
    }

    @DeleteMapping("/races/{raceId}")
    public void deleteBundleRace(@PathVariable UUID raceId) {
        raceService.deleteRace(raceId);
    }

    // ---- Контент бандла: классы ----

    @GetMapping("/{bundleId}/classes")
    public List<ClazzDto> getBundleClasses(@PathVariable UUID bundleId) {
        return clazzService.getClassesByBundle(bundleId);
    }

    @PutMapping("/{bundleId}/classes")
    public ClazzDto saveBundleClass(@PathVariable UUID bundleId, @RequestBody ClazzDto clazzDto) throws JsonProcessingException {
        return clazzService.saveClassInBundle(bundleId, clazzDto);
    }

    @DeleteMapping("/classes/{classId}")
    public void deleteBundleClass(@PathVariable UUID classId) {
        clazzService.deleteClass(classId);
    }

    // ---- Контент бандла: предыстории ----

    @GetMapping("/{bundleId}/backgrounds")
    public List<BackgroundDto> getBundleBackgrounds(@PathVariable UUID bundleId) {
        return backgroundService.getBackgroundsByBundle(bundleId);
    }

    @PutMapping("/{bundleId}/backgrounds")
    public BackgroundDto saveBundleBackground(@PathVariable UUID bundleId, @RequestBody BackgroundDto backgroundDto) throws JsonProcessingException {
        return backgroundService.saveBackgroundInBundle(bundleId, backgroundDto);
    }

    @DeleteMapping("/backgrounds/{backgroundId}")
    public void deleteBundleBackground(@PathVariable UUID backgroundId) {
        backgroundService.deleteBackground(backgroundId);
    }
}
