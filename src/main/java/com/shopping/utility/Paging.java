package com.shopping.utility;

public class Paging {
	// 페이징을 위한 클래스
	private int totalCount = 0 ; // 테이블에 들어 있는 총 행의 개수
	private int totalPage = 0 ; // 전체 페이지 수
	
	private int pageNumber = 0 ; // 현재 페이지 번호
	private int pageSize = 0 ; // 한 페이지에 보여줄 행의 개수 
	private int beginRow = 0 ; // 현재 페이지에 보여지는 시작 랭킹 번호 
	private int endRow = 0 ; // 현재 페이지에 보여지는 끝 랭킹 번호 
	
	private int pageCount = 10 ; // 하단 중간에 보이는 페이지 링크 개수
	private int beginPage = 0 ; // 페이지 링크 시작 번호
	private int endPage = 0 ; // 페이지 링크 끝 번호 
	
	private String url = "" ; // 게시물 보여 주는 페이지(예시 : boList)
	private String pagingHtml = "" ; // 하단의 이전/다음/숫자 목록 페이지 하이퍼 링크를 저장하고 있는 문자열
	private String pagingStatus = "" ; // 상단 우측의 현재 페이지 현황(예시 : 총 295건[12/30])
	
	private String mode = "" ; // 검색 모드(예시 : 작성자, 글제목 등등)
	private String keyword = "" ; // 검색할 단어	
	
	private String flowParameter = "" ; // 페이지 이동시 같이 수반되는 파라미터 리스트
	
	public Paging(String _pageNumber, String _pageSize, int totalCount, String url, String mode, String keyword, boolean isGrid) {

	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBeginRow() {
		return beginRow;
	}

	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public String getPagingStatus() {
		return pagingStatus;
	}

	public void setPagingStatus(String pagingStatus) {
		this.pagingStatus = pagingStatus;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFlowParameter() {
		return flowParameter;
	}

	public void setFlowParameter(String flowParameter) {
		this.flowParameter = flowParameter;
	}

	@Override
	public String toString() {
		return "Paging [totalCount=" + totalCount + ", totalPage=" + totalPage + ", pageNumber=" + pageNumber
				+ ", pageSize=" + pageSize + ", beginRow=" + beginRow + ", endRow=" + endRow + ", pageCount="
				+ pageCount + ", beginPage=" + beginPage + ", endPage=" + endPage + ", url=" + url + ", pagingHtml="
				+ pagingHtml + ", pagingStatus=" + pagingStatus + ", mode=" + mode + ", keyword=" + keyword
				+ ", flowParameter=" + flowParameter + "]";
	}	
	
}
