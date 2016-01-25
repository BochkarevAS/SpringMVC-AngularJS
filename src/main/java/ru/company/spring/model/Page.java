package ru.company.spring.model;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Page {

    private int to = 5;

    private int from = 1;

    private int rows;

    private List<User> users;

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<User> getUsers() {
        return users;
    }

    public void calcPages(int page) {
        from = to * (page - 1);
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getTo() {
        return to;
    }

    public int getFrom() {
        return from;
    }
}
