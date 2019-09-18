package ru.medweather.contentshop.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.medweather.contentshop.model.Content;

public interface ContentRepo extends JpaRepository<Content, Long> {
    Content findById(int id);
}
