package editor.action;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class SaveImgAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        //파일을 저장할 위치(/uplode_img)를 절대경로로 만들자!
        ServletContext application = request.getServletContext(); //절대경로 얻기!
        String realPath = application.getRealPath("/upload_img");

        // cos 라이브러리의 MultipartRequest객체 생성하면
        // 전달되어 오는 파일이 저장된다.
        try{
            MultipartRequest mr = new MultipartRequest(request,realPath,
                    1024*1024*5, "utf-8",
                    new DefaultFileRenamePolicy()); //이름이 겹치는 파일이 있으면 이름을 고침
            // 저장된 파일명과 위치를 JSP에서 표현해야 하므로
            // 저장된 정확한 파일명을 얻어내자!
            File f = mr.getFile("upload"); //이미지 파일명을 파라미터로 입력
            String f_name = null; //파일이름을 초기화
            if(f != null) { //파일이 업로드됐다면,
                f_name = f.getName(); //저장된 실제 파일명
            }   //JSP에서 사용해야 하므로 request에 저장하자!
            request.setAttribute("f_name",f_name); //f_name이라는 이름으로 저장!
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "saveImg.jsp"; //forward
    }
}
