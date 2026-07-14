package com.jiubredeemer.rulebook.domain.bundle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

/**
 * Элемент набора (раса/класс/предыстория) с признаком включённости в комнате.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RulebookBundleContentDto {
    private UUID id;
    private String name;
    private Boolean enabled;
}
