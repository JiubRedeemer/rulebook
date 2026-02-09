package com.jiubredeemer.rulebook.dal.repository.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.Clazz;
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

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class ClassRepository {
    private static final Table<Record> DEFAULT_2024_CLAZZ = DSL.table(DSL.name("rules", "default_2024_clazz"));
    private static final Field<String> DEFAULT_2024_CLAZZ_CODE = DSL.field(DSL.name("code"), String.class);

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

    public Optional<ClazzDto> getFullClassByCode(UUID roomId, String code) {
        return dsl.selectFrom(Clazz.CLAZZ)
                .where(Clazz.CLAZZ.ROOM_ID.eq(roomId))
                .and(Clazz.CLAZZ.CODE.eq(code))
                .fetchOptional()
                .map(classMapper);
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
}
