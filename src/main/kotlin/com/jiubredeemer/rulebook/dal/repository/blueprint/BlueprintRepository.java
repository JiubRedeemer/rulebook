package com.jiubredeemer.rulebook.dal.repository.blueprint;

import com.jiubredeemer.rulebook.dal.entity.tables.Blueprint;
import com.jiubredeemer.rulebook.dal.entity.tables.UsersBlueprint;
import com.jiubredeemer.rulebook.dal.mapper.blueprint.BlueprintMapper;
import com.jiubredeemer.rulebook.domain.blueprint.dto.BlueprintDto;
import lombok.RequiredArgsConstructor;
import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class BlueprintRepository {

    private final DSLContext dsl;
    private final BlueprintMapper blueprintMapper;

    /**
     * Каталожные чертежи, доступные комнате: из включённых бандлов
     * либо точечно включённые по id.
     */
    public List<BlueprintDto> getCatalogForRoom(Collection<UUID> bundleIds, Collection<UUID> contentIds) {
        if ((bundleIds == null || bundleIds.isEmpty()) && (contentIds == null || contentIds.isEmpty())) {
            return List.of();
        }
        Condition condition = DSL.noCondition();
        if (bundleIds != null && !bundleIds.isEmpty()) {
            condition = Blueprint.BLUEPRINT.BUNDLE_ID.in(bundleIds);
        }
        if (contentIds != null && !contentIds.isEmpty()) {
            condition = condition.or(Blueprint.BLUEPRINT.ID.in(contentIds));
        }
        return dsl.selectFrom(Blueprint.BLUEPRINT)
                .where(condition)
                .and(Blueprint.BLUEPRINT.HIDDEN.isFalse())
                .orderBy(Blueprint.BLUEPRINT.REQUIRED_LEVEL, Blueprint.BLUEPRINT.NAME)
                .fetch()
                .map(blueprintMapper);
    }

    /** Пользовательские чертежи комнаты. */
    public List<BlueprintDto> getUsersForRoom(UUID roomId) {
        return dsl.selectFrom(UsersBlueprint.USERS_BLUEPRINT)
                .where(UsersBlueprint.USERS_BLUEPRINT.ROOM_ID.eq(roomId))
                .and(UsersBlueprint.USERS_BLUEPRINT.HIDDEN.isFalse())
                .orderBy(UsersBlueprint.USERS_BLUEPRINT.REQUIRED_LEVEL, UsersBlueprint.USERS_BLUEPRINT.NAME)
                .fetch()
                .stream()
                .map(blueprintMapper::mapUsers)
                .toList();
    }

    /** Каталог + пользовательские, объединённые. */
    public List<BlueprintDto> getAllForRoom(UUID roomId, Collection<UUID> bundleIds, Collection<UUID> contentIds) {
        List<BlueprintDto> result = new ArrayList<>(getCatalogForRoom(bundleIds, contentIds));
        result.addAll(getUsersForRoom(roomId));
        result.sort((a, b) -> {
            int byLevel = Integer.compare(
                    a.getRequiredLevel() != null ? a.getRequiredLevel() : 0,
                    b.getRequiredLevel() != null ? b.getRequiredLevel() : 0);
            return byLevel != 0 ? byLevel : String.valueOf(a.getName()).compareTo(String.valueOf(b.getName()));
        });
        return result;
    }

    public Optional<BlueprintDto> findById(UUID id) {
        BlueprintDto catalog = dsl.selectFrom(Blueprint.BLUEPRINT)
                .where(Blueprint.BLUEPRINT.ID.eq(id))
                .fetchOne(blueprintMapper);
        if (catalog != null) return Optional.of(catalog);
        return dsl.selectFrom(UsersBlueprint.USERS_BLUEPRINT)
                .where(UsersBlueprint.USERS_BLUEPRINT.ID.eq(id))
                .fetchOptional()
                .map(blueprintMapper::mapUsers);
    }

    public List<BlueprintDto> getCatalogByBundle(UUID bundleId) {
        return dsl.selectFrom(Blueprint.BLUEPRINT)
                .where(Blueprint.BLUEPRINT.BUNDLE_ID.eq(bundleId))
                .orderBy(Blueprint.BLUEPRINT.REQUIRED_LEVEL, Blueprint.BLUEPRINT.NAME)
                .fetch()
                .map(blueprintMapper);
    }

    // ——— Пользовательские чертежи: CRUD ———

    public BlueprintDto saveUsers(BlueprintDto dto) {
        var record = blueprintMapper.mapToUsersRecord(dto);
        if (record.getId() == null) {
            record.setId(UUID.randomUUID());
            dsl.insertInto(UsersBlueprint.USERS_BLUEPRINT).set(record).execute();
        } else {
            dsl.update(UsersBlueprint.USERS_BLUEPRINT)
                    .set(record)
                    .where(UsersBlueprint.USERS_BLUEPRINT.ID.eq(record.getId()))
                    .execute();
        }
        return blueprintMapper.mapUsers(record);
    }

    public void deleteUsers(UUID id) {
        dsl.deleteFrom(UsersBlueprint.USERS_BLUEPRINT)
                .where(UsersBlueprint.USERS_BLUEPRINT.ID.eq(id))
                .execute();
    }
}
