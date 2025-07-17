package ex2;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Controller2")
public class Controller2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //type이라는 파라미터 받기
        String type = request.getParameter("type");

        String viewPath = null; //jsp경로를 저장할 변수

        if(type == null || type.equalsIgnoreCase("date")){
            DateAction action = new DateAction();
            viewPath = action.execute(request, response);
        }else if(type.equalsIgnoreCase("greet")){
            GreetAction action = new GreetAction();
            viewPath = action.execute(request, response);
        }

        //forward를 하기 위해 필요한 객체
        RequestDispatcher disp = request.getRequestDispatcher(viewPath);
        disp.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
