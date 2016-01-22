package ru.company.spring.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.*;
import org.springframework.stereotype.Repository;
import ru.company.spring.dao.UserDao;
import ru.company.spring.model.Pagination;
import ru.company.spring.model.User;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserImpl implements UserDao {

    @Autowired
    private Pagination pagination;

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    public int readCountUsers() {
        String query = "SELECT count(*) FROM users";
        int rows = jdbcTemplate.getJdbcOperations().queryForObject(query, Integer.class);
        return rows;
    }

    @Override
    public List<User> readUsersByPages(int page) {
        pagination.calcPages(page);
        return readUsersByPages();
    };

    @Override
    public List<User> readUsersByPages() {
        String query = "SELECT SQL_CALC_FOUND_ROWS * FROM users LIMIT :from, :to";

        MapSqlParameterSource parameter = new MapSqlParameterSource();
        parameter.addValue("from", pagination.getFrom());
        parameter.addValue("to", pagination.getTo());

        return jdbcTemplate.query(query, parameter, new UserRowMapper());
    }

    @Override
    public void createUser(User user) {
        String query = "INSERT INTO users (nick, login, email) VALUES (:nick, :login, :email)";
        SqlParameterSource parameter = new BeanPropertySqlParameterSource(user);
        jdbcTemplate.update(query, parameter);
    }

    @Override
    public void deleteUser(int[] id) {
        String query = "DELETE FROM users WHERE id=:id";
        SqlParameterSource[] parameter = new SqlParameterSource[id.length];

        for (int i = 0; i < id.length; i++) {
            User user = new User();
            user.setId(id[i]);
            parameter[i] = new BeanPropertySqlParameterSource(user);
        }
        jdbcTemplate.batchUpdate(query, parameter);
    }

    private static final class UserRowMapper implements RowMapper<User> {

        @Override
        public User mapRow(ResultSet resultSet, int i) throws SQLException {
            User user = new User();
            user.setId(resultSet.getInt("id"));
            user.setNick(resultSet.getString("nick"));
            user.setLogin(resultSet.getString("login"));
            user.setEmail(resultSet.getString("email"));
            return user;
        }
    }
}
