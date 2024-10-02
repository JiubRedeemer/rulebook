package com.jiubredeemer.rulebook.dal.repository.clazz;

import com.jiubredeemer.rulebook.dal.entity.tables.Classes;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eClasses;
import com.jiubredeemer.rulebook.dal.mapper.clazz.ClassMapper;
import com.jiubredeemer.rulebook.dal.mapper.clazz.Default5eClassMapper;
import com.jiubredeemer.rulebook.domain.classes.dto.ClassDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class ClassRepository {
    private final DSLContext dsl;
    private final ClassMapper classMapper;
    private final Default5eClassMapper default5eClassMapper;

    public List<ClassDto> getFullClassesForRoom(UUID roomId) {
        return dsl.selectFrom(Classes.CLASSES)
                .where(Classes.CLASSES.ROOM_ID.eq(roomId))
                .fetch()
                .map(classMapper);
    }

    public List<ClassDto> getFull5eClassesForRoom() {
        return dsl.selectFrom(Default_5eClasses.DEFAULT_5E_CLASSES)
                .fetch()
                .map(default5eClassMapper);
    }
}
