package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ShopDAO {

    //카테고리를 인자로 받아서 목록을 반환하는 기능
    public static ProductVO[] getList(String category){
        //인자로 받은 카테고리 값(com001, ele002, sp003) 중 하나를
        // 받아서 shop_t라는 테이블로부터 해당 제품들을 검색한다. 그렇게 하기 위해서
        // SQLSession이 필요하다.
        SqlSession ss = FactoryService.getFactory().openSession();

        //mapper의 resultType을 리스트로 받아야한다.
        List<ProductVO> list = ss.selectList("shop.list", category);
        ss.close();

        ProductVO[] ar = null; //검색된 결과가 있을때만 생성하자!
        if(list != null && list.size()>0){
            //배열을 list의 크기와 같도록 만든다.
            ar = new ProductVO[list.size()];

            //list의 저장된 요소들을 배열에 복사해 넣는다.
            list.toArray(ar);
        }
        return ar;
    }
}
