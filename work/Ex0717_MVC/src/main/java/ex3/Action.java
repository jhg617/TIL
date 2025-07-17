package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action { //인터페이스는 반드시 public이어야 접근 가능하다.
    String execute(HttpServletRequest request,
                   HttpServletResponse response);
}
