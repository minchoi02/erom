package egovframework.base.service;

import java.io.Serializable;

import egovframework.base.service.BasePagingVO;

@SuppressWarnings("serial")
public class BasePagingVO implements Serializable {
	
	 /** 현재페이지 */
    private int pageIndex = 1;
    
    /** 페이지갯수 */
    private int pageUnit = 10;
    
    /** 페이지사이즈 */
    private int pageSize = 10;
    
    /** 모바일 페이지갯수 */
    private int mobilepageUnit = 10;
    
    /** 모바일 페이지사이즈 */
    private int mobilepageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;
    
	public int getPageIndex() { return pageIndex; }
	public void setPageIndex(int pageIndex) { this.pageIndex = pageIndex; }

	public int getPageUnit() { return pageUnit; }
	public void setPageUnit(int pageUnit) { this.pageUnit = pageUnit; }
	
	public int getMobilePageUnit() { return mobilepageUnit; }
	public void setMobilePageUnit(int mobilepageUnit) { this.mobilepageUnit = mobilepageUnit; }

	public int getPageSize() { return pageSize; }
	public void setPageSize(int pageSize) { this.pageSize = pageSize; }
	
	public int getMobilePageSize() { return mobilepageSize; }
	public void setMobilePageSize(int mobilepageSize) { this.mobilepageSize = mobilepageSize; }

	public int getFirstIndex() { return firstIndex; }
	public void setFirstIndex(int firstIndex) { this.firstIndex = firstIndex; }

	public int getLastIndex() { return lastIndex; }
	public void setLastIndex(int lastIndex) { this.lastIndex = lastIndex; }

	public int getRecordCountPerPage() { return recordCountPerPage; }
	public void setRecordCountPerPage(int recordCountPerPage) { this.recordCountPerPage = recordCountPerPage; }
	
}