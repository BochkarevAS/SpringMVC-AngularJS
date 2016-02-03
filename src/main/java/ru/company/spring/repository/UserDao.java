package ru.company.spring.repository;

import ru.company.spring.model.Page;
import ru.company.spring.model.SearchUser;
import ru.company.spring.model.User;

import java.util.List;

public interface UserDao {

    Page readUsersByPages(Page index);

    void createUser(User user);

    void deleteUser(int[] id);

    void updateUser(User user);

    List<User> searchUser(SearchUser searchUser);
}
