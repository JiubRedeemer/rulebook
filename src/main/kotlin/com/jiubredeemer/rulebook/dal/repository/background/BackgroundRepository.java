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
    private static final Table<Record> SRD_2024_BACKGROUND = DSL.table(DSL.name("rules", "srd_2024_background"));
    private static final Field<String> CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<Boolean> HIDDEN = DSL.field(DSL.name("hidden"), Boolean.class);

    private final DSLContext dsl;
    private final Default2024BackgroundMapper default2024BackgroundMapper;
    private final BackgroundMapper backgroundMapper;

    public List<BackgroundDto> getFull2024BackgroundsForRoom() {
        return dsl.selectFrom(DEFAULT_2024_BACKGROUND)
                .fetch()
                .map(default2024BackgroundMapper);
    }

    public List<BackgroundDto> getFull2024SrdBackgroundsForRoom() {
        return dsl.selectFrom(SRD_2024_BACKGROUND)
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
        final BackgroundDto dto = dsl.selectFrom(Background.BACKGROUND)
                .where(Background.BACKGROUND.ID.eq(id))
                .fetchOptional()
                .map(backgroundMapper)
                .orElseThrow();
        dto.setHidden(fetchHiddenById(id));
        return dto;
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

    public Optional<BackgroundDto> getFull2024SrdBackgroundByCode(String code) {
        return dsl.selectFrom(SRD_2024_BACKGROUND)
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
                .set(HIDDEN, backgroundDto.getHidden())
                .execute();
        final BackgroundDto dto = getFullBackgroundByIdForRoom(backgroundDto.getId());
        dto.setHidden(fetchHiddenById(backgroundDto.getId()));
        return dto;
    }

    public BackgroundDto update(BackgroundDto backgroundDto) {
        dsl.update(Background.BACKGROUND)
                .set(backgroundMapper.mapToRecord(backgroundDto))
                .set(HIDDEN, backgroundDto.getHidden())
                .where(Background.BACKGROUND.ID.eq(backgroundDto.getId()))
                .execute();
        final BackgroundDto dto = getFullBackgroundByIdForRoom(backgroundDto.getId());
        dto.setHidden(fetchHiddenById(backgroundDto.getId()));
        return dto;
    }

    public BackgroundDto setHidden(UUID id, Boolean hidden) {
        dsl.update(Background.BACKGROUND)
                .set(HIDDEN, hidden)
                .where(Background.BACKGROUND.ID.eq(id))
                .execute();
        final BackgroundDto dto = getFullBackgroundByIdForRoom(id);
        dto.setHidden(fetchHiddenById(id));
        return dto;
    }

    private Boolean fetchHiddenById(UUID id) {
        return dsl.select(HIDDEN)
                .from(Background.BACKGROUND)
                .where(Background.BACKGROUND.ID.eq(id))
                .fetchOne(HIDDEN);
    }
}
