package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class EmpDAO {

    public static EmpVO[] getAll(){ //화면에 표현하기 위해 getAll()을 호출하여 배열로 받는다.
        SqlSession ss = FactoryService.getFactory().openSession();
        EmpVO[] ar = null;
        List<EmpVO> list = ss.selectList("emp.all");
        if(list != null && !list.isEmpty()){
            ar = new EmpVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

    public static int add(EmpVO vo){
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();
        cnt = ss.insert("emp.add", vo);
        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }

    public static int search(EmpVO vo){
        SqlSession ss = FactoryService.getFactory().openSession();
        EmpVO[] ar = null;
        List<EmpVO> list = ss.selectList("emp.search", vo);
        if(list != null && !list.isEmpty()){
            ar = new EmpVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }
}
