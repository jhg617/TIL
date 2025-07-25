package bbs.dao;

import mybatis.service.FactoryService;
import mybatis.vo.CommVO;
import org.apache.ibatis.session.SqlSession;

public class CommDAO {

    //댓글저장
    public static int add(String writer, String content, String pwd,
                          String ip, String b_idx){
        //인자로 받은것들을 VO 객체로 생성
        CommVO cvo = new CommVO();

        cvo.setWriter(writer);
        cvo.setContent(content);
        cvo.setPwd(pwd);
        cvo.setIp(ip);
        cvo.setB_idx(b_idx);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("comm.add", cvo); //namespace : "comm.add"
        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }
}
