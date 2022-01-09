package dev.mvc.member;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class MemberVO {
  /*
  memberno NUMBER(10) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
  id             VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 불가, 레코드를 구분 
  pw            VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  nickname  VARCHAR(30)   NOT NULL, -- 성명, 한글 10자 저장 가능
  phone         VARCHAR(14)   NOT NULL UNIQUE, -- 전화번호, 중복 불가
  email        VARCHAR(60)       NOT NULL UNIQUE, -- 이메일, 중복 불가
  zipcode       NUMBER(7)        NULL, -- 우편번호, 
  address1    VARCHAR(80)       NOT NULL, -- 주소 1
  address2    VARCHAR(50)       NOT NULL, -- 주소 2
  rdate         DATE             NOT NULL, -- 가입일
  grade        NUMBER(2)     NOT NULL, -- 등급(1~10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49, 탈퇴 회원: 99)

  */
 
  public int getMemberno() {
        return memberno;
    }
    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPw() {
        return pw;
    }
    public void setPw(String pw) {
        this.pw = pw;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public int getZipcode() {
        return zipcode;
    }
    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }
    public String getAddress1() {
        return address1;
    }
    public void setAddress1(String address1) {
        this.address1 = address1;
    }
    public String getAddress2() {
        return address2;
    }
    public void setAddress2(String address2) {
        this.address2 = address2;
    }
    public String getRdate() {
        return rdate;
    }
    public void setRdate(String rdate) {
        this.rdate = rdate;
    }
    public int getGrade() {
        return grade;
    }
    public void setGrade(int grade) {
        this.grade = grade;
    }
    public String getOld_passwd() {
        return old_passwd;
    }
    public void setOld_passwd(String old_passwd) {
        this.old_passwd = old_passwd;
    }
    public String getId_save() {
        return id_save;
    }
    public void setId_save(String id_save) {
        this.id_save = id_save;
    }
    public String getPasswd_save() {
        return passwd_save;
    }
    public void setPasswd_save(String passwd_save) {
        this.passwd_save = passwd_save;
    }
    public String getUrl_address() {
        return url_address;
    }
    public void setUrl_address(String url_address) {
        this.url_address = url_address;
    }
/** 회원 번호 */
  private int memberno;
  /** 아이디 */
  private String id = "";
  /** 패스워드 */
  private String pw = "";
  /** 회원 성명 */
  private String nickname = "";
  /** 전화 번호 */
  private String phone = "";
  /** 이메일 */
  private String email = "";
  /** 우편 번호 */
  private int zipcode;
  /** 주소 1 */
  private String address1 = "";
  /** 주소 2 */
  private String address2 = "";
  /** 가입일 */
  private String rdate = "";
  /** 등급 */
  private int grade = 11;
  
  /** 등록된 패스워드 */
  private String old_passwd = "";
  /** id 저장 여부 */
  private String id_save = "";
  /** passwd 저장 여부 */
  private String passwd_save = "";
  /** 이동할 주소 저장 */
  private String url_address = "";
   
}

