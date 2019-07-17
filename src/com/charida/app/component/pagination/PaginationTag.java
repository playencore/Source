package com.charida.app.component.pagination;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class PaginationTag extends TagSupport {
	
	private static final long serialVersionUID = 1L;
	
	private PaginationInfo paginationInfo;
	private String jsFunction;
	
	public int doEndTag() throws JspException{
		
		try {
			
			JspWriter out = pageContext.getOut();
            
            PaginationRenderer paginationRenderer = new DefaultPaginationRenderer();
            
            String contents = paginationRenderer.renderPagination(paginationInfo, jsFunction);
            
            out.println(contents);
            
            return EVAL_PAGE;
            
        } catch (IOException e) {
            throw new JspException();
        }
	}
			
	public void setJsFunction(String jsFunction) {
		this.jsFunction = jsFunction;
	}

	public void setPaginationInfo(PaginationInfo paginationInfo) {
		this.paginationInfo = paginationInfo;
	}
}
