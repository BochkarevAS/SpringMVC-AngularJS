package ru.company.spring.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.*;
import org.springframework.stereotype.Repository;
import ru.company.spring.model.Page;
import ru.company.spring.model.User;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    public Page readUsersByPages(Page page) {
        int rows = jdbcTemplate.getJdbcOperations().queryForObject("SELECT count(*) FROM users", Integer.class);
        String query = "SELECT SQL_CALC_FOUND_ROWS * FROM users LIMIT :from, :to";

        MapSqlParameterSource parameter = new MapSqlParameterSource()
                .addValue("from", page.getFrom())
                .addValue("to", page.getTo());

        List<User> users = jdbcTemplate.query(query, parameter, new UserRowMapper());
        page.setRows(rows);
        page.setUsers(users);
        return page;
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

    @Override
    public void updateUser(User user) {
        String query = "UPDATE users SET nick=:nick, login=:login, email=:email WHERE id=:id";
        SqlParameterSource parameter = new BeanPropertySqlParameterSource(user);
        jdbcTemplate.update(query, parameter);
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
