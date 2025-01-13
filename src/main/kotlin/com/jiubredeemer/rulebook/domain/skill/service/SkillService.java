package com.jiubredeemer.rulebook.domain.skill.service;

import com.jiubredeemer.rulebook.dal.repository.skill.SkillRepository;
import com.jiubredeemer.rulebook.domain.ability.dto.AbilityDto;
import com.jiubredeemer.rulebook.domain.ability.service.AbilityService;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.clazz.service.ClazzService;
import com.jiubredeemer.rulebook.domain.common.SkillTypeEnum;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.domain.skill.dto.SkillDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SkillService {
    public static final String ANY = "ANY";
    private final RoomService roomService;
    private final SkillRepository skillRepository;
    private final ClazzService clazzService;
    private final AbilityService abilityService;

    public List<SkillDto> fetchAvailableForRoomId(UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        final List<SkillDto> skills =
                switch (roomDto.getRuleType()) {
                    case DND5E -> skillRepository.getFull5eForRoom();
                    default -> skillRepository.getFullForRoom(roomId);
                };
        return enrichAbilities(roomDto, skills.toArray(SkillDto[]::new));
    }

    public SkillDto fetchByRoomIdAndCode(UUID roomId, String code) {
        final RoomDto roomDto = roomService.getById(roomId);

        final SkillDto skillDto =
                (switch (roomDto.getRuleType()) {
                    case DND5E -> skillRepository.get5eByCode(code);
                    default -> skillRepository.getByRoomIdAndCode(roomId, code);
                }).orElseThrow();
        return enrichAbilities(roomDto, skillDto).getFirst();
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

        final List<SkillDto> skills =
                switch (roomDto.getRuleType()) {
                    case DND5E -> !availableSkillCodes.contains(ANY) ?
                            skillRepository.get5eByCodes(availableSkillCodes) :
                            skillRepository.getFull5eForRoom();
                    default -> !availableSkillCodes.contains(ANY) ?
                            skillRepository.getByRoomAndCodes(roomId, availableSkillCodes) :
                            skillRepository.getFullForRoom(roomId);
                };
        return enrichAbilities(roomDto, skills.toArray(SkillDto[]::new));
    }

    private List<SkillDto> enrichAbilities(RoomDto roomDto, SkillDto... skills) {
        final Set<UUID> abilityIds = Arrays.stream(skills).map(SkillDto::getDependOnAbility).collect(Collectors.toSet());
        final List<AbilityDto> abilities = abilityService.fetchByIds(roomDto, abilityIds);
        return Arrays.stream(skills).peek(skillDto ->
                skillDto.setAbility(abilities.stream().filter(abilityDto ->
                                abilityDto.getId()
                                        .equals(skillDto.getDependOnAbility()))
                        .findFirst()
                        .orElse(null))).toList();
    }
}
