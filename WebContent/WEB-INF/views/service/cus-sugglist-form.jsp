<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		    <br>
				<p class="secondary-content">
					<form method="post" action="">
						<table class="highlight centered">
							<thead id="sugg_info_head">
							</thead>
							<tbody id="sugg_info_body">
							</tbody>
						</table>
						<div>
							<table>
								<tr>
									<div><td>비교할 제안 목록</td></div>
									<input type="hidden" id="sugglists">
									<div><td><a class="waves-effect waves-light btn" onclick="doCompareButton()">비교하기 버튼</a></td></div>
									<div id="sugg_info_compare">
									<tr>
										<c:forEach items="${lists}" var="appli">
											<td>
												<div class="row">
												    <div class="col s12 m6">
												      <div class="card blue-grey darken-1">
												        <div class="card-content white-text">
												          <span class="card-title">Card Title</span>
												          <p>I am a very simple card. I am good at containing small bits of information.
												          I am convenient because I require little markup to use effectively.</p>
												        </div>
												        <div class="card-action">
												         <!--  <a href="#">This is a link</a>
												          <a href="#">This is a link</a> -->
												        </div>
												      </div>
												    </div>
												  </div>
											</td>
										 </c:forEach>
									</tr>
								</tr>
							</table>
						</div>
					</form>
				</p>