package com.jiubredeemer.rulebook.domain.classes.controller;

import com.jiubredeemer.rulebook.domain.classes.dto.ClassDto;
import com.jiubredeemer.rulebook.domain.classes.service.ClassService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/classes")
@RequiredArgsConstructor
public class ClassController {

    private final ClassService classService;


    @GetMapping()
    public List<ClassDto> getClassesForRoom(@RequestBody UUID roomId) {
        return classService.fetchAvailableClassesForRoom(roomId);
    }
}
