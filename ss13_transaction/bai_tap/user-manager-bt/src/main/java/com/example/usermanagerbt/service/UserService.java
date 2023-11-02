package com.example.usermanagerbt.service;

import com.example.usermanagerbt.model.User;
import com.example.usermanagerbt.repository.IUserRepository;
import com.example.usermanagerbt.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private final IUserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> selectAllUserByCountry(String country) {
        return userRepository.selectAllUserByCountry(country);
    }

    @Override
    public List<User> sortByNameIncrease() {
        return userRepository.sortByNameIncrease();
    }

    @Override
    public List<User> sortByNameDecrease() {
        return userRepository.sortByNameDecrease();
    }

    @Override
    public List<User> selectAllUserCallable() {
        return userRepository.selectAllUserCallable();
    }

    @Override
    public boolean deleteUserCallable(int id) {
        return userRepository.deleteUserCallable(id);
    }

    @Override
    public boolean updateUserCallable(User user) {
        return userRepository.updateUserCallable(user);
    }

    @Override
    public boolean deleteManyUser(int id1, int id2) {
        return userRepository.deleteManyUser(id1, id2);
    }
}
