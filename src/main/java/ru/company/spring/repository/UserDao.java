package ru.company.spring.repository;

import ru.company.spring.model.Page;
import ru.company.spring.model.User;

public interface UserDao {

    Page readUsersByPages();

    Page readUsersByPages(int page);

    void createUser(User user);

    void deleteUser(int[] id);
}
