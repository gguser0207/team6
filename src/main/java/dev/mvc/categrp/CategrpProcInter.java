package dev.mvc.categrp;

import java.util.List;

public interface CategrpProcInter {
    
    public int create(CategrpVO categrpVO);
    
    public List<CategrpVO> list();

    public int update_seqno_up(int categrp_no);
    
    public int update_seqno_down(int categrp_no);
    
    public int delete(int categrp_no); 
    
    public int update_visible(CategrpVO categrpVO);
    
    public int update(CategrpVO categrpVO);
    
    public CategrpVO read(int categrp_no);
}
