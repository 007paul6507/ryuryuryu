package com.spring_board2.dao;

import java.util.List;

import com.spring_board2.dto.Criteria;
import com.spring_board2.dto.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(Integer id) throws Exception;
	public void create(ReplyVO vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer id) throws Exception;
}
