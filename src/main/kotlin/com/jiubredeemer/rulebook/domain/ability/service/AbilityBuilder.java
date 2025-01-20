package com.jiubredeemer.rulebook.domain.ability.service;

import com.jiubredeemer.rulebook.domain.ability.dto.AbilityDto;
import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import com.jiubredeemer.rulebook.domain.skill.dto.SkillDto;
import com.jiubredeemer.rulebook.domain.skill.service.SkillService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class AbilityBuilder {

    private final SkillService skillService;

    public List<AbilityDto> enrichSkills(List<AbilityDto> abilities, RuleTypeEnum ruleType) {
        final List<UUID> abilityIds = abilities.stream().map(AbilityDto::getId).toList();
        List<SkillDto> skills = skillService.findAllByAbilityIdIn(abilityIds, ruleType);
        final Map<UUID, List<SkillDto>> skillsByAbilityIds = skills.stream()
                .collect(Collectors.groupingBy(SkillDto::getDependOnAbility));
        abilities.forEach(abilityDto -> abilityDto.setSkills(skillsByAbilityIds.get(abilityDto.getId())));
        return abilities;
    }
}
