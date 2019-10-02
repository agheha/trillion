package kr.co.momstudy.util;

import kr.co.momstudy.repository.vo.Search;

public class PageResult {
	int pageNo;
	int count;
	
	int beginPage;
	int endPage;
	
	boolean prev;
	boolean next;
	
	public PageResult(int pageNo, int count) {
		this(pageNo, count, 10, 10);
	}
	
	public PageResult(int pageNo, int count, int listSize, int tabSize) {
		this.pageNo = pageNo;
		this.count = count;
		
		int lastPage = (int)Math.ceil(count / (double)listSize);
		int currTab = (int)Math.ceil(pageNo / (double)tabSize);
		this.beginPage = (currTab - 1) * tabSize + 1;
		this.endPage = currTab * tabSize;
		if(endPage > lastPage) {endPage = lastPage;}
		this.prev = (pageNo != 1);
		this.next = (endPage != lastPage);
	}
	
	
	
	public int getPageNo() { return pageNo; }
	public int getCount() { return count; }
	public int getBeginPage() { return beginPage; }
	public int getEndPage() { return endPage; }
	public boolean isPrev() { return prev; }
	public boolean isNext() { return next; }
	
}
