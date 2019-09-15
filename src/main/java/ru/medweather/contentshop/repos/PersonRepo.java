package ru.medweather.contentshop.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.medweather.contentshop.model.Person;

public interface PersonRepo extends JpaRepository<Person, Long> {
    Person findByUsername(String username);
}
