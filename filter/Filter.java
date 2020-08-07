package com.wincom.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "Filter",urlPatterns = {"*.jsp"})
public class Filter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse) resp;
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession(false);
        String url=request.getRequestURI();//获取uri
        System.out.println(url);
        if(!("/SSM_conference0_war/".equals(url))) {
            String password = request.getParameter("password");
            String id = request.getParameter("id");
            if("/SSM_conference0_war/user/login".equals(url))
            {
            if ((id!=null)&&(password!=null))
            {
                chain.doFilter(req, resp);
            }
             else {
                //未登录
                String ss=session.getId();
                System.out.println(ss);
                response.getWriter().println("请先登录！3s后跳转...");
                response.setHeader("Refresh", "3;url=/SSM_conference0_war/");
            }}
            if(!("/SSM_conference0_war/user/login".equals(url))){
                String username= (String) session.getAttribute("username");
                if(!("/SSM_conference0_war/register.jsp".equals(url))&&username==null){
                    //未登录
                    String ss=session.getId();
                    System.out.println(ss);
                    response.getWriter().println("请先登录！3s后跳转...");
                    response.setHeader("Refresh", "3;url=/SSM_conference0_war/");
                }
                else{
                    chain.doFilter(req, resp);
                }
            }
        }
        else
        {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
