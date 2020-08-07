package com.wincom.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wincom.domain.Daydate;
import com.wincom.service.DaydateService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/daydate")
public class DaydateController {
    @Resource
    private DaydateService daydateService;
    //按天查询会议次数
    @RequestMapping(value="/selectday",method= RequestMethod.POST)
    @ResponseBody
    public String selectday(HttpServletRequest request){
        String year = request.getParameter("year");
        JSONObject jo = new JSONObject();
        List mouth = new ArrayList();
        List count = new ArrayList();
        List<Daydate> list = daydateService.getDaydate(year);

        //单独挑出两种数据的集合放入map
        for (Daydate daydate : list) {
            mouth.add(daydate.getMouth());//对应xAxis data
            count.add(daydate.getCount());//对应yAxis data
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mouth", mouth);
        map.put("count", count);
        String s = JSONObject.toJSONString(map);
        return s;
    }
}
