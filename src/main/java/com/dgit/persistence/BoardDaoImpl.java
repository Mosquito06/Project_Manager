package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final String namespace = "com.dgit.persistence.BoardDao";
	
	
	@Autowired
	private SqlSession sqlSession;
	
	

}
