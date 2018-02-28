package com.spring_board2.service;

import java.util.List;

import com.spring_board2.dto.Criteria;
import com.spring_board2.dto.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo) throws Exception;
	public List<ReplyVO> listReply(Integer id) throws Exception;
	public void modifyReply(ReplyVO vo) throws Exception;
	public void deleteReply(Integer rno) throws Exception;
	public List<ReplyVO> listReplyPage(Integer id, Criteria cri) throws Exception;
	public int count(Integer id) throws Exception;
}
