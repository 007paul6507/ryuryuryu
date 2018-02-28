package com.spring_board2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring_board2.dao.BoardDAO;
import com.spring_board2.dto.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
 
    @Inject
    private BoardDAO dao;
    
    @Override
    public List<BoardVO> selectboard() throws Exception {
 
        return dao.selectboard();
    }
 
}

