package mybatis.dao;

import mybatis.vo.EmpVO;
import mybatis.vo.MemVO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmpDAO {
    private static SqlSessionFactory factory; //외부에서 해당 팩토리에 접근하지 못하며 한개만 만들어진다.

    //static초기화 - 가장 빠르게 인식되어 1번 움직여서 static변수들을 초기화 한다.
    static {
        try {
            //Mybatis준비 ------------------------------------------------------------------
            Reader r = Resources.getResourceAsReader("mybatis/config/conf.xml");
            factory = new SqlSessionFactoryBuilder().build(r);
            r.close();
            //------------------------------- 한번만 수행됨 ----------------------------------
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //전체보기 기능
    public static EmpVO[] getAll(){ // 멤버메서드 - 객체생성한 후 사용할 수 있지만 static이 붙으면 객체 생성없이 사용 가능
        EmpVO[] ar = null; //Emp가 몇개가 들어올지 모르니까 null로 지정
        SqlSession ss = factory.openSession();

        List<EmpVO> list = ss.selectList("emp.all");
        //list의 size크기 만큼 배열의 크기를 지정하자!
        ar = new EmpVO[list.size()]; // 사원의 개수만큼 담을 수 있는 EmpVO[]. 실제로 사원은 list에 저장된다.
        /*
        int i = 0;
        for(EmpVO vo : list){
            ar[i] = vo;
            i++;
        }
         */
        ss.close();
        list.toArray(ar); //list에 있는 모든 요소가 ar에 복사한다.
        return ar;
    }
    //사번 검색
    public static EmpVO getEmp(String empno){
        SqlSession ss = factory.openSession();

        EmpVO vo = ss.selectOne("emp.get_emp", empno);
        ss.close();
        return vo;
    }

    //동적쿼리를 사용한 검색 기능
    public static EmpVO[] search(String searchType, String searchValue){
        EmpVO[] ar = null;

        //받은 인자를 emp.search라는 sql문에게 전달하기 위해
        // Map구조로 만들어야한다.
        Map<String, String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);

        SqlSession ss = factory.openSession();
        List<EmpVO> list = ss.selectList("emp.search", map);
        ar = new EmpVO[list.size()];
        //list에 있는 모든 데이터를 ar에 복사한다.
        list.toArray(ar);
        ss.close();
        return ar;
    }

    //로그인 하는 함수
    public static MemVO login(String id, String pw){
        Map<String, String> map =
                new HashMap<>();
        map.put("id", id);
        map.put("pw", pw);

        SqlSession ss = factory.openSession();
        MemVO mvo = ss.selectOne("mem.login", map);
        ss.close();
        return mvo;
    }

}
