package ex2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;

public class DateAction {
    public String execute(HttpServletRequest request,
                          HttpServletResponse response){
        //request와 response가 있으면 Servlet에서 수행하는일을 여기서도 수행 가능하다.
        LocalDate date = LocalDate.now();

        //요청에 바로 저장
        request.setAttribute("date", date.toString()); //현재날짜를
        // forward될 request에 "date"라는 이름으로 저장!

        //보여질 jsp경로를 반환하자!
        return "/ex2/page1.jsp";
    }
}
