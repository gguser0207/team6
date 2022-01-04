package dev.mvc.categrp;


public class CategrpVO {
    /** 카테고리 그룹 번호 */
    private int categrp_no;
    /** 카테고리 이름 */
    private String categrp_name;
    /** 출력 순서 */
    private int seqno;
    /** 출력 모드 */
    private String visible;
    /** 등록일 */
    private String rdate;

    public CategrpVO() {

    }

    public CategrpVO(int categrp_no, String categrp_name, int seqno, String visible, String rdate) {
        super();
        this.categrp_no = categrp_no;
        this.categrp_name = categrp_name;
        this.seqno = seqno;
        this.visible = visible;
        this.rdate = rdate;
    }

    public int getCategrp_no() {
        return categrp_no;
    }

    public void setCategrp_no(int categrp_no) {
        this.categrp_no = categrp_no;
    }

    public String getCategrp_name() {
        return categrp_name;
    }

    public void setCategrp_name(String categrp_name) {
        this.categrp_name = categrp_name;
    }

    public int getSeqno() {
        return seqno;
    }

    public void setSeqno(int seqno) {
        this.seqno = seqno;
    }

    public String getVisible() {
        return visible;
    }

    public void setVisible(String visible) {
        this.visible = visible;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    @Override
    public String toString() {
        return "CategrpVO [categrp_no=" + categrp_no + ", categrp_name=" + categrp_name + ", seqno=" + seqno + ", visible=" + visible
                + ", rdate=" + rdate + "]";
    }

    
}
