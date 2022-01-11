package dev.mvc.categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.categrp.CategrpDAOInter;
import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
@Component("dev.mvc.categrp.CategrpProc")

    
    public class CategrpProc implements CategrpProcInter {
        
        @Autowired
        private CategrpDAOInter CategrpDAO;

        @Override
        public int create(CategrpVO categrpVO) {
            int cnt = CategrpDAO.create(categrpVO);
            return cnt;
        }

        @Override
        public List<CategrpVO> list() {
            List<CategrpVO> list = this.CategrpDAO.list();
            return list;
        }

        @Override
        public int update_seqno_up(int categrp_no) {
            int cnt = this.CategrpDAO.update_seqno_up(categrp_no);
            return cnt;
        }

        @Override
        public int update_seqno_down(int categrp_no) {
            int cnt = this.CategrpDAO.update_seqno_down(categrp_no);
            return cnt;
        }

        @Override
        public int delete(int categrp_no) {
            int cnt = this.CategrpDAO.delete(categrp_no);
            return cnt;
        }

        @Override
        public int update_visible(CategrpVO categrpVO) {
            int cnt = 0;
            if (categrpVO.getVisible().toUpperCase().equals("Y")) {
                categrpVO.setVisible("N");
            } else {
                categrpVO.setVisible("Y");
            }
            cnt = this.CategrpDAO.update_visible(categrpVO);
            return cnt; 
        }

        @Override
        public int update(CategrpVO categrpVO) {
            int cnt = this.CategrpDAO.update(categrpVO);
            return cnt;
        }
        
        @Override
        public CategrpVO read(int categrp_no) {
          CategrpVO categrpVO = this.CategrpDAO.read(categrp_no);
          
          return categrpVO;
        }
        
}
