package com.wincom.Dao;

import com.wincom.domain.Daydate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
@Repository("daydateDao")
public class DaydateDao {
    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
    public List<Daydate> getDaydate(String year){
        return sqlSessionTemplate.selectList("com.wincom.mapper.DaydateMapper.selectday",year);
    }
}
