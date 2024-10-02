package com.jiubredeemer.rulebook.domain.skills.service;

import com.jiubredeemer.rulebook.dal.repository.skill.SkillRepository;
import com.jiubredeemer.rulebook.domain.abilities.dto.AbilityDto;
import com.jiubredeemer.rulebook.domain.abilities.service.AbilityService;
import com.jiubredeemer.rulebook.domain.classes.dto.ClassDto;
import com.jiubredeemer.rulebook.domain.classes.service.ClassService;
import com.jiubredeemer.rulebook.domain.common.SkillTypeEnum;
import com.jiubredeemer.rulebook.domain.rooms.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.rooms.service.RoomsService;
import com.jiubredeemer.rulebook.domain.skills.dto.SkillDto;
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
    private final RoomsService roomsService;
    private final SkillRepository skillRepository;
    private final ClassService classService;
    private final AbilityService abilityService;

    public List<SkillDto> fetchAvailableForRoomId(UUID roomId) {
        final RoomDto roomDto = roomsService.getById(roomId);
        final List<SkillDto> skills =
                switch (roomDto.getRuleType()) {
                    case DND5E -> skillRepository.getFull5eForRoom();
                    default -> skillRepository.getFullForRoom(roomId);
                };
        return enrichAbilities(roomDto, skills.toArray(SkillDto[]::new));
    }

    public SkillDto fetchByRoomIdAndCode(UUID roomId, String code) {
        final RoomDto roomDto = roomsService.getById(roomId);

        final SkillDto skillDto =
                (switch (roomDto.getRuleType()) {
                    case DND5E -> skillRepository.get5eByCode(code);
                    default -> skillRepository.getByRoomIdAndCode(roomId, code);
                }).orElseThrow();
        return enrichAbilities(roomDto, skillDto).getFirst();
    }

    public List<SkillDto> fetchByRoomIdAndClassCode(UUID roomId, String classCode) {
        final RoomDto roomDto = roomsService.getById(roomId);
        final ClassDto classDto = classService.fetchByRoomAndCode(roomId, classCode);
        final List<String> availableSkillCodes =
                classDto.getStats().getAvailableSkills()
                        .stream()
                        .filter(availableSkillDto -> availableSkillDto.getType().equals(SkillTypeEnum.ABILITY))
                        .flatMap(availableSkillDto -> availableSkillDto.getOf().stream())
                        .toList();

        final List<SkillDto> skills =
                switch (roomDto.getRuleType()) {
                    case DND5E -> skillRepository.get5eByCodes(availableSkillCodes);
                    default -> skillRepository.getByRoomAndCodes(roomId, availableSkillCodes);
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
