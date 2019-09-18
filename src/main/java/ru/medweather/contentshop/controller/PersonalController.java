package ru.medweather.contentshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.medweather.contentshop.model.Content;
import ru.medweather.contentshop.model.Person;
import ru.medweather.contentshop.repos.ContentRepo;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("personal-content")
public class PersonalController {

    private final ContentRepo contentRepo;

    @Autowired
    public PersonalController(ContentRepo contentRepo) {
        this.contentRepo = contentRepo;
    }

    @GetMapping
    public List<Content> personContents(@AuthenticationPrincipal Person person) {
        return contentRepo.findAll().stream()
                .filter(pC -> pC.getPerson() != null && pC.getPerson().getId().equals(person.getId()))
                .collect(Collectors.toList());
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
        List<Content> personCont = contentRepo.findAll().stream()
                .filter(pC -> pC.getPerson() != null && pC.getPerson().getId().equals(person.getId()))
                .collect(Collectors.toList());
        if(personCont.contains(content)) {
            content.setPerson(null);
            content.setBought(false);
        }
        return personCont;
    }
}
