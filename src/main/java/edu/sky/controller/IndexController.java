package edu.sky.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("attr", "Тестовое задание для стажировки JavaRush. Лето 2018. Автор - sky.");
        return "index";
    }
}
