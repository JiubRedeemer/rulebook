package com.jiubredeemer.rulebook.configuration;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "rulebook.license-mode")
public class LicenseMode {
    private Boolean ccBy4;
}
