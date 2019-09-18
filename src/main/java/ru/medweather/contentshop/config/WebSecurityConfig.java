package ru.medweather.contentshop.config;

import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.boot.autoconfigure.security.oauth2.resource.PrincipalExtractor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import ru.medweather.contentshop.model.Person;
import ru.medweather.contentshop.model.Role;
import ru.medweather.contentshop.repos.PersonRepo;

import java.util.Collections;

@Configuration
@EnableWebSecurity
@EnableOAuth2Sso
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .antMatcher("/**")
                .authorizeRequests()
                .antMatchers("/", "/login**", "/js/**", "/error**").permitAll()
                .anyRequest().authenticated()
                .and().logout().logoutSuccessUrl("/").permitAll()
                .and()
                .csrf().disable();
    }

    @Bean
    public PrincipalExtractor principalExtractor(PersonRepo personRepo) {
        return map -> {
            String id = (String) map.get("sub");
            Person person = personRepo.findById(id).orElseGet(() -> {
                Person newPerson = new Person();
                newPerson.setId(id);
                newPerson.setName((String) map.get("name"));
                newPerson.setEmail((String) map.get("email"));
                newPerson.setGender((String) map.get("gender"));
                newPerson.setLocale((String) map.get("locale"));
                newPerson.setRoles(Collections.singleton(Role.USER));
                return newPerson;
            });
            return personRepo.save(person);
        };
    }
}
