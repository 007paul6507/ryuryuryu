package com.spring_board2.boardReply;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_board2.dao.BoardDAO;
import com.spring_board2.dto.BoardVO;
import com.spring_board2.dto.Criteria;
import com.spring_board2.dto.PageMaker;
import com.spring_board2.hibernate.BoardProvider;
import com.spring_board2.hibernate.BoardProviderImpl;
import com.spring_board2.service.BoardService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    //@Inject
    //private MemberService service;
    //@Inject
    //private BoardService service;
    @Inject
    private BoardDAO BDAO;
    private static BoardProvider BPRO;
	/*
    @RequestMapping("list")
    public String home(Locale locale, Model model) throws Exception{
    	 
        logger.info("home");      
        List<BoardVO> boardList = BDAO.selectboard();      
        model.addAttribute("boardList", boardList);
        return "home";
    }
    */
    
	
    @RequestMapping(value = "viewone", method = RequestMethod.GET)
	public String onview(@RequestParam("id") int id,@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
    	logger.info("***************************"+String.valueOf(cri.getPage()));
    	BDAO.cntupdate(id);
		model.addAttribute(BDAO.selectone(id));
		return "viewone";
	}
	
    @RequestMapping(value="index", method=RequestMethod.GET)
    public String write(){
        return "index"; // write.jsp로 이동
    }
    
    @RequestMapping(value="write", method=RequestMethod.POST)
    public String insert(@ModelAttribute BoardVO vo) throws Exception{
        //BDAO.create(vo);
    	BPRO = new BoardProviderImpl();
    	BPRO.insertBoard(vo);
    	
        return "redirect:listPage";
    }
    
    @RequestMapping(value="delete", method=RequestMethod.POST)
    public String delete(@RequestParam("id") int id,Criteria cri, RedirectAttributes rttr) throws Exception{
        BDAO.delete(id);
        
        rttr.addAttribute("page",cri.getPage());
        rttr.addAttribute("perPageNum",cri.getPerPageNum());
        return "redirect:listPage";
    }
    
    @RequestMapping(value="update_index", method=RequestMethod.POST)
    public String update_write(@RequestParam("id") int id, Model model,@ModelAttribute("cri") Criteria cri) throws Exception{
    	model.addAttribute(BDAO.selectone(id));
    	return "update_index"; // write.jsp로 이동
    }
    
    @RequestMapping(value="update_write", method=RequestMethod.POST)
    public String update_insert(@ModelAttribute BoardVO vo,Criteria cri, RedirectAttributes rttr) throws Exception{
        
    	BoardVO shit = new BoardVO();
    	
    	shit.setId(vo.getId());
    	shit.setTitle(vo.getTitle());
    	shit.setContent(vo.getContent());
    	
    	System.out.println(shit.getTitle());
    	
    	BDAO.update(shit);
        rttr.addAttribute("page",cri.getPage());
        rttr.addAttribute("perPageNum",cri.getPerPageNum());
    	
        return "redirect:listPage";
    }
    
    
    @RequestMapping(value ="listCri", method = RequestMethod.GET)
    public void listAll(Criteria cri, Model model) throws Exception{
    	model.addAttribute("list", BDAO.listCriteria(cri));
    }
    
    
    
    @RequestMapping(value ="listPage", method = RequestMethod.GET)
    public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
    	model.addAttribute("list", BDAO.listCriteria(cri));
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCri(cri);
    	pageMaker.setTotalCount(BDAO.countPaging(cri));
    	model.addAttribute("pageMaker",pageMaker);
    	return "listPage";	
    }
    
    @RequestMapping(value = "test", method = RequestMethod.GET)
    public void ajaxTest() {
    	
    }
    
    
	
}
