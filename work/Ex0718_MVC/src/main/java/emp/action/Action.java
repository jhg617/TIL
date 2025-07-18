package emp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
    String execute(HttpServletRequest request,
                   HttpServletResponse response); //인터페이스는 접근제한자 없어야됨
}
