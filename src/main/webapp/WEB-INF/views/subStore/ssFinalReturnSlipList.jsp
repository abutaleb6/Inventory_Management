<%@include file="../common/ssHeader.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">

<style>
.loader {
	position: fixed;
	left: 50%;
	top: 50%;
	z-index: 9999;
	/* background-color: none;
	width: 100%;
	height: 100%; */
}
</style>
<!-- -------------------------------------------------------------------------------------- -->
<div class="loader">
	<i class="fa fa-refresh fa-spin fa-3x fa-fw"></i> <br>
	<span class="orange">Loading...</span>
</div>

<div class="container-fluid icon-box" style="background-color: #858585;">
	<div class="row"
		style="background-color: white; padding: 10px; padding-left: 20px">
		<div class="o_form_buttons_edit" style="display: block;">
			<h2 class="center blue"
				style="margin-top: 0; font-style: italic; font-family: 'Ubuntu Condensed', sans-serif;">Item
				Received(Return) List</h2>

			<h4 class="center blue"
				style="margin-top: 0; font-style: italic; font-family: 'Ubuntu Condensed', sans-serif;">${deptName}</h4>

			<%-- <h5 class="center blue"
				style="margin-top: 0; font-style: italic; font-family: 'Ubuntu Condensed', sans-serif;">${deptAddress}</h5> --%>
		</div>
	</div>

	<div class="row" style="background-color: white; padding: 10px; margin: 10px;">
		<!-- --------------------- -->
		<div class="col-sm-12 table-responsive">
			<c:if test="${empty ssReturnSlipMstList}">
				<div class="col-sm-12 center">
					<h2 class="green">
						<i>Congratulation!!! You have no pending task</i>
					</h2>
				</div>
			</c:if>

			<c:if test="${!empty ssReturnSlipMstList}">
				<div class="col-sm-12 pull-right">
<!-- 					<form method="POST" -->
<%-- 						action="${pageContext.request.contextPath}/ss/received/finalListSearch.do"> --%>

<!-- 						<div class="form-group col-sm-3"> -->
<!-- 							<label for="fromDate" class="col-xs-4 control-label">From -->
<!-- 								:</label> -->
<!-- 							<div class="col-xs-8"> -->
<!-- 								<input type="text" class="form-control datepicker-13" -->
<!-- 									readonly="readonly" id="fromDate" value='' -->
<!-- 									style="border: 0; border-bottom: 2px ridge;" name="fromDate" /> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-group col-sm-3"> -->
<!-- 							<label for="toDate" class="col-xs-4 control-label">To :</label> -->
<!-- 							<div class="col-xs-8"> -->
<!-- 								<input type="text" class="form-control datepicker-13" -->
<!-- 									id="toDate" style="border: 0; border-bottom: 2px ridge;" -->
<!-- 									readonly="readonly" name="toDate" /> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group col-xs-2"> -->
<!-- 							<select class="form-control senderStore" name="senderStore" -->
<!-- 								id="senderStore" style="border: 0; border-bottom: 2px ridge;"> -->
<!-- 								<option value="">All</option> -->
<!-- 								<option value="ls">SND</option> -->
<!-- 								<option value="cn">Contractor</option> -->
<!-- 								<option value="ws">Workshop</option> -->
<!-- 							</select> -->
<!-- 						</div> -->
<!-- 						<div class="form-group col-xs-3"> -->
<!-- 							<input type="text" class="form-control" id="search" -->
<!-- 								placeholder="Search by Return Slip No" -->
<!-- 								style="border: 0; border-bottom: 2px ridge;" name="returnSlipNo" /> -->
<!-- 						</div> -->
<!-- 						<div class="col-sm-1"> -->
<!-- 							<button type="submit" -->
<!-- 								class="btn btn-info glyphicon glyphicon-search"></button> -->
<!-- 						</div> -->
<!-- 					</form> -->
				</div>

				<table id="itemReturnListTable"
					class="table table-striped table-hover table-bordered">
					<thead>
						<tr
							style="background: #579EC8; color: white; font-weight: normal;">
							<td style="">Return Slip No</td>
							<td style="">Return Slip Date</td>
							<td style="">Received From</td>
							<td style="">Approved Performed</td>
							<td style="">Action</td>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${ssReturnSlipMstList}" var="ssReturnSlipMst"
							varStatus="loop">
							<tr>
								<td><a href="#" class="blue"
									onclick="postSubmit('${pageContext.request.contextPath}/ss/received/detailsInfo.do',{id:'${ssReturnSlipMst.id}'},'POST')">
										<c:out value="${ssReturnSlipMst.returnSlipNo}" />
								</a></td>
								<td><fmt:formatDate
										value="${ssReturnSlipMst.returnSlipDate}"
										pattern="dd-MM-yyyy" /></td>
								<td><c:out value="${ssReturnSlipMst.receiveFrom}" /></td>
								<td id="approved${loop.index}"><c:choose>
										<c:when test="${ssReturnSlipMst.approved}">
       										Yes
    									</c:when>

										<c:otherwise>
        									No
    									</c:otherwise>
									</c:choose></td>
								<td>
									<div class="action-buttons">
										<a href="javascript:void(0)" class="btn btn-primary btn-xs" style="border-radius: 6px;"
											onclick="postSubmit('${pageContext.request.contextPath}/ss/received/detailsInfo.do',{id:'${csReturnSlipMst.id}'},'POST')">
											<i class="fa fa-fw fa-eye"></i>&nbsp;Show
										</a>

									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- --------------------- -->
		</div>

	</div>
</div>

<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.dataTables.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/assets/js/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/dataTables.tableTools.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/dataTables.colVis.min.js"></script>

<script type="text/javascript">
	var $datepicker = $('#fromDate');
	var d = new Date();
	d.setMonth(d.getMonth() - 1, d.getDate());
	$datepicker.datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$datepicker.datepicker('setDate', d);

	var $datepicker1 = $('#toDate');
	$datepicker1.datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$datepicker1.datepicker('setDate', new Date());

	$(document)
			.ready(
					function() {
						$('#itemReturnListTable').DataTable();
						document.getElementById('itemReturnListTable_length').style.display = 'none';
						//document.getElementById('itemReturnListTable_filter').style.display = 'none';
					});
</script>

<script>
	$(window).load( function() {
		$('.loader').fadeOut('slow');
	});
</script>
<!-- -------------------------------------------------------------------------------------- -->
<%@include file="../common/ibcsFooter.jsp"%>
