package com.jiubredeemer.rulebook.domain.states.service;

import com.jiubredeemer.rulebook.dal.repository.skill.SkillRepository;
import com.jiubredeemer.rulebook.dal.repository.states.StatesRepository;
import com.jiubredeemer.rulebook.domain.clazz.dto.ClazzDto;
import com.jiubredeemer.rulebook.domain.clazz.service.ClazzService;
import com.jiubredeemer.rulebook.domain.common.SkillTypeEnum;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import com.jiubredeemer.rulebook.domain.room.dto.RuleTypeEnum;
import com.jiubredeemer.rulebook.domain.room.service.RoomService;
import com.jiubredeemer.rulebook.domain.states.dto.StateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class StatesService {
    private final RoomService roomService;
    private final StatesRepository statesRepository;

    public List<StateDto> fetchAvailableForRoomId(UUID roomId) {
        final RoomDto roomDto = roomService.getById(roomId);
        RuleTypeEnum selector = chooseRuleType(roomDto);
        return switch (selector) {
            default -> statesRepository.getFullForRoom(roomId);
        };
    }

    public StateDto fetchByRoomIdAndCode(UUID roomId, String code) {
        final RoomDto roomDto = roomService.getById(roomId);
        RuleTypeEnum selector = chooseRuleType(roomDto);
        return (switch (selector) {
            default -> statesRepository.getByRoomIdAndCode(roomId, code);
        }).orElseThrow();
    }

    private RuleTypeEnum chooseRuleType(RoomDto roomDto) {
        RuleTypeEnum selector;
        if (roomDto.getBaseRuleType() != null) {
            selector = roomDto.getBaseRuleType();
        } else {
            selector = roomDto.getRuleType();
        }
        return selector;
    }
}
