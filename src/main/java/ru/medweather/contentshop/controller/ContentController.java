package ru.medweather.contentshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import ru.medweather.contentshop.model.Content;
import ru.medweather.contentshop.model.Person;
import ru.medweather.contentshop.repos.ContentRepo;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("content")
public class ContentController {

    private final ContentRepo contentRepo;

    @Autowired
    public ContentController(ContentRepo contentRepo) {
        this.contentRepo = contentRepo;
    }

    @GetMapping
    public List<Content> listContents() {
        return contentRepo.findAll();
    }

    @GetMapping("{id}")
    public Content get(
            @PathVariable("id") Content content
    ) {
        return content;
    }

    @GetMapping("buy/{id}")
    public Content buy(
            @PathVariable("id") Content content,
            @AuthenticationPrincipal Person person
    ) {
        if(!content.isBought()) {
            content.setPerson(person);
            content.setBought(true);
            return contentRepo.save(content);
        }
        return content;
    }
}
