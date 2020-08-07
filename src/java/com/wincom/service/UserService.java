package com.wincom.service;
import com.wincom.domain.User;

import java.util.List;

public interface UserService {

    public boolean add(User user);

    public boolean login(User user);
    public User findName(int id);

    public User getUserById(int id);
    public User getUserByname(String username);
    public List<User> getmyaccount(int id);

    public boolean updateUser(User user);
    public boolean updateUsers(User user);
    public boolean updatePassword(User user);
    public boolean deleteUser(int id);

    public List<User> getallUser();
}
