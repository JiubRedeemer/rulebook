package com.jiubredeemer.rulebook.dal.repository.skill;

import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eSkills;
import com.jiubredeemer.rulebook.dal.entity.tables.Skills;
import com.jiubredeemer.rulebook.domain.skills.dto.SkillDto;
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
        return Objects.requireNonNull(dsl.selectFrom(Skills.SKILLS)
                        .where(Skills.SKILLS.abilities().ROOM_ID.eq(roomId))
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public List<SkillDto> getFull5eForRoom() {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eSkills.DEFAULT_5E_SKILLS)
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public Optional<SkillDto> getByRoomIdAndCode(UUID roomId, String code) {
        return Objects.requireNonNull(dsl.selectFrom(Skills.SKILLS)
                        .where(Skills.SKILLS.abilities().ROOM_ID.eq(roomId))
                        .and(Skills.SKILLS.CODE.eq(code))
                        .fetchOptional())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public Optional<SkillDto> get5eByCode(String code) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eSkills.DEFAULT_5E_SKILLS)
                        .where(Default_5eSkills.DEFAULT_5E_SKILLS.CODE.eq(code))
                        .fetchOptional())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public List<SkillDto> get5eByCodes(List<String> availableSkillCodes) {
        return Objects.requireNonNull(dsl.selectFrom(Default_5eSkills.DEFAULT_5E_SKILLS)
                        .where(Default_5eSkills.DEFAULT_5E_SKILLS.CODE.in(availableSkillCodes))
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }

    public List<SkillDto> getByRoomAndCodes(UUID roomId, List<String> availableSkillCodes) {
        return Objects.requireNonNull(dsl.selectFrom(Skills.SKILLS)
                        .where(Skills.SKILLS.abilities().ROOM_ID.eq(roomId))
                        .and(Skills.SKILLS.CODE.in(availableSkillCodes))
                        .fetch())
                .map(roomsRecord -> roomsRecord.into(SkillDto.class));
    }
}
