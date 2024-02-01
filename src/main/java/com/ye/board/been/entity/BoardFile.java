package com.ye.board.been.entity;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
@Alias("boardFile")
@Data
@Accessors(chain = true)
public class BoardFile {  //테이블BoardFile
	private int bf_num;
	private int bf_bnum;
	private String bf_origname;
	private String bf_sysname;
}