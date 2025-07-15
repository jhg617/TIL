package test.vo;

public class ParamVO {
    // 사용자가 원하는 변수명을 파라미터명과 동일하게 선언하자!
    // DB작업까지 같이 진행할 때는 파라미터명과
    // 테이블의 컬럼명, 멤버변수 명이 일치하도록 한다.
    private String s_name, s_email;
    private int s_age; //원래 파라미터는 문자열이 온다. 그리고 막혀있지만 setter에 의해서 값이 들어온다.

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_email() {
        return s_email;
    }

    public void setS_email(String s_email) {
        this.s_email = s_email;
    }

    public int getS_age() {
        return s_age;
    }

    public void setS_age(int s_age) {
        this.s_age = s_age;
    }
}
