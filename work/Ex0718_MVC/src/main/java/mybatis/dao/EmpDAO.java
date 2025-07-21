package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    //************* 250721 수정 ***************
    public static EmpVO[] search(String searchType, String searchValue){
        EmpVO[] ar = null;

        //안에서 Map 구조 만들기
        Map<String, String> map = new HashMap<>();
        if(searchType != null)
            map.put("searchType", searchType);
        if(searchValue != null)
            map.put("searchValue", searchValue);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<EmpVO> list = ss.selectList("emp.search", map);

        if(list != null && list.size() > 0){
            // DB로부터 받은것이 있다면 배열로 생성한다.
            ar = new EmpVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }
    /*public static EmpVO[] search(Map<String, String> map){
        SqlSession ss = FactoryService.getFactory().openSession();
        EmpVO[] ar = null;
        List<EmpVO> list = ss.selectList("emp.search", map); //파라미터로 Map 전달
        if(list != null && !list.isEmpty()){
            ar = new EmpVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }*/
}
