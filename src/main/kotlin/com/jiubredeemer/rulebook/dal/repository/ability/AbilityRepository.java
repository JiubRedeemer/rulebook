package com.jiubredeemer.rulebook.dal.repository.ability;

import com.jiubredeemer.rulebook.dal.entity.tables.Ability;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eAbility;
import com.jiubredeemer.rulebook.domain.ability.dto.AbilityDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
@RequiredArgsConstructor
public class AbilityRepository {
    private final DSLContext dsl;

    public Optional<AbilityDto> getByRoomIdAndCode(UUID roomId, String code) {
        return dsl.selectFrom(Ability.ABILITY)
                        .where(Ability.ABILITY.ROOM_ID.eq(roomId).and(Ability.ABILITY.CODE.eq(code)))
                        .fetchOptional()
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public Optional<AbilityDto> get5eByCode(String code) {
        return dsl.selectFrom(Default_5eAbility.DEFAULT_5E_ABILITY)
                        .where(Default_5eAbility.DEFAULT_5E_ABILITY.CODE.eq(code))
                        .fetchOptional()
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public Optional<AbilityDto> get5eAbilityByCode(String code) {
        return dsl.selectFrom(Default_5eAbility.DEFAULT_5E_ABILITY)
                        .where(Default_5eAbility.DEFAULT_5E_ABILITY.CODE.eq(code))
                        .fetchOptional()
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public List<AbilityDto> getFull5eAbilitiesForRoom() {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eAbility.DEFAULT_5E_ABILITY)
                        .fetch())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public List<AbilityDto> getFullAbilitiesForRoom(UUID roomId) {
        return Objects.requireNonNull(dsl.selectFrom(Ability.ABILITY)
                        .where(Ability.ABILITY.ROOM_ID.eq(roomId))
                        .fetch())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }


    public List<AbilityDto> get5eByIds(Set<UUID> abilityIds) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eAbility.DEFAULT_5E_ABILITY)
                        .where(Default_5eAbility.DEFAULT_5E_ABILITY.ID.in(abilityIds))
                        .fetch())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }

    public List<AbilityDto> getByIds(Set<UUID> abilityIds) {
        return Objects.requireNonNull(dsl.selectFrom(Ability.ABILITY)
                        .where(Ability.ABILITY.ID.in(abilityIds))
                        .fetch())
                .map(abilitiesRecord -> abilitiesRecord.into(AbilityDto.class));
    }
}
