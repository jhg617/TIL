package bbs.action;

import bbs.dao.BbsDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String viewPath = null;

        //파라미터 받기
        String b_idx = request.getParameter("b_idx");
        String cPage = request.getParameter("cPage");

        int cnt = BbsDAO.delBbs(b_idx);
        viewPath = "Controller?type=list&cPage="+cPage;

        return viewPath;
    }
}
