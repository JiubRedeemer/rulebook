package com.jiubredeemer.rulebook.dal.repository.background;

import com.jiubredeemer.rulebook.dal.entity.tables.Background;
import com.jiubredeemer.rulebook.dal.mapper.background.BackgroundMapper;
import com.jiubredeemer.rulebook.dal.mapper.background.Default2024BackgroundMapper;
import com.jiubredeemer.rulebook.domain.background.dto.BackgroundDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class BackgroundRepository {
    private static final Table<Record> DEFAULT_2024_BACKGROUND = DSL.table(DSL.name("rules", "default_2024_background"));
    private static final Table<Record> DEFAULT_EBERRON_BACKGROUND = DSL.table(DSL.name("rules", "default_eberron_background"));
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);

    private final DSLContext dsl;
    private final Default2024BackgroundMapper default2024BackgroundMapper;
    private final BackgroundMapper backgroundMapper;

    public List<BackgroundDto> getFull2024BackgroundsForRoom() {
        return dsl.selectFrom(DEFAULT_2024_BACKGROUND)
                .fetch()
                .map(default2024BackgroundMapper);
    }

    public List<BackgroundDto> getFullBackgroundsForRoom(UUID roomId) {
        return dsl.selectFrom(Background.BACKGROUND)
                .where(Background.BACKGROUND.ROOMID.eq(roomId))
                .fetch()
                .map(backgroundMapper);
    }

    public BackgroundDto getFullBackgroundByIdForRoom(UUID id) {
        return dsl.selectFrom(Background.BACKGROUND)
                .where(Background.BACKGROUND.ID.eq(id))
                .fetchOptional()
                .map(backgroundMapper)
                .orElseThrow();
    }

    public Optional<BackgroundDto> getFullBackgroundByCode(String code) {
        return dsl.selectFrom(Background.BACKGROUND)
                .where(Background.BACKGROUND.CODE.eq(code))
                .fetchOptional()
                .map(backgroundMapper);
    }

    public Optional<BackgroundDto> getFull2024BackgroundByCode(String code) {
        return dsl.selectFrom(DEFAULT_2024_BACKGROUND)
                .where(CODE.eq(code))
                .fetchOptional()
                .map(default2024BackgroundMapper);
    }

    public List<BackgroundDto> getFullEberronBackgroundsForRoom() {
        return dsl.selectFrom(DEFAULT_EBERRON_BACKGROUND)
                .fetch()
                .map(default2024BackgroundMapper);
    }

    public Optional<BackgroundDto> getFullEberronBackgroundByCode(String code) {
        return dsl.selectFrom(DEFAULT_EBERRON_BACKGROUND)
                .where(CODE.eq(code))
                .fetchOptional()
                .map(default2024BackgroundMapper);
    }

    public BackgroundDto create(BackgroundDto backgroundDto) {
        dsl.insertInto(Background.BACKGROUND)
                .set(backgroundMapper.mapToRecord(backgroundDto))
                .execute();
        return getFullBackgroundByIdForRoom(backgroundDto.getId());
    }
}
