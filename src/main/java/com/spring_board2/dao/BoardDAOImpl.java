package com.spring_board2.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring_board2.dao.BoardDAO;
import com.spring_board2.dto.BoardVO;
import com.spring_board2.dto.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO  {
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.spring_board2.mapper.mapper";
    
    @Override
    public List<BoardVO> selectboard() throws Exception {    	 
        return sqlSession.selectList(Namespace+".selectboard");
    }
    
    @Override
    public BoardVO selectone(Integer id) throws Exception {    	 
        return sqlSession.selectOne(Namespace+".selectone",id);
    }
    
    @Override
    public void create(BoardVO vo) throws Exception{
    	sqlSession.insert(Namespace+".create", vo);
    }
    
    @Override
    public void update(BoardVO vo) throws Exception{
    	sqlSession.update(Namespace+".update", vo);
    }
    
    @Override
    public void delete(Integer id) throws Exception{
    	sqlSession.delete(Namespace+".delete", id);
    }
    
    @Override
    public void cntupdate(Integer id) throws Exception{
    	sqlSession.update(Namespace+".cntupdate", id);
    }
    
    @Override
    public List<BoardVO> listPage(int page) throws Exception {

      if (page <= 0) {
        page = 1;
      }

      page = (page - 1) * 10;

      return sqlSession.selectList(Namespace + ".listPage", page);
    }

    @Override
    public List<BoardVO> listCriteria(Criteria cri) throws Exception {

      return sqlSession.selectList(Namespace + ".listCriteria", cri);
    }

    @Override
    public int countPaging(Criteria cri) throws Exception {

      return sqlSession.selectOne(Namespace + ".countPaging", cri);
    }
}
