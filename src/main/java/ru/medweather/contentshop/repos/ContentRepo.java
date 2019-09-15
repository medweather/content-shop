package ru.medweather.contentshop.repos;

import org.springframework.data.repository.CrudRepository;
import ru.medweather.contentshop.model.Content;

public interface ContentRepo extends CrudRepository<Content, Long> {
}
