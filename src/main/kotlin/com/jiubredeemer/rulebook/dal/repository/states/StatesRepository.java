package com.jiubredeemer.rulebook.dal.repository.states;

import com.jiubredeemer.rulebook.dal.entity.tables.DefaultStates;
import com.jiubredeemer.rulebook.domain.states.dto.StateDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class StatesRepository {
    private final DSLContext dsl;

    public List<StateDto> getFullForRoom(UUID roomId) {
        return Objects.requireNonNull(dsl.selectFrom(DefaultStates.DEFAULT_STATES)
                        .fetch())
                .map(skillRecord -> skillRecord.into(StateDto.class));
    }

    public Optional<StateDto> getByRoomIdAndCode(UUID roomId, String code) {
        return dsl.selectFrom(DefaultStates.DEFAULT_STATES)
                .where(DefaultStates.DEFAULT_STATES.CODE.eq(code))
                .fetchOptional()
                .map(skillRecord -> skillRecord.into(StateDto.class));
    }
}
