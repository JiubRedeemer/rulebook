package com.jiubredeemer.rulebook.dal.mapper.clazz;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiubredeemer.rulebook.dal.entity.tables.records.ClazzStatsRecord;
import com.jiubredeemer.rulebook.dal.repository.ability.AbilityRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.AbilityShortDto;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzStatsDto;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.jooq.RecordMapper;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Component
public class ClassStatsMapper implements RecordMapper<ClazzStatsRecord, ClazzStatsDto> {
    private final ObjectMapper objectMapper;
    private final AbilityRepository abilityRepository;

    @SneakyThrows
    @Override
    public ClazzStatsDto map(ClazzStatsRecord record) {
        List<String> savingThrows = objectMapper.readValue(record.getSavingThrowsAbility().data(), ArrayList.class);
        List<AbilityShortDto> savingThrowsMapped = savingThrows.stream().map(s -> {
            AbilityShortDto abilityShortDto = new AbilityShortDto();
            abilityShortDto.setCode(s);
            abilityShortDto.setName(abilityRepository.get5eAbilityByCode(abilityShortDto.getCode()).orElseThrow().getName());
            return abilityShortDto;
        }).toList();
        record.setSavingThrowsAbility(null);
        ClazzStatsDto result = record.into(ClazzStatsDto.class);
        result.setSavingThrowsAbilities(savingThrowsMapped);
        return result;
    }
}
