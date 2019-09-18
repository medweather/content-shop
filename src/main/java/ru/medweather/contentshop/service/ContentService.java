package ru.medweather.contentshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.medweather.contentshop.model.Content;
import ru.medweather.contentshop.model.Person;
import ru.medweather.contentshop.repos.ContentRepo;

import java.util.List;

@Service
public class ContentService {

    private final ContentRepo contentRepo;

    @Autowired
    public ContentService(ContentRepo contentRepo) {
        this.contentRepo = contentRepo;
    }

    public List<Content> getContents() {
        return contentRepo.findAll();
    }

    public Content buyContent(Content content, Person person) {
        if(!content.isBought()) {
            content.setPerson(person);
            content.setBought(true);
            return contentRepo.save(content);
        }
        return content;
    }
}
