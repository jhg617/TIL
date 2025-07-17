package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;
import mybatis.vo.MemoVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MemoDAO {

    public static MemoVO[] getAll(){
        MemoVO[] ar = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        List<MemoVO> list = ss.selectList("memo.all");
        if(list != null && !list.isEmpty()){
            ar = new MemoVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }
}
