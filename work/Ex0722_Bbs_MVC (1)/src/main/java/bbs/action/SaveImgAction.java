package bbs.action;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class SaveImgAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 이미지들이 저장될 위치를 절대경로로 준비해야 한다.
        ServletContext application = request.getServletContext();
        String realPath = application.getRealPath("/editor_img");

        //첨부되어오는 이미지 파일을 위에서 준비한 절대경로에 업로드 시키기 위해서다.
        // 그렇게 하기 위해서는 cos라이브러리의 MultipartRequest객체가 필요함!
        try {
            MultipartRequest mr = new MultipartRequest(request, realPath,
                    1024*1024*5, "utf-8",
                    new DefaultFileRenamePolicy());
            // 이때 파일은 이미 editor_img폴더에 업로드가 된 상태다.

            //파일이 저장될 때 이름이 변경될 수 있기때문에 저장된 파일의
            // 정확한 이름을 알아내야 한다.
            File f = mr.getFile("upload");
            String fname = null;
            if( f != null ) {
                fname = f.getName();//저장된 파일명!!!!!
                request.setAttribute("f_name", fname);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "saveImg.jsp";
    }
}
