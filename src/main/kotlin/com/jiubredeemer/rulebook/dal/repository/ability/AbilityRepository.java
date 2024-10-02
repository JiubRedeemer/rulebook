package com.jiubredeemer.rulebook.dal.repository.ability;

import com.jiubredeemer.rulebook.dal.entity.tables.Abilities;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eAbilities;
import com.jiubredeemer.rulebook.domain.abilities.dto.AbilityDto;
import com.jiubredeemer.rulebook.domain.classes.dto.AbilityShortDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class AbilityRepository {
    private final DSLContext dsl;

    public Optional<AbilityDto> getByRoomIdAndCode(UUID roomId, String code) {
        return Objects.requireNonNull(dsl.selectFrom(Abilities.ABILITIES)
                        .where(Abilities.ABILITIES.ROOM_ID.eq(roomId).and(Abilities.ABILITIES.CODE.eq(code)))
                        .fetchOptional())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public Optional<AbilityDto> get5eByCode(String code) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eAbilities.DEFAULT_5E_ABILITIES)
                        .where(Default_5eAbilities.DEFAULT_5E_ABILITIES.CODE.eq(code))
                        .fetchOptional())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public Optional<AbilityDto> get5eAbilityByCode(String code) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eAbilities.DEFAULT_5E_ABILITIES)
                        .where(Default_5eAbilities.DEFAULT_5E_ABILITIES.CODE.eq(code))
                        .fetchOptional())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public List<AbilityDto> getFull5eAbilitiesForRoom() {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eAbilities.DEFAULT_5E_ABILITIES)
                        .fetch())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public List<AbilityDto> getFullAbilitiesForRoom(UUID roomId) {
        return Objects.requireNonNull(dsl.selectFrom(Abilities.ABILITIES)
                        .where(Abilities.ABILITIES.ROOM_ID.eq(roomId))
                        .fetch())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }


}
