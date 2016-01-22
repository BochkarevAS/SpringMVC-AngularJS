package ru.company.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.company.spring.dao.UserDao;
import ru.company.spring.model.User;

import java.util.List;

@RestController
@RequestMapping("/user")
public class MainController {

    @Autowired
    UserDao userDao;

    @RequestMapping(method = RequestMethod.GET)
    public int readCountUsers() {
        int rows = userDao.readCountUsers();
        return rows;
    }

    @RequestMapping(value = "/{index}", method = RequestMethod.GET)
    public List<User> readUsersByPages(@PathVariable("index") int index) {
        List<User> users = userDao.readUsersByPages(index);
        return users;
    }

    @RequestMapping(method = RequestMethod.POST)
    public List<User> createUser(@RequestBody User user) {
        userDao.createUser(user);
        List<User> users = userDao.readUsersByPages();
        return users;
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public List<User> deleteUser(@RequestBody int[] listIndex) {
        userDao.deleteUser(listIndex);
        List<User> users = userDao.readUsersByPages();
        return users;
    }
}
