package com.wincom.service;

import java.util.ArrayList;

public interface PageService {
    int getPageNum(int num);//每num一页获取页面总数
    ArrayList getPage(int page, int num);//获取第page页页面数据
}