package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.ProjectVO;

@Repository
public class ProjectDaoImpl implements ProjectDao {
	private static final String namespace = "com.dgit.persistence.ProjectDao";
	
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public void insert(ProjectVO project) throws Exception {
		sqlSession.insert(namespace + ".insert", project);
		
	}


	@Override
	public void delete(int num) throws Exception {
		sqlSession.delete(namespace + ".delete", num);
		
	}


	@Override
	public void update(ProjectVO project) throws Exception {
		sqlSession.update(namespace + ".update", project);
		
	}


	@Override
	public List<ProjectVO> selectAll() throws Exception {
		return sqlSession.selectList(namespace + ".selectAll");
	}


	@Override
	public ProjectVO selectByNum(int num) throws Exception {
		return sqlSession.selectOne(namespace + ".selectByNum", num);
	}


	@Override
	public List<ProjectVO> listPage(int page) throws Exception {
		return sqlSession.selectList(namespace + ".listPage", page);
	}


	@Override
	public List<ProjectVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}


	@Override
	public int selectTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".selectTotalCount");
	}
	
	

}
