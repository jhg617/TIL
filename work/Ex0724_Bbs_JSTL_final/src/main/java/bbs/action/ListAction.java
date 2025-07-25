package bbs.action;

import bbs.dao.BbsDAO;
import bbs.util.Paging;
import mybatis.vo.BbsVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        //파라미터 받기
        String bname = request.getParameter("bname");
        if(bname==null) //bname이 없다면 BBS로 넣어라
            bname="BBS";

        // 총 게시물의 수를 얻어낸다.
        int totalCount = BbsDAO.getTotalCount(bname);

        // 페이징 처리를 위한 객체 생성
        Paging page = new Paging(5, 3); //한 페이지당 10개씩, 3페이지 생성

        page.setTotalCount(totalCount); //총 페이지 수까지 구했다.

        // 현재 페이지값을 파라미터로 받는다.
        String cPage = request.getParameter("cPage");

        if(cPage==null) //받은 페이지(cPage)가 없으면 첫 페이지로 가라
            page.setNowPage(1);
        else{
            int nowPage = Integer.parseInt(cPage);//"2" --> 2
            page.setNowPage(nowPage);//이때!!!
            // 게시물을 추출할때 사용되는 begin과 end가 구해지고,
            // 더불어 startPage와 endPage도 구해졌다.
        }

        //DAO(DB)를 호출하여 원하는 게시물들 목록을 받아야 한다.
        BbsVO[] ar = BbsDAO.getList(bname, page.getBegin(), page.getEnd());

        // JSP에서 표현하기 위해 request에 저장!
        request.setAttribute("ar", ar);
        request.setAttribute("page", page);
        request.setAttribute("nowPage", page.getNowPage()); //list.jsp 에서 값으로 사용가능

        return "list.jsp"; //forward
    }
}
