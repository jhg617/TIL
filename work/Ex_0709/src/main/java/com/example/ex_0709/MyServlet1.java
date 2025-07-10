package com.example.ex_0709;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ms1")
public class MyServlet1 extends HttpServlet {
    public MyServlet1() {
        System.out.println("생성자!");
    }

    @Override
    public void destroy() {
        System.out.println("destroy!");
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("init!");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("service!");
        //요청한 방식이 get이면 doGet을 호출한다.
        if(req.getMethod().equalsIgnoreCase("get"))
            doGet(req, resp);
        else
            doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
    }
}
