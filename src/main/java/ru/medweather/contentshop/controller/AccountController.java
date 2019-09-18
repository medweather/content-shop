package ru.medweather.contentshop.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.medweather.contentshop.model.Person;

@RestController
@RequestMapping("person")
public class AccountController {

    @GetMapping
    public Person get(
            @AuthenticationPrincipal Person person
    ) {
        return person;
    }
}
