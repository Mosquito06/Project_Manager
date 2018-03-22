package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.ProjectVO;
import com.dgit.persistence.ProjectDao;

@Repository
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDao dao;
	
	@Override
	public void insert(ProjectVO project) throws Exception {
		dao.insert(project);
		
	}

	@Override
	public void delete(int num) throws Exception {
		dao.delete(num);
		
	}

	@Override
	public void update(ProjectVO project) throws Exception {
		dao.update(project);
		
	}

	@Override
	public List<ProjectVO> selectAll() throws Exception {
		return dao.selectAll();
	}

	@Override
	public ProjectVO selectByNum(int num) throws Exception {
		return dao.selectByNum(num);
	}

	@Override
	public List<ProjectVO> listPage(int page) throws Exception {
		return dao.listPage(page);
	}

	@Override
	public List<ProjectVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int selectTotalCount() throws Exception {
		return dao.selectTotalCount();
	}
}
