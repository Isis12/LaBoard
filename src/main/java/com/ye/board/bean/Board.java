package com.ye.board.bean;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.ye.board.been.entity.BoardFile;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("board")
@Data
@Accessors(chain = true)
public class Board {
	private int b_num;
	private String b_title;
	private String b_contents;
	private String b_id;
	private String m_name;
	private String b_date;
	private int b_views;
	
	private List<BoardFile> bfList; //첨부파일
	

}
