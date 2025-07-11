package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MemoVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MemoDAO {

    public static List<MemoVO> getAll(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MemoVO> list = ss.selectList("memo.all");
        ss.close();
        return list;
    }

    public static int addMemo(String writer, String content,
                              String reg_date, String ip){
        MemoVO vo = new MemoVO();
        vo.setWriter(writer);
        vo.setContent(content);
        vo.setReg_date(reg_date);
        vo.setIp(ip);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("emp.add", vo);
        if(cnt>0) //추가됐다면
            ss.commit(); //커밋
        else
            ss.rollback(); //추가 안됐을경우 롤백
        ss.close(); //스트림 닫기
        return cnt;
    }
}
