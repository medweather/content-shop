package ru.medweather.contentshop.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.medweather.contentshop.repos.PersonRepo;

@Service
public class AccountService implements UserDetailsService {

    private final PersonRepo personRepo;

    public AccountService(PersonRepo personRepo) {
        this.personRepo = personRepo;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return personRepo.findByUsername(username);
    }
}
