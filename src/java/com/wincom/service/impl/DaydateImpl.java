package com.wincom.service.impl;

import com.wincom.Dao.DaydateDao;
import com.wincom.domain.Daydate;
import com.wincom.service.DaydateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("daydateService")
public class DaydateImpl implements DaydateService {

    @Resource
    private DaydateDao daydateDao;
    @Override
    public List<Daydate> getDaydate(String year) {
        return this.daydateDao.getDaydate(year);
    }
}
