package com.spring_board2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring_board2.dto.Criteria;
import com.spring_board2.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.spring_board2.mapper.replyMapper";
	
	@Override
	public List<ReplyVO> list(Integer id) throws Exception{
		return sqlSession.selectList(Namespace+".list",id);
	}
	
	@Override
	public void create(ReplyVO vo) throws Exception{
		sqlSession.insert(Namespace+".create", vo);
	}
	
	@Override
	public void delete(Integer rno) throws Exception{
		sqlSession.insert(Namespace+".delete", rno);
	}
	
	@Override
	public void update(ReplyVO vo) throws Exception{
		sqlSession.insert(Namespace+".update", vo);
	}
	
	@Override
	public List<ReplyVO> listPage(Integer id,Criteria cri) throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("id",id);
		paramMap.put("cri",cri);
		
		return sqlSession.selectList(Namespace+".listPage",paramMap);
	}
	
	@Override
	public int count(Integer id) throws Exception{
		return sqlSession.selectOne(Namespace+".count",id);
	}
	
}
