package ru.company.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.company.spring.model.Page;
import ru.company.spring.model.SearchUser;
import ru.company.spring.model.User;
import ru.company.spring.service.UserService;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    private static int currentPage = 1;

    @Autowired
    UserService userService;

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

    @RequestMapping(method = RequestMethod.PUT)
    public Page updateUser(@RequestBody User user) {
        userService.updateUser(user);
        Page page = userService.readUsersByPages(currentPage);
        return page;
    }

    @RequestMapping(value = "/search", method = RequestMethod.PUT)
    public List<User> searchUser(@RequestBody SearchUser searchUser) {
        List<User> users = userService.searchUser(searchUser);
        return users;
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> errorHandler(Exception exc) {
        return new ResponseEntity<>(exc.getMessage(), HttpStatus.BAD_REQUEST);
    }

}
