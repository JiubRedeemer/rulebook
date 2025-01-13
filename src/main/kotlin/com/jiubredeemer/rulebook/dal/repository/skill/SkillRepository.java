package com.jiubredeemer.rulebook.dal.repository.skill;

import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eSkill;
import com.jiubredeemer.rulebook.dal.entity.tables.Skill;
import com.jiubredeemer.rulebook.domain.skill.dto.SkillDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class SkillRepository {
    private final DSLContext dsl;

    public List<SkillDto> getFullForRoom(UUID roomId) {
        return Objects.requireNonNull(dsl.selectFrom(Skill.SKILL)
                        .where(Skill.SKILL.ability().ROOM_ID.eq(roomId))
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public List<SkillDto> getFull5eForRoom() {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eSkill.DEFAULT_5E_SKILL)
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public Optional<SkillDto> getByRoomIdAndCode(UUID roomId, String code) {
        return Objects.requireNonNull(dsl.selectFrom(Skill.SKILL)
                        .where(Skill.SKILL.ability().ROOM_ID.eq(roomId))
                        .and(Skill.SKILL.CODE.eq(code))
                        .fetchOptional())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public Optional<SkillDto> get5eByCode(String code) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eSkill.DEFAULT_5E_SKILL)
                        .where(Default_5eSkill.DEFAULT_5E_SKILL.CODE.eq(code))
                        .fetchOptional())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public List<SkillDto> get5eByCodes(List<String> availableSkillCodes) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eSkill.DEFAULT_5E_SKILL)
                        .where(Default_5eSkill.DEFAULT_5E_SKILL.CODE.in(availableSkillCodes))
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public List<SkillDto> getByRoomAndCodes(UUID roomId, List<String> availableSkillCodes) {
        return Objects.requireNonNull(dsl.selectFrom(Skill.SKILL)
                        .where(Skill.SKILL.ability().ROOM_ID.eq(roomId))
                        .and(Skill.SKILL.CODE.in(availableSkillCodes))
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }
}
