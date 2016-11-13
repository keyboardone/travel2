package cn.itcast.domain;

import java.util.List;

public class QueryResult {
//定义一个对象，返回分页信息
	private List list;
	private int totalrecord;
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	
}
