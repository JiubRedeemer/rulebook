package com.jiubredeemer.rulebook.domain.skill.service;

import com.jiubredeemer.rulebook.dal.repository.skill.SkillRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.clazz.service.ClazzService;
import com.jiubredeemer.rulebook.domain.common.SkillTypeEnum;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.domain.skill.dto.SkillDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class SkillService {
    public static final String ANY = "ANY";
    private final RoomService roomService;
    private final SkillRepository skillRepository;
    private final ClazzService clazzService;

    public List<SkillDto> fetchAvailableForRoomId(UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        return switch (roomDto.getRuleType()) {
            case DND5E, DND2024 -> skillRepository.getFull5eForRoom();
            default -> skillRepository.getFullForRoom(roomId);
        };
    }

    public SkillDto fetchByRoomIdAndCode(UUID roomId, String code) {
        final RoomDto roomDto = roomService.getById(roomId);
        return (switch (roomDto.getRuleType()) {
            case DND5E, DND2024 -> skillRepository.get5eByCode(code);
            default -> skillRepository.getByRoomIdAndCode(roomId, code);
        }).orElseThrow();
    }

    public List<SkillDto> fetchByRoomIdAndClassCode(UUID roomId, String classCode) {
        final RoomDto roomDto = roomService.getById(roomId);
        final ClazzDto clazzDto = clazzService.fetchByRoomAndCode(roomId, classCode);
        final List<String> availableSkillCodes =
                clazzDto.getStats().getAvailableSkills()
                        .stream()
                        .filter(availableSkillDto -> availableSkillDto.getType().equals(SkillTypeEnum.ABILITY))
                        .flatMap(availableSkillDto -> availableSkillDto.getOf().stream())
                        .toList();
        return switch (roomDto.getRuleType()) {
            case DND5E, DND2024 -> !availableSkillCodes.contains(ANY) ?
                    skillRepository.get5eByCodes(availableSkillCodes) :
                    skillRepository.getFull5eForRoom();
            default -> !availableSkillCodes.contains(ANY) ?
                    skillRepository.getByRoomAndCodes(roomId, availableSkillCodes) :
                    skillRepository.getFullForRoom(roomId);
        };
    }

    public List<SkillDto> findAllByAbilityIdIn(List<UUID> abilityIds, RuleTypeEnum ruleType) {
        return switch (ruleType) {
            case DND5E, DND2024 -> skillRepository.get5eByAbilityIdIn(abilityIds);
            default -> skillRepository.getByAbilityIdIn(abilityIds);
        };
    }
}
