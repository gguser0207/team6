package dev.mvc.categrp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @ Setter @ToString
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

}
