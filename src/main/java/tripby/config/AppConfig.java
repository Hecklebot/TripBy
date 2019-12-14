package tripby.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.context.annotation.FilterType;


@ComponentScan(basePackages = "tripby", 
excludeFilters = {@Filter(type = FilterType.REGEX, pattern = "tripby.web.*")})
@EnableWebMvc
public class AppConfig {
}
