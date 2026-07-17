package com.jiubredeemer.rulebook.domain.blueprint.dto;

import lombok.Data;

import java.util.UUID;

/**
 * Чертёж магического предмета.
 * itemId ссылается на itemstorage.item_bundled.id и может быть null
 * (вариативные чертежи вроде «Обычный магический предмет»).
 */
@Data
public class BlueprintDto {
    private UUID id;
    private String code;
    private String name;
    private String description;
    private String groupCode;
    private Integer requiredLevel;
    private CustomizationEnum customization;
    private UUID itemId;
    private String imgUrl;
    private UUID bundleId;
    private Boolean hidden;
    /** Заполняется только для пользовательских чертежей (users_blueprint). */
    private UUID roomId;
    private UUID creatorId;
}
