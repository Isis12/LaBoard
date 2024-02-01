package com.ye.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ye.board.bean.Board;

public interface IBoardDao {

	List<Board> getBoardList(int pageNum);

	@Select("SELECT COUNT(*) FROM BLIST")
	int getBoardCount();

	@Insert("INSERT INTO BOARD_FILE VALUES(BF_SEQ.NEXTVAL, #{bnum}, #{origFileName}, #{sysFileName})")
	boolean fileInsert(Map<String, String> fMap);

	boolean boardWrite(Board board);

	Board getContents(int num);

	boolean deleteBoard(@Param("num") String num);

	List<Board> boardSearch(@Param("keyword") String keyword, @Param("choice") String choice);

	boolean boardmodify(Board board);



}
