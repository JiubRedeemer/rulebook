package com.jiubredeemer.rulebook.dal.repository.bundle;

import com.jiubredeemer.rulebook.domain.bundle.dto.BundleCategoryEnum;
import com.jiubredeemer.rulebook.domain.bundle.dto.RulebookBundleDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Record;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RulebookBundleRepository {

    private final DSLContext dsl;

    private static final org.jooq.Table<?> BUNDLE = DSL.table(DSL.name("rules", "rulebook_bundle"));

    private RulebookBundleDto map(Record r) {
        RulebookBundleDto dto = new RulebookBundleDto();
        dto.setId(r.get(DSL.field("id", UUID.class)));
        dto.setName(r.get(DSL.field("name", String.class)));
        dto.setEditionCode(r.get(DSL.field("edition_code", String.class)));
        String category = r.get(DSL.field("category", String.class));
        dto.setCategory(category != null ? BundleCategoryEnum.valueOf(category) : null);
        dto.setDescription(r.get(DSL.field("description", String.class)));
        dto.setImgUrl(r.get(DSL.field("img_url", String.class)));
        dto.setIsPublic(r.get(DSL.field("is_public", Boolean.class)));
        dto.setOwnerUserId(r.get(DSL.field("owner_user_id", UUID.class)));
        dto.setSortOrder(r.get(DSL.field("sort_order", Integer.class)));
        dto.setCreatedAt(r.get(DSL.field("created_at", LocalDateTime.class)));
        return dto;
    }

    private org.jooq.SelectJoinStep<? extends Record> selectBundles() {
        return dsl.select(
                        DSL.field("id", UUID.class),
                        DSL.field("name", String.class),
                        DSL.field("edition_code", String.class),
                        DSL.field("category", String.class),
                        DSL.field("description", String.class),
                        DSL.field("img_url", String.class),
                        DSL.field("is_public", Boolean.class),
                        DSL.field("owner_user_id", UUID.class),
                        DSL.field("sort_order", Integer.class),
                        DSL.field("created_at", LocalDateTime.class)
                ).from(BUNDLE);
    }

    public List<RulebookBundleDto> findAll() {
        return selectBundles()
                .orderBy(DSL.field("sort_order"), DSL.field("name"))
                .fetch(this::map);
    }

    public Optional<RulebookBundleDto> findById(UUID id) {
        return selectBundles()
                .where(DSL.field("id", UUID.class).eq(id))
                .fetchOptional(this::map);
    }

    public List<UUID> findIdsByEditionAndCategory(String editionCode, BundleCategoryEnum category) {
        return dsl.select(DSL.field("id", UUID.class))
                .from(BUNDLE)
                .where(DSL.field("edition_code", String.class).eq(editionCode)
                        .and(DSL.field("category", String.class).eq(category.name())))
                .fetch(DSL.field("id", UUID.class));
    }

    /**
     * Бандлы, видимые пользователю: системные (owner_user_id IS NULL) + публичные + собственные.
     */
    public List<RulebookBundleDto> findVisibleForUser(UUID userId) {
        org.jooq.Condition condition = DSL.field("owner_user_id", UUID.class).isNull()
                .or(DSL.field("is_public", Boolean.class).isTrue());
        if (userId != null) {
            condition = condition.or(DSL.field("owner_user_id", UUID.class).eq(userId));
        }
        return selectBundles()
                .where(condition)
                .orderBy(DSL.field("sort_order"), DSL.field("name"))
                .fetch(this::map);
    }

    public List<RulebookBundleDto> findByOwner(UUID ownerUserId) {
        return selectBundles()
                .where(DSL.field("owner_user_id", UUID.class).eq(ownerUserId))
                .orderBy(DSL.field("sort_order"), DSL.field("name"))
                .fetch(this::map);
    }

    public RulebookBundleDto create(RulebookBundleDto dto, UUID ownerUserId) {
        UUID id = UUID.randomUUID();
        dsl.insertInto(BUNDLE)
                .set(DSL.field("id", UUID.class), id)
                .set(DSL.field("name", String.class), dto.getName())
                .set(DSL.field("edition_code", String.class), dto.getEditionCode())
                .set(DSL.field("category", String.class), dto.getCategory() != null ? dto.getCategory().name() : null)
                .set(DSL.field("description", String.class), dto.getDescription())
                .set(DSL.field("img_url", String.class), dto.getImgUrl())
                .set(DSL.field("is_public", Boolean.class), dto.getIsPublic() != null && dto.getIsPublic())
                .set(DSL.field("owner_user_id", UUID.class), ownerUserId)
                .set(DSL.field("sort_order", Integer.class), dto.getSortOrder() != null ? dto.getSortOrder() : 0)
                .set(DSL.field("created_at", LocalDateTime.class), LocalDateTime.now())
                .execute();
        return findById(id).orElseThrow();
    }

    public RulebookBundleDto update(UUID id, RulebookBundleDto dto) {
        dsl.update(BUNDLE)
                .set(DSL.field("name", String.class), dto.getName())
                .set(DSL.field("edition_code", String.class), dto.getEditionCode())
                .set(DSL.field("category", String.class), dto.getCategory() != null ? dto.getCategory().name() : null)
                .set(DSL.field("description", String.class), dto.getDescription())
                .set(DSL.field("img_url", String.class), dto.getImgUrl())
                .set(DSL.field("is_public", Boolean.class), dto.getIsPublic() != null && dto.getIsPublic())
                .where(DSL.field("id", UUID.class).eq(id))
                .execute();
        return findById(id).orElseThrow();
    }

    public void deleteById(UUID id) {
        dsl.deleteFrom(BUNDLE).where(DSL.field("id", UUID.class).eq(id)).execute();
    }
}
