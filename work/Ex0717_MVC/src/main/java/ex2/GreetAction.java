package ex2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GreetAction {

    public String execute(HttpServletRequest request,
                          HttpServletResponse response){
        request.setAttribute("msg", "MVC를 시작합니다.");

        //보여질 jsp경로를 반환하자!
        return "/ex2/page2.jsp";
    }
}
