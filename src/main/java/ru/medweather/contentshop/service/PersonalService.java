package ru.medweather.contentshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.medweather.contentshop.model.Content;
import ru.medweather.contentshop.model.Person;
import ru.medweather.contentshop.repos.ContentRepo;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PersonalService {

    private final ContentRepo contentRepo;

    @Autowired
    public PersonalService(ContentRepo contentRepo) {
        this.contentRepo = contentRepo;
    }

    public List<Content> getContents(Person person) {
        return contentRepo.findAll().stream()
                .filter(pC -> pC.getPerson() != null && pC.getPerson().getId().equals(person.getId()))
                .collect(Collectors.toList());
    }

    public List<Content> listAfterDelete(Content content, Person person) {
        if(getContents(person).contains(content)) {
            content.setPerson(null);
            content.setBought(false);
        }
        return getContents(person);
    }
}
