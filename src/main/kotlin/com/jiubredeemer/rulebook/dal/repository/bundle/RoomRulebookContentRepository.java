package com.jiubredeemer.rulebook.dal.repository.bundle;

import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RoomRulebookContentRepository {

    private final DSLContext dsl;

    private static final org.jooq.Table<?> ROOM_CONTENT = DSL.table(DSL.name("rules", "room_rulebook_content"));

    public List<UUID> findEnabledContentIds(UUID roomId) {
        return dsl.select(DSL.field("content_id", UUID.class))
                .from(ROOM_CONTENT)
                .where(DSL.field("room_id", UUID.class).eq(roomId))
                .fetch(DSL.field("content_id", UUID.class));
    }

    public void enable(UUID roomId, UUID contentId) {
        dsl.insertInto(ROOM_CONTENT)
                .set(DSL.field("room_id", UUID.class), roomId)
                .set(DSL.field("content_id", UUID.class), contentId)
                .set(DSL.field("created_at", LocalDateTime.class), LocalDateTime.now())
                .onConflictDoNothing()
                .execute();
    }

    public void disable(UUID roomId, UUID contentId) {
        dsl.deleteFrom(ROOM_CONTENT)
                .where(DSL.field("room_id", UUID.class).eq(roomId)
                        .and(DSL.field("content_id", UUID.class).eq(contentId)))
                .execute();
    }
}
