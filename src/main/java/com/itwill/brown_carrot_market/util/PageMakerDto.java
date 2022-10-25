package com.itwill.brown_carrot_market.util;

import java.util.List;

public class PageMakerDto<E> {
	private List<E> itemList;
	private PageMaker pageMaker;
	private int totRecordCount;

	public PageMakerDto() {
	}

	public PageMakerDto(List<E> itemList, PageMaker pageMaker, int totRecordCount) {
		super();
		this.itemList = itemList;
		this.pageMaker = pageMaker;
		this.totRecordCount = totRecordCount;
	}

	public List<E> getItemList() {
		return itemList;
	}

	public void setItemList(List<E> itemList) {
		this.itemList = itemList;
	}

	public PageMaker getPageMaker() {
		return pageMaker;
	}

	public void setPageMaker(PageMaker pageMaker) {
		this.pageMaker = pageMaker;
	}

	public int getTotRecordCount() {
		return totRecordCount;
	}

	public void setTotRecordCount(int totRecordCount) {
		this.totRecordCount = totRecordCount;
	}
	
}
