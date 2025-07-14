package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MemoVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class MemoDAO {

    //memoList.jsp에서 표현할 메모목록
    public static List<MemoVO> getAll(){
        //DB의 sql문을 호출하기 위해서는 SqlSession이 있어야 한다.
        //그리고 그 SqlSession은 Factory를 통해야 얻을 수 있다.
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MemoVO> list = ss.selectList("memo.all");
        ss.close();
        return list;
    }

    //메모를 저장하는 기능
    public static int addMemo(String writer, String content, String ip){
        //인자로 받은 writer, content, ip를 add라는 Mapper로 보내기 위해
        //해당 Mapper의 인자(ParameterType)인 Map구조를 준비해야 한다.
        HashMap<String, String> map = new HashMap<>(); //HashMap 상위에 위치한 Map으로 지정해도 가능하다.
        map.put("writer", writer); //key: "writer", value: writer (mapper에서 정의한 이름과 같아야 한다!)
        map.put("content", content);
        map.put("ip", ip);

        //이제 add라는 Mapper를 호출하기 위해 SqlSession이 필요함
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("memo.add", map); //반환형 int는 수행(추가,삭제 등)된 레코드의 수를 의미한다.

        //cnt는 저장된 레코드의 수를 저장한다.
        if(cnt>0) //추가됐다면
            ss.commit(); //커밋
        else
            ss.rollback(); //추가 안됐을경우 롤백
        ss.close(); //스트림 닫기
        return cnt;
    }
}
