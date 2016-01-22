package ru.company.spring.dao;

import ru.company.spring.model.User;

import java.util.List;

public interface UserDao {

    int readCountUsers();

    List<User> readUsersByPages();

    List<User> readUsersByPages(int page);

    void createUser(User user);

    void deleteUser(int[] id);
}
