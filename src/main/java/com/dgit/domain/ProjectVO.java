package com.dgit.domain;

import java.util.Date;

public class ProjectVO {
	private int num;
	private String name;
	private String content;
	private Date startdate;
	private Date enddate;
	private String ing;

	public ProjectVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getIng() {
		return ing;
	}

	public void setIng(String ing) {
		this.ing = ing;
	}

	@Override
	public String toString() {
		return "ProjectVO [num=" + num + ", name=" + name + ", content=" + content + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", ing=" + ing + "]";
	}

}
