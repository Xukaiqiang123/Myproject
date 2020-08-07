package com.wincom.Dao;

import com.wincom.domain.CountStyle;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
@Repository("countstyleDao")
public class CountStyleDao {
    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
    public List<CountStyle> getCountStyle(){
        return sqlSessionTemplate.selectList("com.wincom.mapper.CountStyleMapper.selectstyle");
    }
}
