package ru.medweather.contentshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.medweather.contentshop.model.Content;
import ru.medweather.contentshop.model.Person;
import ru.medweather.contentshop.service.ContentService;

import java.util.List;

@RestController
@RequestMapping("content")
public class ContentController {

    private final ContentService contentService;

    @Autowired
    public ContentController(ContentService contentService) {
        this.contentService = contentService;
    }

    @GetMapping
    public List<Content> listContents() {
        return contentService.getContents();
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
        return contentService.buyContent(content, person);
    }

}
