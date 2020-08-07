package com.wincom.controller;

import com.alibaba.fastjson.JSONObject;
import com.wincom.domain.CountStyle;
import com.wincom.service.CountStyleService;
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

@RequestMapping("/style")
public class CountStyleController {
    @Resource
    private CountStyleService countStyleService;
    //按天查询会议次数
    @RequestMapping(value="/selectstyle",method= RequestMethod.POST)
    @ResponseBody
    public String selectday(HttpServletRequest request){
        List conferenecestyle = new ArrayList();
        List count = new ArrayList();
        List<CountStyle> list = countStyleService.getCountStyle();
        //单独挑出两种数据的集合放入map
        System.out.println(list);
        for (CountStyle countStyle : list) {
            conferenecestyle.add(countStyle.getConferencestyle());//对应xAxis data
            count.add(countStyle.getCount());//对应yAxis data
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("conferenecestyle", conferenecestyle);
        map.put("count", count);
        String s = JSONObject.toJSONString(map);
        System.out.println(s);

        return s;
    }
}
