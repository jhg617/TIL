package ex1.vo;

public class TestVO {
    private String msg;

    //기본생성자 생성
    public TestVO() {
        System.out.println("TestVO 생성");
    }

    //getter, setter 생성
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
