package com.jiubredeemer.rulebook.dal.repository.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.Clazz;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_2024Clazz;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eClazz;
import com.jiubredeemer.rulebook.dal.mapper.clazz.ClassMapper;
import com.jiubredeemer.rulebook.dal.mapper.clazz.Default2024ClassMapper;
import com.jiubredeemer.rulebook.dal.mapper.clazz.Default5eClassMapper;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class ClassRepository {
    private static final Table<Record> DEFAULT_2024_CLAZZ = DSL.table(DSL.name("rules", "default_2024_clazz"));
    private static final Field<String> DEFAULT_2024_CLAZZ_CODE = DSL.field(DSL.name("code"), String.class);
    private static final Table<Record> SRD_2024_CLAZZ = DSL.table(DSL.name("rules", "srd_2024_clazz"));
    private static final Field<String> SRD_2024_CLAZZ_CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<Boolean> HIDDEN = DSL.field(DSL.name("hidden"), Boolean.class);

    private final DSLContext dsl;
    private final ClassMapper classMapper;
    private final Default5eClassMapper default5eClassMapper;
    private final Default2024ClassMapper default2024ClassMapper;

    public List<ClazzDto> getFullClassesForRoom(UUID roomId) {
        return dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ROOM_ID.eq(roomId))
                .fetch()
                .map(classMapper);
    }

    public List<ClazzDto> getFull5eClassesForRoom() {
        return dsl.selectFrom(Default_5eClazz.DEFAULT_5E_CLAZZ)
                .fetch()
                .map(default5eClassMapper);
    }

    public List<ClazzDto> getFull2024ClassesForRoom() {
        return dsl.selectFrom(DEFAULT_2024_CLAZZ)
                .fetch()
                .map(default2024ClassMapper);
    }

    public List<ClazzDto> getFull2024SrdClassesForRoom() {
        return dsl.selectFrom(SRD_2024_CLAZZ)
                .fetch()
                .map(default2024ClassMapper);
    }

    public Optional<ClazzDto> getFullClassByCode(UUID roomId, String code) {
        return dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ROOM_ID.eq(roomId))
                .and(Clazz.CLAZZ.CODE.eq(code))
                .fetchOptional()
                .map(classMapper);
    }

    public Optional<ClazzDto> getFullClassById(UUID clazzId) {
        return dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ID.eq(clazzId))
                .fetchOptional()
                .map(classMapper)
                .map(dto -> {
                    dto.setHidden(fetchHiddenById(clazzId));
                    return dto;
                });
    }

    public Optional<ClazzDto> getFull5eClassByCode(String code) {
        return dsl.selectFrom(Default_5eClazz.DEFAULT_5E_CLAZZ)
                .where(Default_5eClazz.DEFAULT_5E_CLAZZ.CODE.eq(code))
                .fetchOptional()
                .map(default5eClassMapper);
    }

    public Optional<ClazzDto> getFull2024ClassByCode(String code) {
        return dsl.selectFrom(DEFAULT_2024_CLAZZ)
                .where(DEFAULT_2024_CLAZZ_CODE.eq(code))
                .fetchOptional()
                .map(default2024ClassMapper);
    }

    public Optional<ClazzDto> getFull2024SrdClassByCode(String code) {
        return dsl.selectFrom(SRD_2024_CLAZZ)
                .where(SRD_2024_CLAZZ_CODE.eq(code))
                .fetchOptional()
                .map(default2024ClassMapper);
    }

    public Optional<ClazzDto> getFull5eRaceByCode(String code) {
        return dsl.selectFrom(Default_5eClazz.DEFAULT_5E_CLAZZ)
                .where(Default_5eClazz.DEFAULT_5E_CLAZZ.CODE.eq(code))
                .fetchOptional()
                .map(default5eClassMapper);
    }

    public Optional<ClazzDto> getFullRaceByCode(String code, UUID roomId) {
        return dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ROOM_ID.eq(roomId))
                .and(Clazz.CLAZZ.CODE.eq(code))
                .fetchOptional()
                .map(classMapper);
    }

    public Collection<ClazzDto> getFull5eRootClassesForRoom() {
        return dsl.selectFrom(Default_5eClazz.DEFAULT_5E_CLAZZ)
                .where(Default_5eClazz.DEFAULT_5E_CLAZZ.GROUP_CODE
                        .eq(Default_5eClazz.DEFAULT_5E_CLAZZ.CODE))
                .or(Default_5eClazz.DEFAULT_5E_CLAZZ.GROUP_CODE.isNull())
                .fetch()
                .map(default5eClassMapper);
    }

    public Collection<ClazzDto> getFull2024RootClassesForRoom() {
        return dsl.selectFrom(Default_2024Clazz.DEFAULT_2024_CLAZZ)
                .where(Default_2024Clazz.DEFAULT_2024_CLAZZ.GROUP_CODE
                        .eq(Default_2024Clazz.DEFAULT_2024_CLAZZ.CODE))
                .or(Default_2024Clazz.DEFAULT_2024_CLAZZ.GROUP_CODE.isNull())
                .fetch()
                .map(default2024ClassMapper);
    }

    public Collection<ClazzDto> getFull2024SrdRootClassesForRoom() {
        Field<String> groupCode = DSL.field(DSL.name("group_code"), String.class);
        Field<String> code = DSL.field(DSL.name("code"), String.class);
        return dsl.selectFrom(SRD_2024_CLAZZ)
                .where(groupCode.eq(code))
                .or(groupCode.isNull())
                .fetch()
                .map(default2024ClassMapper);
    }

    public Collection<ClazzDto> getFullRootClassesForRoom(UUID roomId) {
        return dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ROOM_ID.eq(roomId))
                .and(Clazz.CLAZZ.GROUP_CODE.eq(Clazz.CLAZZ.CODE)
                        .or(Clazz.CLAZZ.GROUP_CODE.isNull()))
                .fetch()
                .map(classMapper);
    }

    public Collection<ClazzDto> getFullSubClassesForRoom(UUID roomId, String code) {
        return dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ROOM_ID.eq(roomId))
                .and(Clazz.CLAZZ.GROUP_CODE.eq(code))
                .fetch()
                .map(classMapper);
    }

    public Collection<ClazzDto> getFull5eSubClassesForRoom(String code) {
        return dsl.selectFrom(Default_5eClazz.DEFAULT_5E_CLAZZ)
                .where(Default_5eClazz.DEFAULT_5E_CLAZZ.GROUP_CODE.eq(code))
                .fetch()
                .map(default5eClassMapper);
    }

    public Collection<ClazzDto> getFull2024SubClassesForRoom(String code) {
        return dsl.selectFrom(Default_2024Clazz.DEFAULT_2024_CLAZZ)
                .where(Default_2024Clazz.DEFAULT_2024_CLAZZ.GROUP_CODE.eq(code))
                .fetch()
                .map(default2024ClassMapper);
    }

    public Collection<ClazzDto> getFull2024SrdSubClassesForRoom(String code) {
        Field<String> groupCode = DSL.field(DSL.name("group_code"), String.class);
        return dsl.selectFrom(SRD_2024_CLAZZ)
                .where(groupCode.eq(code))
                .fetch()
                .map(default2024ClassMapper);
    }

    public ClazzDto createClass(ClazzDto clazzDto) {
        dsl.insertInto(Clazz.CLAZZ)
                .set(classMapper.mapToRecord(clazzDto))
                .set(HIDDEN, clazzDto.getHidden())
                .execute();
        final ClazzDto dto = dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ID.eq(clazzDto.getId()))
                .fetchOptional()
                .map(classMapper).orElseThrow();
        dto.setHidden(fetchHiddenById(clazzDto.getId()));
        return dto;
    }

    public ClazzDto updateClass(ClazzDto clazzDto) {
        dsl.update(Clazz.CLAZZ)
                .set(classMapper.mapToRecord(clazzDto))
                .set(HIDDEN, clazzDto.getHidden())
                .where(Clazz.CLAZZ.ID.eq(clazzDto.getId()))
                .execute();


        final ClazzDto dto = dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ID.eq(clazzDto.getId()))
                .fetchOptional()
                .map(classMapper).orElseThrow();
        dto.setHidden(fetchHiddenById(clazzDto.getId()));
        return dto;
    }

    public ClazzDto setHidden(UUID id, Boolean hidden) {
        dsl.update(Clazz.CLAZZ)
                .set(HIDDEN, hidden)
                .where(Clazz.CLAZZ.ID.eq(id))
                .execute();
        final ClazzDto dto = getFullClassById(id).orElseThrow();
        dto.setHidden(fetchHiddenById(id));
        return dto;
    }

    private Boolean fetchHiddenById(UUID id) {
        return dsl.select(HIDDEN)
                .from(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ID.eq(id))
                .fetchOne(HIDDEN);
    }
}
