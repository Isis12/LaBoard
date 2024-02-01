package com.ye.board.bean;

import java.security.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("reply")
@Accessors(chain = true)
@Data
public class Reply {
	private int r_bnum;
	private int r_num;
	private String r_contents;
	
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Timestamp r_data;
	private String r_id;
}
