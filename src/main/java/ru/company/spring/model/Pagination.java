package ru.company.spring.model;

import org.springframework.stereotype.Component;

@Component
public class Pagination {

    private int to = 5;

    private int from = 1;

    public void calcPages(int page) {
        from = to * (page - 1);
    }

    public int getTo() {
        return to;
    }

    public int getFrom() {
        return from;
    }
}
