package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;
import org.apache.ibatis.session.SqlSession;


import java.util.List;

public class EmpDAO {

    public static EmpVO[] getAll(){
        EmpVO[] ar = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        List<EmpVO> list = ss.selectList("emp.all");
        if(list != null && !list.isEmpty()){
            ar = new EmpVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }
}
