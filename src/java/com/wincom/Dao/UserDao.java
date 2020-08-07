package com.wincom.Dao;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import com.wincom.domain.User;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

import static java.lang.System.out;

@Repository("userDao")
public class UserDao {
    @Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
    private User user;

    public User getUserById(int id){
        return (User) sqlSessionTemplate.selectOne("com.wincom.mapper.UserMapper.getUserById",id);
    }
    public User getUserByname(String username){
        return (User) sqlSessionTemplate.selectOne("com.wincom.mapper.UserMapper.getUserByname",username);
    }

    public boolean login(User user){
        User user1=sqlSessionTemplate.selectOne("com.wincom.mapper.UserMapper.login",user);
        if (user1!=null){
            return true;
        }
        else
            return false;
    }

    public boolean add(User user){
        out.println(user.getUsername());
        sqlSessionTemplate.insert("com.wincom.mapper.UserMapper.save",user);
        return true;
    }

    public User findName(int id) {
        return sqlSessionTemplate.selectOne("com.wincom.mapper.UserMapper.find",id);
    }

    public List<User> getmyaccount(int id){
        return sqlSessionTemplate.selectList("com.wincom.mapper.UserMapper.find",id);
    }

    public boolean updateUser(User user){
        sqlSessionTemplate.update("com.wincom.mapper.UserMapper.update",user);
            return true;
    }

    public boolean updateUsers(User user){
        sqlSessionTemplate.update("com.wincom.mapper.UserMapper.updateusers",user);
        return true;
    }

    public boolean updatePassword(User user){
        sqlSessionTemplate.update("com.wincom.mapper.UserMapper.updatepassword",user);
        return true;
    }

    public List<User> getallUser(){
        return sqlSessionTemplate.selectList("com.wincom.mapper.UserMapper.getallUser");
    }

    public boolean deleteUser(int id) {
        sqlSessionTemplate.delete("com.wincom.mapper.UserMapper.deleteuser", id);
        return true;
    }
}
