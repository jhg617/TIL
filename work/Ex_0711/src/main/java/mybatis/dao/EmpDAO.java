package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class EmpDAO {

    //사원들을 목록으로 반환(EmpVO[] 또는 List<EmpVO>)하는 기능
    public static List<EmpVO> getAll(){
        // 팩토리를 통해 SqlSession을 얻어야 한다.
        SqlSession ss = FactoryService.getFactory().openSession();
        List<EmpVO> list = ss.selectList("emp.all");
        ss.close();
        return list;
    }

    public static int addEmp(String empno, String ename,
                             String job, String hiredate){
        // emp.add라는 매퍼를 호출하기 위해 EmpVO가 필요함
        EmpVO vo = new EmpVO();
        //인자로 받은 empno, ename, job, hiredate를 생성한 vo에 저장!
        vo.setEmpno(empno);
        vo.setEname(ename);
        vo.setJob(job);
        vo.setHiredate(hiredate);

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
