package com.spring_board2.service;

import java.util.List;

import com.spring_board2.dto.BoardVO;

public interface BoardService {
	public List<BoardVO> selectboard() throws Exception;

}
