package dev.mvc.categrp;

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
}
