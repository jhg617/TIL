package bbs.action;

import bbs.dao.BbsDAO;
import mybatis.vo.BbsVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        //파라미터 받기
        String b_idx = request.getParameter("b_idx"); //기본키
        //String cPage = request.getParameter("cPage"); //목록보기에 사용할 페이지 값

        BbsVO vo = BbsDAO.getId(b_idx);

        BbsDAO.hit(b_idx); //vo.getB_idx() 이것도 가능함

        request.setAttribute("vo", vo);
        //request.setAttribute("nowPage", cPage);
        return "view.jsp";
    }
}
