package com.charida.app.component.pagination;
/**
 * DefaultPaginationRenderer.java
 * <p><b>NOTE:</b><pre> 페이징 리스트의 기본적인 포맷을 제공한다.  
 * 이를 위해 AbstractPaginationRenderer의 클래스 변수들의 값을 세팅한다.  
 * 화면에서 아래와 같이 display 된다.  
 * 
 * [처음][이전] 1 2 3 4 5 6 7 8 [다음][마지막]
 * 
 * 클래스 변수들이 각 element와 다음과 같이 매핑이 된다.
 * firstPageLabel = [처음]
 * previousPageLabel = [이전]
 * currentPageLabel = 현재 페이지 번호
 * otherPageLabel = 현재 페이지를 제외한 페이지 번호
 * nextPageLabel = [다음]
 * lastPageLabel = [마지막]
 * </pre>
 * @author 실행환경 개발팀 함철
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.05.30  함철            최초 생성
 *
 * </pre>
 */
public class DefaultPaginationRenderer extends AbstractPaginationRenderer {
	
	public DefaultPaginationRenderer() {
		//firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">[처음]</a>&#160;";  
		firstPageLabel = "<li class=\"waves-effect\"><a href=\"#!\" onclick=\"{0}({1});  return false;\"><i class=\"material-icons\">first_page</i></a></li>&#160;";
		previousPageLabel = "<li class=\"waves-effect\"><a href=\"#!\" onclick=\"{0}({1});  return false;\"><i class=\"material-icons\">chevron_left</i></a></li>&#160;";
		currentPageLabel = " <li class=\"active\"><a href=\"#!\">{0}</a></li>&#160;";
		otherPageLabel = "<li class=\"waves-effect\"><a href=\"#!\" onclick=\"{0}({1}); return false;\">{2}</a></li>&#160;";
		nextPageLabel = "<li class=\"waves-effect\"><a href=\"#!\" onclick=\"{0}({1});  return false;\"><i class=\"material-icons\">chevron_right</i></a></li>&#160;";
        //lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">[마지막]</a>&#160;";
        lastPageLabel = "<li class=\"waves-effect\"><a href=\"#!\" onclick=\"{0}({1});  return false;\"><i class=\"material-icons\">last_page</i></a></li>&#160;";
	}
	
	@Override
	public String renderPagination(PaginationInfo paginationInfo,
			String jsFunction) {
		
		return super.renderPagination(paginationInfo, jsFunction);
	}

}