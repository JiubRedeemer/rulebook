package com.jiubredeemer.rulebook.dal.repository.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.Clazz;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eClazz;
import com.jiubredeemer.rulebook.dal.mapper.clazz.ClassMapper;
import com.jiubredeemer.rulebook.dal.mapper.clazz.Default5eClassMapper;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class ClassRepository {
    private final DSLContext dsl;
    private final ClassMapper classMapper;
    private final Default5eClassMapper default5eClassMapper;

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
