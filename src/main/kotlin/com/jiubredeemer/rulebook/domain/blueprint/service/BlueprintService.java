package com.jiubredeemer.rulebook.domain.blueprint.service;

import com.jiubredeemer.rulebook.dal.repository.blueprint.BlueprintRepository;
import com.jiubredeemer.rulebook.dal.repository.bundle.RoomRulebookBundleRepository;
import com.jiubredeemer.rulebook.dal.repository.bundle.RoomRulebookContentRepository;
import com.jiubredeemer.rulebook.domain.blueprint.dto.BlueprintDto;
import com.jiubredeemer.rulebook.domain.bundle.dto.BundleCategoryEnum;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BlueprintService {

    private final BlueprintRepository blueprintRepository;
    private final RoomRulebookBundleRepository roomRulebookBundleRepository;
    private final RoomRulebookContentRepository roomRulebookContentRepository;

    /**
     * Чертежи, доступные комнате: из включённых бандлов категории BLUEPRINT,
     * точечно включённые элементы и собственные чертежи комнаты.
     *
     * @param groupCode фильтр по классу (например ARTIFICER), может быть null
     * @param maxLevel  максимальный уровень персонажа, может быть null (без фильтра)
     */
    public List<BlueprintDto> fetchAvailableForRoom(UUID roomId, String groupCode, Integer maxLevel) {
        List<UUID> bundleIds = roomRulebookBundleRepository
                .findEnabledBundleIdsByCategory(roomId, BundleCategoryEnum.BLUEPRINT);
        List<UUID> contentIds = roomRulebookContentRepository.findEnabledContentIds(roomId);

        return blueprintRepository.getAllForRoom(roomId, bundleIds, contentIds).stream()
                .filter(bp -> groupCode == null || groupCode.equalsIgnoreCase(bp.getGroupCode()))
                .filter(bp -> maxLevel == null
                        || bp.getRequiredLevel() == null
                        || bp.getRequiredLevel() <= maxLevel)
                .toList();
    }

    public BlueprintDto fetchById(UUID id) {
        return blueprintRepository.findById(id).orElseThrow();
    }

    public List<BlueprintDto> fetchByBundle(UUID bundleId) {
        return blueprintRepository.getCatalogByBundle(bundleId);
    }

    public BlueprintDto saveUserBlueprint(BlueprintDto dto) {
        return blueprintRepository.saveUsers(dto);
    }

    public void deleteUserBlueprint(UUID id) {
        blueprintRepository.deleteUsers(id);
    }
}
