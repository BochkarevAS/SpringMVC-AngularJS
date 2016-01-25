package ru.company.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.company.spring.repository.UserDao;
import ru.company.spring.model.Page;
import ru.company.spring.model.User;

@RestController
@RequestMapping("/user")
public class MainController {

    @Autowired
    UserDao userDao;

    @RequestMapping(value = "/{index}", method = RequestMethod.GET)
    public Page readUsersByPages(@PathVariable("index") int index) {
        Page page = userDao.readUsersByPages(index);
        return page;
    }

    @RequestMapping(method = RequestMethod.POST)
    public Page createUser(@RequestBody User user) {
        userDao.createUser(user);
        Page page = userDao.readUsersByPages();
        return page;
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public Page deleteUser(@RequestBody int[] listIndex) {
        userDao.deleteUser(listIndex);
        Page page = userDao.readUsersByPages();
        return page;
    }
}
