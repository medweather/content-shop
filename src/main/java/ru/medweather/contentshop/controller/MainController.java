package ru.medweather.contentshop.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.medweather.contentshop.model.Content;
import ru.medweather.contentshop.model.Person;

@Controller
@RequestMapping("/")
public class MainController {

    @GetMapping
    public String main(
            Model model,
            @AuthenticationPrincipal Person person
    ) {
        model.addAttribute("person", person);
        return "main";
    }

    @GetMapping("all-contents")
    public String all(
            Model model,
            @AuthenticationPrincipal Person person
    ) {
        model.addAttribute("person", person);
        return "all";
    }

    @GetMapping("personal-account")
    public String personal(
            Model model,
            @AuthenticationPrincipal Person person
    ) {
        model.addAttribute("person", person);
        return "personal";
    }

    @GetMapping("all-contents/{id}")
    public String getOneFromAll(
            Model model,
            @PathVariable("id") Content content,
            @AuthenticationPrincipal Person person
    ) {
        model.addAttribute("person", person);
        model.addAttribute("content", content);
        return "oneFromAll";
    }

    @GetMapping("personal-account/{id}")
    public String getOneFromPer(
            Model model,
            @PathVariable("id") Content content,
            @AuthenticationPrincipal Person person
    ) {
        model.addAttribute("person", person);
        model.addAttribute("content", content);
        return "oneFromPer";
    }
}
