package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.ProjectVO;

public interface ProjectDao {
	public void insert(ProjectVO project) throws Exception;
	public void delete(int num) throws Exception;
	public void update(ProjectVO project) throws Exception;
	public List<ProjectVO> selectAll() throws Exception;
	public ProjectVO selectByNum(int num) throws Exception;
	public List<ProjectVO> listPage(int page) throws Exception;
	public List<ProjectVO> listCriteria(Criteria cri) throws Exception;
	public int selectTotalCount() throws Exception;
}
