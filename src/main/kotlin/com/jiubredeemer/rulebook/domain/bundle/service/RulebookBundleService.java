package com.jiubredeemer.rulebook.domain.bundle.service;

import com.jiubredeemer.rulebook.dal.repository.background.BackgroundRepository;
import com.jiubredeemer.rulebook.dal.repository.bundle.RoomRulebookBundleRepository;
import com.jiubredeemer.rulebook.dal.repository.bundle.RoomRulebookContentRepository;
import com.jiubredeemer.rulebook.dal.repository.bundle.RulebookBundleRepository;
import com.jiubredeemer.rulebook.dal.repository.clazz.ClassRepository;
import com.jiubredeemer.rulebook.dal.repository.race.RaceRepository;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import com.jiubredeemer.rulebook.domain.bundle.dto.BundleCategoryEnum;
import com.jiubredeemer.rulebook.domain.bundle.dto.RulebookBundleContentDto;
import com.jiubredeemer.rulebook.domain.bundle.dto.RulebookBundleDto;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import com.jiubredeemer.rulebook.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Set;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RulebookBundleService {

    public static final UUID ZERO_UUID = UUID.fromString("00000000-0000-0000-0000-000000000000");

    private final RulebookBundleRepository rulebookBundleRepository;
    private final RoomRulebookBundleRepository roomRulebookBundleRepository;
    private final RoomRulebookContentRepository roomRulebookContentRepository;
    private final RaceRepository raceRepository;
    private final ClassRepository classRepository;
    private final BackgroundRepository backgroundRepository;

    public List<RulebookBundleDto> getAllBundles() {
        return rulebookBundleRepository.findAll();
    }

    public List<RulebookBundleDto> getVisibleBundles(UUID userId) {
        return rulebookBundleRepository.findVisibleForUser(userId);
    }

    public List<RulebookBundleDto> getOwnBundles(UUID userId) {
        return rulebookBundleRepository.findByOwner(userId);
    }

    public RulebookBundleDto getBundle(UUID id) {
        return rulebookBundleRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Rulebook bundle not found"));
    }

    public RulebookBundleDto createBundle(UUID ownerUserId, RulebookBundleDto dto) {
        return rulebookBundleRepository.create(dto, ownerUserId);
    }

    public RulebookBundleDto updateBundle(UUID id, UUID userId, RulebookBundleDto dto) {
        requireOwner(getBundle(id), userId);
        return rulebookBundleRepository.update(id, dto);
    }

    public void deleteBundle(UUID id, UUID userId) {
        requireOwner(getBundle(id), userId);
        raceRepository.deleteByBundle(id);
        classRepository.deleteByBundle(id);
        backgroundRepository.deleteByBundle(id);
        rulebookBundleRepository.deleteById(id);
    }

    private void requireOwner(RulebookBundleDto bundle, UUID userId) {
        if (bundle.getOwnerUserId() == null || !bundle.getOwnerUserId().equals(userId)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Only bundle owner can modify it");
        }
    }

    /**
     * Все бандлы с пометкой enabled в контексте комнаты.
     */
    public List<RulebookBundleDto> getBundlesForRoom(UUID roomId) {
        Set<UUID> enabled = Set.copyOf(roomRulebookBundleRepository.findEnabledBundleIds(roomId));
        List<RulebookBundleDto> bundles = rulebookBundleRepository.findAll();
        bundles.forEach(b -> b.setEnabled(enabled.contains(b.getId())));
        return bundles;
    }

    public void enableForRoom(UUID roomId, UUID bundleId) {
        roomRulebookBundleRepository.enable(roomId, bundleId);
    }

    public void disableForRoom(UUID roomId, UUID bundleId) {
        roomRulebookBundleRepository.disable(roomId, bundleId);
    }

    /**
     * Идентификаторы бандлов, из которых нужно собирать контент указанной категории.
     * Для реальной комнаты — включённые в ней бандлы; для «безкомнатного» превью
     * (ZERO_UUID) — бандлы издания, соответствующего forceRuleType.
     */
    public List<UUID> resolveBundleIds(UUID roomId, RuleTypeEnum forceRuleType, BundleCategoryEnum category) {
        if (roomId != null && !roomId.equals(ZERO_UUID)) {
            return roomRulebookBundleRepository.findEnabledBundleIdsByCategory(roomId, category);
        }
        String editionCode = editionCodeFor(forceRuleType);
        if (editionCode == null) {
            return List.of();
        }
        return rulebookBundleRepository.findIdsByEditionAndCategory(editionCode, category);
    }

    private String editionCodeFor(RuleTypeEnum forceRuleType) {
        if (forceRuleType == null) {
            return null;
        }
        return switch (forceRuleType) {
            case DND5E -> "2014";
            case DND2024 -> "2024";
            default -> null;
        };
    }

    // ---- Точечный выбор элементов набора в комнате ----

    /**
     * Id элементов (рас/классов/предысторий), точечно включённых в комнате.
     */
    public List<UUID> getEnabledContentIds(UUID roomId) {
        if (roomId == null || roomId.equals(ZERO_UUID)) {
            return List.of();
        }
        return roomRulebookContentRepository.findEnabledContentIds(roomId);
    }

    public void enableContentForRoom(UUID roomId, UUID contentId) {
        roomRulebookContentRepository.enable(roomId, contentId);
    }

    public void disableContentForRoom(UUID roomId, UUID contentId) {
        roomRulebookContentRepository.disable(roomId, contentId);
    }

    /**
     * Содержимое набора с пометкой enabled: элемент включён, если набор включён целиком
     * или элемент выбран точечно.
     */
    public List<RulebookBundleContentDto> getBundleContentForRoom(UUID roomId, UUID bundleId) {
        RulebookBundleDto bundle = getBundle(bundleId);
        boolean wholeEnabled = roomRulebookBundleRepository.findEnabledBundleIds(roomId).contains(bundleId);
        Set<UUID> selected = Set.copyOf(getEnabledContentIds(roomId));

        List<RulebookBundleContentDto> result = new java.util.ArrayList<>();
        BundleCategoryEnum category = bundle.getCategory();
        if (category == BundleCategoryEnum.RACE) {
            for (RaceDto r : raceRepository.getRacesByBundle(bundleId)) {
                result.add(new RulebookBundleContentDto(r.getId(), r.getName(),
                        wholeEnabled || selected.contains(r.getId())));
            }
        } else if (category == BundleCategoryEnum.CLAZZ) {
            for (ClazzDto c : classRepository.getClassesByBundle(bundleId)) {
                result.add(new RulebookBundleContentDto(c.getId(), c.getName(),
                        wholeEnabled || selected.contains(c.getId())));
            }
        } else if (category == BundleCategoryEnum.BACKGROUND) {
            for (BackgroundDto b : backgroundRepository.getBackgroundsByBundle(bundleId)) {
                result.add(new RulebookBundleContentDto(b.getId(), b.getName(),
                        wholeEnabled || selected.contains(b.getId())));
            }
        }
        return result;
    }
}
