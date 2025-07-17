package ex3;

import mybatis.dao.MemoDAO;
import mybatis.vo.MemoVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemoAction implements Action {
    @Override
    public String execute(HttpServletRequest request,
                          HttpServletResponse response){
        //메모목록 가져오기 request에 저장하는 것이 목적이다.
        MemoVO[] ar = MemoDAO.getAll();

        //얻어낸 메모목록을 request에 ar에 저장!
        request.setAttribute("memo", ar);

        //도착할 경로를 forward!
        return "ex3/memo.jsp";
    }
}
