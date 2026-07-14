package com.jiubredeemer.rulebook.dal.repository.bundle;

import com.jiubredeemer.rulebook.domain.bundle.dto.BundleCategoryEnum;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RoomRulebookBundleRepository {

    private final DSLContext dsl;

    private static final org.jooq.Table<?> ROOM_BUNDLE = DSL.table(DSL.name("rules", "room_rulebook_bundle"));
    private static final org.jooq.Table<?> BUNDLE = DSL.table(DSL.name("rules", "rulebook_bundle"));

    public List<UUID> findEnabledBundleIds(UUID roomId) {
        return dsl.select(DSL.field("rulebook_bundle_id", UUID.class))
                .from(ROOM_BUNDLE)
                .where(DSL.field("room_id", UUID.class).eq(roomId))
                .fetch(DSL.field("rulebook_bundle_id", UUID.class));
    }

    /**
     * Включённые в комнате бандлы указанной категории (RACE/CLAZZ/BACKGROUND).
     */
    public List<UUID> findEnabledBundleIdsByCategory(UUID roomId, BundleCategoryEnum category) {
        return dsl.select(DSL.field("rrb.rulebook_bundle_id", UUID.class))
                .from(ROOM_BUNDLE.as("rrb"))
                .join(BUNDLE.as("b"))
                .on(DSL.field("b.id", UUID.class).eq(DSL.field("rrb.rulebook_bundle_id", UUID.class)))
                .where(DSL.field("rrb.room_id", UUID.class).eq(roomId)
                        .and(DSL.field("b.category", String.class).eq(category.name())))
                .fetch(DSL.field("rrb.rulebook_bundle_id", UUID.class));
    }

    public void enable(UUID roomId, UUID bundleId) {
        dsl.insertInto(ROOM_BUNDLE)
                .set(DSL.field("room_id", UUID.class), roomId)
                .set(DSL.field("rulebook_bundle_id", UUID.class), bundleId)
                .set(DSL.field("created_at", LocalDateTime.class), LocalDateTime.now())
                .onConflictDoNothing()
                .execute();
    }

    public void disable(UUID roomId, UUID bundleId) {
        dsl.deleteFrom(ROOM_BUNDLE)
                .where(DSL.field("room_id", UUID.class).eq(roomId)
                        .and(DSL.field("rulebook_bundle_id", UUID.class).eq(bundleId)))
                .execute();
    }
}
