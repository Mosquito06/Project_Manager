package com.dgit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.Criteria;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ProjectVO;
import com.dgit.service.ProjectService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private ProjectService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("startProject");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.selectTotalCount());
		
		try {
			List<ProjectVO> list = service.listCriteria(cri);
		
			logger.info("list: " + list.size());
			
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "main";
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.GET)
	public String addProject(){
		logger.info("addProject");
		
		
		return "addPage";
	}
	
	@RequestMapping(value="/addProject", method=RequestMethod.POST)
	public String addProjectPost(ProjectVO project, String start, String end) throws ParseException{
		logger.info("addProjectPost");
		logger.info("project = " + project.toString());
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = format.parse(start);
		Date enddate = format.parse(end);

		project.setStartdate(startdate);
		project.setEnddate(enddate);
		 
		try {
			service.insert(project);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect: /projectmanager/";
	}
	
	@RequestMapping(value="/readProject/{num}", method = RequestMethod.GET)
	public String readPage(@PathVariable("num") int num, @ModelAttribute("cri") Criteria cri, Model model){
		logger.info("readPage");
			try {
				ProjectVO vo = service.selectByNum(num);
				model.addAttribute("project", vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return "readPage";
	}
	
	@RequestMapping(value="/delProject/{num}", method = RequestMethod.GET)
	public String delete(@PathVariable("num") int num){
		logger.info("delete");
			try {
				service.delete(num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return "redirect: /projectmanager/";
	}
	
	@RequestMapping(value="/upProject/{num}", method = RequestMethod.GET)
	public String update(@PathVariable("num") int num, Model model){
		logger.info("update");
					
		try {
			ProjectVO vo = service.selectByNum(num);
			model.addAttribute("project", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "updatePage";
	}
	
	@RequestMapping(value="/upProject", method = RequestMethod.POST)
	public String updatePost(ProjectVO project, String start, String end, Model model) throws ParseException{
		logger.info("updatePost");
					
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = format.parse(start);
		Date enddate = format.parse(end);

		project.setStartdate(startdate);
		project.setEnddate(enddate);
		 
		try {
			service.update(project);
			model.addAttribute("project", project); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect: /projectmanager/readProject/" + project.getNum();
	}
}
