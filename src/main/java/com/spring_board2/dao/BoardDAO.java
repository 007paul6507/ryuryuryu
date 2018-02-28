package com.spring_board2.dao;

import java.util.List;

import com.spring_board2.dto.BoardVO;
import com.spring_board2.dto.Criteria;


public interface BoardDAO {
	public List<BoardVO> selectboard() throws Exception;
	public BoardVO selectone(Integer id) throws Exception;
	public void create(BoardVO vo) throws Exception;
	public void delete(Integer id) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void cntupdate(Integer id) throws Exception;



	  public List<BoardVO> listPage(int page) throws Exception;

	  public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	  public int countPaging(Criteria cri) throws Exception;

}
