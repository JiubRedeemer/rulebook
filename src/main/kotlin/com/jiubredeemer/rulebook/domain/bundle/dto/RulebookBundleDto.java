package com.jiubredeemer.rulebook.domain.bundle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RulebookBundleDto {
    private UUID id;
    private String name;
    /**
     * Издание: '2014' | '2024' | 'SRD_2024' | 'ORASCA'.
     */
    private String editionCode;
    private BundleCategoryEnum category;
    private String description;
    private String imgUrl;
    private Boolean isPublic;
    /**
     * null = системный бандл.
     */
    private UUID ownerUserId;
    private Integer sortOrder;
    private LocalDateTime createdAt;
    /**
     * Включён ли бандл в комнате (заполняется при листинге с контекстом комнаты).
     */
    private Boolean enabled;
}
