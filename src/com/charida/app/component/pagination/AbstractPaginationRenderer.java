package com.charida.app.component.pagination;

import java.text.MessageFormat;

public abstract class AbstractPaginationRenderer implements PaginationRenderer{
	/**
	 * firstPageLabel = [처음]
	 * previousPageLabel = [이전]
	 * currentPageLabel = 현재 페이지 번호
	 * otherPageLabel = 현재 페이지를 제외한 페이지 번호
	 * nextPageLabel = [다음]
	 * lastPageLabel = [마지막]
	 */
	public String firstPageLabel;
	public String previousPageLabel;
	public String currentPageLabel;
	public String otherPageLabel;
	public String nextPageLabel;
	public String lastPageLabel;
	
	public String renderPagination(PaginationInfo paginationInfo,String jsFunction){
		
		StringBuffer strBuff = new StringBuffer();
        
        int firstPageNo = paginationInfo.getFirstPageNo();
        int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
        int totalPageCount = paginationInfo.getTotalPageCount();
		int pageSize = paginationInfo.getPageSize();
		int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
		int currentPageNo = paginationInfo.getCurrentPageNo();
		int lastPageNo = paginationInfo.getLastPageNo();
		strBuff.append("<ul class=\"pagination\">");
		if(currentPageNo > pageSize){
			if(firstPageNoOnPageList > pageSize){
				strBuff.append(MessageFormat.format(firstPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNo)}));
				strBuff.append(MessageFormat.format(previousPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNoOnPageList-1)}));
	        }else{
	        	strBuff.append(MessageFormat.format(firstPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNo)}));
				strBuff.append(MessageFormat.format(previousPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNo)}));
	        }
		}
		
		for(int i=firstPageNoOnPageList;i<=lastPageNoOnPageList;i++){
			if(i==currentPageNo){
        		strBuff.append(MessageFormat.format(currentPageLabel,new Object[]{Integer.toString(i)}));
        	}else{
        		strBuff.append(MessageFormat.format(otherPageLabel,new Object[]{jsFunction,Integer.toString(i),Integer.toString(i)}));
        	}
        }
        
		if(totalPageCount > lastPageNoOnPageList){
			if(lastPageNoOnPageList < totalPageCount){
	        	strBuff.append(MessageFormat.format(nextPageLabel,new Object[]{jsFunction,Integer.toString(firstPageNoOnPageList+pageSize)}));
	        	strBuff.append(MessageFormat.format(lastPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNo)}));
	        }else{
	        	strBuff.append(MessageFormat.format(nextPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNo)}));
	        	strBuff.append(MessageFormat.format(lastPageLabel,new Object[]{jsFunction,Integer.toString(lastPageNo)}));
	        }
		}
		strBuff.append("</ul>");
		return strBuff.toString();
	}
}
