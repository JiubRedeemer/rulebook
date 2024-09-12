package com.jiubredeemer.rulebook.dal.repository.ability;

import com.jiubredeemer.rulebook.dal.entity.tables.Abilities;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eAbilities;
import com.jiubredeemer.rulebook.domain.classes.dto.AbilityShortDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.Objects;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class AbilityRepository {
    private final DSLContext dsl;

    public AbilityShortDto getByRoomIdAndCode(UUID roomId, String code) {
        return Objects.requireNonNull(dsl.selectFrom(Abilities.ABILITIES)
                        .where(Abilities.ABILITIES.ROOM_ID.eq(roomId).and(Abilities.ABILITIES.CODE.eq(code)))
                        .fetchOne())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityShortDto.class));
    }

    public AbilityShortDto get5eAbilityByCode(String code) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eAbilities.DEFAULT_5E_ABILITIES)
                        .where(Default_5eAbilities.DEFAULT_5E_ABILITIES.CODE.eq(code))
                        .fetchOne())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityShortDto.class));
    }
}
