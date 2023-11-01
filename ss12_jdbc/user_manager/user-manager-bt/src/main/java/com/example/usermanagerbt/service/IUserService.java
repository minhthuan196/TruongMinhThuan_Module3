package com.example.usermanagerbt.service;

import com.example.usermanagerbt.model.User;

import java.util.List;

public interface IUserService {
    void insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUser();

    boolean deleteUser(int id);

    boolean updateUser(User user);

    List<User> selectAllUserByCountry(String country);

    List<User> sortByNameIncrease();

    List<User> sortByNameDecrease();
}
