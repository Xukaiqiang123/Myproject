package com.wincom.service.impl;

import com.wincom.Dao.CountStyleDao;
import com.wincom.domain.CountStyle;
import com.wincom.service.CountStyleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("countstyleService")
public class CountStyleImpl implements CountStyleService {
    @Resource
    private CountStyleDao countstyleDao;
    @Override
    public List<CountStyle> getCountStyle() {
        return this.countstyleDao.getCountStyle();
    }
}
