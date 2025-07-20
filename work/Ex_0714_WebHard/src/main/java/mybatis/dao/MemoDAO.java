package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MemoVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemoDAO {

    //memoList.jsp에서 표현할 메모목록
    public static List<MemoVO> memoList(){
        //DB의 sql문을 호출하기 위해서는 SqlSession이
        //있어야 한다. 그리고 그 SqlSession은
        // Factory를 통해야 얻을 수 있다.
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MemoVO> list = ss.selectList("memo.all");
        ss.close();
        return list;
    }

    //메모를 저장하는 기능
    public static int add(String writer, String content, String ip){
        //인자로 받은 writer, content, ip를 add라는 Mapper로 보내기 위해
        // 해당 Mapper의 인자(parameterType)인 Map구조를 준비해야 한다.
        Map<String,String> map = new HashMap<>();
        map.put("writer", writer);
        map.put("content", content);
        map.put("ip", ip);

        //이제 add라는 Mapper를 호출하기 위해 SqlSession이 필요함
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("memo.add", map);
        //cnt는 저장된 레코드의 수를 저장한다.

        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();

        return cnt;
    }
}
