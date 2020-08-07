package com.wincom.service.impl;

import com.wincom.Dao.UserDao;
import com.wincom.domain.User;
import com.wincom.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public boolean add(User user) {
        return this.userDao.add(user);
    }

    @Override
    public boolean login(User user){
        return this.userDao.login(user);
    }

    @Override
    public User findName(int id) {
        return this.userDao.findName(id);
    }

    @Override
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }
    @Override
    public User getUserByname(String username) {
        return this.userDao.getUserByname(username);
    }


    @Override
    public List<User> getmyaccount(int id) {
        return this.userDao.getmyaccount(id);
    }

    @Override
    public boolean updateUser(User user) {
        return this.userDao.updateUser(user);
    }

    @Override
    public boolean updateUsers(User user) {
        return this.userDao.updateUsers(user);
    }
    @Override
    public boolean updatePassword(User user) {
        return this.userDao.updatePassword(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return this.userDao.deleteUser(id);
    }

    @Override
    public List<User> getallUser() {
        return this.userDao.getallUser();
    }
}

