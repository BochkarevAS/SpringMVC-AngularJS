package ru.company.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.company.spring.model.Page;
import ru.company.spring.model.User;
import ru.company.spring.service.UserServiceImpl;

@RestController
@RequestMapping("/user")
public class MainController {

    private static int currentPage = 1;

    @Autowired
    UserServiceImpl userService;

    @RequestMapping(value = "/{index}", method = RequestMethod.GET)
    public Page readUsersByPages(@PathVariable("index") int index) {
        currentPage = index;
        Page page = userService.readUsersByPages(currentPage);
        return page;
    }

    @RequestMapping(method = RequestMethod.POST)
    public Page createUser(@RequestBody User user) {
        userService.createUser(user);
        Page page = userService.readUsersByPages(currentPage);
        return page;
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public Page deleteUser(@RequestBody int[] listIndex) {
        userService.deleteUser(listIndex);
        Page page = userService.readUsersByPages(currentPage);
        return page;
    }
}
