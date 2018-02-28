package com.spring_board2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring_board2.dao.ReplyDAO;
import com.spring_board2.dto.Criteria;
import com.spring_board2.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public void addReply(ReplyVO vo) throws Exception{
		dao.create(vo);
	}
	
	@Override
	public List<ReplyVO> listReply(Integer id) throws Exception{
		return dao.list(id);
	}
	
	@Override
	public void modifyReply(ReplyVO vo) throws Exception{
		dao.update(vo);
	}
	
	@Override
	public void deleteReply(Integer rno) throws Exception{
		dao.delete(rno);
	}
	
	@Override
	public List<ReplyVO> listReplyPage(Integer id, Criteria cri) throws Exception{
		return dao.listPage(id, cri);
	}
	
	@Override
	public int count(Integer id) throws Exception{
		return dao.count(id);
	}
	
}
