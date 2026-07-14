package com.jiubredeemer.rulebook.domain.background.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jiubredeemer.rulebook.dal.repository.background.BackgroundRepository;
import com.jiubredeemer.rulebook.dal.repository.background.BackgroundStatsRepository;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundStatsDto;
import com.jiubredeemer.rulebook.domain.bundle.dto.BundleCategoryEnum;
import com.jiubredeemer.rulebook.domain.bundle.service.RulebookBundleService;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BackgroundService {
    public static final UUID ZERO_UUID = UUID.fromString("00000000-0000-0000-0000-000000000000");

    private final BackgroundRepository backgroundRepository;
    private final BackgroundStatsRepository backgroundStatsRepository;
    private final RoomService roomService;
    private final RulebookBundleService rulebookBundleService;

    private Collection<UUID> backgroundBundles(UUID roomId, RuleTypeEnum forceRuleType) {
        return rulebookBundleService.resolveBundleIds(roomId, forceRuleType, BundleCategoryEnum.BACKGROUND);
    }

    private Collection<UUID> roomContent(UUID roomId) {
        return rulebookBundleService.getEnabledContentIds(roomId);
    }

    public List<BackgroundDto> fetchAvailableBackgroundsForRoom(UUID roomId, RuleTypeEnum forceRuleType) {
        return backgroundRepository.getBackgroundsForRoomAndBundles(roomId, backgroundBundles(roomId, forceRuleType), roomContent(roomId)).stream()
                .map(dto -> enrichOnRead(dto, roomId))
                .toList();
    }

    public BackgroundDto fetchByCode(String code, UUID roomId) {
        // room + включённые наборы, затем fallback — любая предыстория набора (для персонажей с отключённым набором).
        return backgroundRepository.getBackgroundByCodeForRoomAndBundles(roomId, backgroundBundles(roomId, null), roomContent(roomId), code)
                .or(() -> backgroundRepository.getBackgroundByCodeInAnyBundle(code))
                .map(dto -> enrichOnRead(dto, roomId))
                .orElseThrow(() -> new NotFoundException("Background not found by code"));
    }

    public BackgroundDto create(BackgroundDto backgroundDto) throws JsonProcessingException {
        RoomDto roomDto = roomService.getById(backgroundDto.getRoomId());
        backgroundDto.setId(UUID.randomUUID());
        backgroundDto.setHidden(backgroundDto.getHidden() != null ? backgroundDto.getHidden() : false);
        backgroundDto.setImgUrl(backgroundDto.getImgUrl() == null ? backgroundDto.getId().toString() : backgroundDto.getImgUrl());
        backgroundDto.setCode(backgroundDto.getCode() == null ? backgroundDto.getId().toString() : backgroundDto.getCode());
        if (backgroundDto.getStats().getId() != null) {
            backgroundDto.getStats().setId(backgroundDto.getStats().getId());
        } else {
            backgroundDto.getStats().setId(UUID.randomUUID());
            final BackgroundStatsDto backgroundStatsDto = backgroundStatsRepository.create(backgroundDto.getStats());
            backgroundDto.setStats(backgroundStatsDto);
        }
        return backgroundRepository.create(backgroundDto);
    }

    public BackgroundDto update(BackgroundDto backgroundDto) throws JsonProcessingException {
        final BackgroundDto existing = backgroundRepository.getFullBackgroundByIdForRoom(backgroundDto.getId());
        final UUID roomId = backgroundDto.getRoomId() != null ? backgroundDto.getRoomId() : existing.getRoomId();
        roomService.getById(roomId);

        backgroundDto.setRoomId(roomId);
        backgroundDto.setName(backgroundDto.getName() != null ? backgroundDto.getName() : existing.getName());
        backgroundDto.setDescription(backgroundDto.getDescription() != null ? backgroundDto.getDescription() : existing.getDescription());
        backgroundDto.setHidden(backgroundDto.getHidden() != null ? backgroundDto.getHidden() : existing.getHidden());
        backgroundDto.setCode(backgroundDto.getCode() != null ? backgroundDto.getCode() : existing.getCode());
        backgroundDto.setImgUrl(backgroundDto.getImgUrl() != null ? backgroundDto.getImgUrl() : existing.getImgUrl());

        final BackgroundStatsDto statsForUpdate = backgroundDto.getStats() != null ? backgroundDto.getStats() : existing.getStats();
        if (statsForUpdate == null) {
            throw new NotFoundException("Background stats not found");
        }
        statsForUpdate.setId(UUID.randomUUID());
        final BackgroundStatsDto backgroundStatsDto = backgroundStatsRepository.create(statsForUpdate);
        backgroundDto.setStats(backgroundStatsDto);

        return backgroundRepository.update(backgroundDto);
    }

    public BackgroundDto setHidden(UUID id, Boolean hidden) {
        return backgroundRepository.setHidden(id, hidden);
    }

    // ---- Авторство: предыстории внутри бандла ----

    public List<BackgroundDto> getBackgroundsByBundle(UUID bundleId) {
        return backgroundRepository.getBackgroundsByBundle(bundleId).stream()
                .map(dto -> enrichOnRead(dto, null))
                .toList();
    }

    public BackgroundDto saveBackgroundInBundle(UUID bundleId, BackgroundDto backgroundDto) throws JsonProcessingException {
        if (backgroundDto.getStats() == null) {
            throw new NotFoundException("Background stats not found");
        }
        boolean isUpdate = backgroundDto.getId() != null;
        backgroundDto.setHidden(backgroundDto.getHidden() != null ? backgroundDto.getHidden() : false);
        backgroundDto.getStats().setId(UUID.randomUUID());
        backgroundDto.setStats(backgroundStatsRepository.create(backgroundDto.getStats()));
        if (isUpdate) {
            backgroundDto.setRoomId(null);
            return backgroundRepository.update(backgroundDto);
        }
        backgroundDto.setId(UUID.randomUUID());
        backgroundDto.setCode(backgroundDto.getCode() != null ? backgroundDto.getCode() : backgroundDto.getId().toString());
        backgroundDto.setImgUrl(backgroundDto.getImgUrl() == null ? backgroundDto.getId().toString() : backgroundDto.getImgUrl());
        backgroundDto.setRoomId(null);
        return backgroundRepository.createBackgroundForBundle(bundleId, backgroundDto);
    }

    public void deleteBackground(UUID id) {
        backgroundRepository.deleteById(id);
    }

    private BackgroundDto enrichOnRead(BackgroundDto dto, UUID roomId) {
        dto.setRoomId(roomId);
        if (dto.getStats() != null && dto.getStats().getId() != null) {
            dto.setStats(backgroundStatsRepository.findById(dto.getStats().getId()));
        }
        return dto;
    }
}
