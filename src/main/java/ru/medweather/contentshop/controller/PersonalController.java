package ru.medweather.contentshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.medweather.contentshop.model.Content;
import ru.medweather.contentshop.model.Person;
import ru.medweather.contentshop.service.PersonalService;

import java.util.List;

@RestController
@RequestMapping("personal-content")
public class PersonalController {

    private final PersonalService personalService;

    @Autowired
    public PersonalController(PersonalService personalService) {
        this.personalService = personalService;
    }

    @GetMapping
    public List<Content> personContents(
            @AuthenticationPrincipal Person person
    ) {
        return personalService.getContents(person);
    }

    @GetMapping("{id}")
    public Content get(
            @PathVariable("id") Content content
    ) {
        return content;
    }

    @GetMapping("delete/{id}")
    public List<Content> afterDelete(
            @PathVariable("id") Content content,
            @AuthenticationPrincipal Person person) {
        return personalService.listAfterDelete(content, person);
    }
}
