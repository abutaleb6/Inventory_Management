<%@include file="../common/lsHeader.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- -------------------End of Header-------------------------- -->


<!-- CSS -->
<style type="text/css">
.ui-widget-header, .ui-state-default, ui-button {
	background: #b9cd6d;
	border: 1px solid #b9cd6d;
	color: #FFFFFF;
	font-weight: bold;
}

.ui-dialog-titlebar-close {
	visibility: hidden;
}

.ui-widget-content {
	background: white url();
}

.btn-add {
	margin-bottom: 20px;
}
</style>
<!-- CSS -->


<div class="container-fluid icon-box" style="background-color: #858585;">
	<div class="row"
		style="background-color: white; padding: 10px; padding-left: 20px">

		<div class="o_form_buttons_edit" style="display: block;">
			<a href="${pageContext.request.contextPath}/c2ls/requisitionRejectList.do"
				style="text-decoration: none;" class="btn btn-primary btn-sm"> <span
				class="glyphicon glyphicon-th-list" aria-hidden="true"></span> Item
				Requisition List
			</a>
		</div>
		<h2 class="center blue" style="margin-top: 0px;">Store
			Requisition</h2>

		<h4 class="center blue"
			style="margin-top: 0; font-style: italic; font-family: 'Ubuntu Condensed', sans-serif;">${deptName}</h4>


	</div>

	<div class="row"
		style="background-color: white; padding: 10px; margin: 10px;">
		<!-- --------------------- -->
		<div class="oe_title">

			<table class="col-sm-12 table">
				<tr class="">
					<td class="success">Requisition No: <input type="hidden"
						value="${centralStoreRequisitionMst.requisitionNo}"
						id="requisitionNo" /> <input type="hidden"
						value="${returnStateCode}" id="returnStateCode" /> <input
						type="hidden" value="${centralStoreRequisitionMst.uuid}" id="uuid" />
						<input type="hidden" name="contextPath" id="contextPath"
						value="${pageContext.request.contextPath}" />
					</td>

					<td class="info">${centralStoreRequisitionMst.requisitionNo}</td>
					<td class="success">Created By:</td>
					<td class="info">${centralStoreRequisitionMst.createdBy}</td>
					<td class="success">Created Date:</td>
					<td class="info"><fmt:formatDate
							value="${centralStoreRequisitionMst.createdDate}"
							pattern="dd-MM-yyyy hh:mm:ss a" /></td>
				</tr>
				<tr class="">
					<td class="success">Contract No:</td>
					<td class="info">${centralStoreRequisitionMst.contractorRepresentive.contractNo}</td>
					<td class="success">Contract Date:</td>
					<td class="info"><fmt:formatDate
							value="${centralStoreRequisitionMst.contractorRepresentive.listedDate}"
							pattern="dd-MM-yyyy" /></td>
					<td class="success">Present Status:</td>
					<td class="info"><strong class="text-danger">Rejected</strong></td>
				</tr>

			</table>
		</div>


		<c:if test="${!empty itemRcvApproveHistoryList}">
			<button data-toggle="collapse" data-target="#demo">
				<span class="glyphicon glyphicon-collapse-down"></span>
			</button>
		</c:if>
		<div id="demo" class="collapse">
			<c:if test="${!empty itemRcvApproveHistoryList}">
				<!-- <div class="" style="font-weight: bold;">Approval History</div> -->

				<c:forEach items="${itemRcvApproveHistoryList}"
					var="itemRcvApproveHistory">
					<%-- <div class=""
						style="font-weight: bold; font-style: italic; text-transform: capitalize">${fn:toLowerCase(itemRcvApproveHistory.approvalHeader)}</div>
					<hr style="margin: 5px 0px 10px 0px" /> --%>
					<table class="col-sm-12 table">

						<tr class="">
							<td class="warning col-sm-3"
								style="font-weight: bold; font-size: 1.5em; font-style: italic; text-transform: capitalize">${fn:toLowerCase(itemRcvApproveHistory.approvalHeader)}</td>
							<td class="success col-sm-2" style="text-transform: capitalize">${fn:toLowerCase(itemRcvApproveHistory.stateName)}
								By:</td>
							<td class="success col-sm-2 text-left">
								${itemRcvApproveHistory.cEmpFullName} <c:if
									test="${!empty itemRcvApproveHistory.cDesignation}">
									, ${itemRcvApproveHistory.cDesignation} 
								</c:if> <c:if test="${!empty itemRcvApproveHistory.cEmpId}">
									( ${itemRcvApproveHistory.cEmpId} )
								</c:if>
							</td>
							<td class="info col-sm-2 text-left"
								style="text-transform: capitalize">${fn:toLowerCase(itemRcvApproveHistory.stateName)}
								Date:</td>
							<td class="info col-sm-3"><fmt:formatDate
									value="${itemRcvApproveHistory.createdDate}"
									pattern="dd-MM-yyyy hh:mm:ss a" /></td>
						</tr>
						<c:if test="${!empty itemRcvApproveHistory.justification}">
							<tr class="">
								<td></td>
								<td class="danger col-sm-1">Comment(s) :</td>
								<td class="danger col-sm-11" colspan="3"
									title="${itemRcvApproveHistory.justification}">${itemRcvApproveHistory.justification}</td>
							</tr>
						</c:if>
					</table>
				</c:forEach>
			</c:if>
			
			<c:if test="${!empty lsRequisitionApprovalHierarchyHistoryRejectList}">
				<!-- <div class="" style="font-weight: bold;">Approval History</div> -->

				<c:forEach items="${lsRequisitionApprovalHierarchyHistoryRejectList}"
					var="itemRcvApproveHistory">
					<%-- <div class=""
						style="font-weight: bold; font-style: italic; text-transform: capitalize">${fn:toLowerCase(itemRcvApproveHistory.approvalHeader)}</div>
					<hr style="margin: 5px 0px 10px 0px" /> --%>
					<table class="col-sm-12 table">

						<tr class="">
							<td class="warning col-sm-3"
								style="font-weight: bold; font-size: 1.5em; font-style: italic; text-transform: capitalize">Rejected History</td>
							<td class="success col-sm-2" style="text-transform: capitalize">Rejected By:</td>
							<td class="success col-sm-2 text-left">
								${itemRcvApproveHistory.cEmpFullName} <c:if
									test="${!empty itemRcvApproveHistory.cDesignation}">
									, ${itemRcvApproveHistory.cDesignation} 
								</c:if> <c:if test="${!empty itemRcvApproveHistory.cEmpId}">
									( ${itemRcvApproveHistory.cEmpId} )
								</c:if>
							</td>
							<td class="info col-sm-2 text-left"
								style="text-transform: capitalize">Reject
								Date:</td>
							<td class="info col-sm-3"><fmt:formatDate
									value="${itemRcvApproveHistory.createdDate}"
									pattern="dd-MM-yyyy hh:mm:ss a" /></td>
						</tr>
						<c:if test="${!empty itemRcvApproveHistory.justification}">
							<tr class="">
								<td></td>
								<td class="danger col-sm-1">Comment(s) :</td>
								<td class="danger col-sm-11" colspan="3"
									title="${itemRcvApproveHistory.justification}">${itemRcvApproveHistory.justification}</td>
							</tr>
						</c:if>
					</table>
				</c:forEach>
			</c:if>
		</div>


		<div style="background: white;">
			<c:if test="${empty centralStoreRequisitionDtlList}">
				<div class="col-sm-12 center">
					<p class="red">
						<i>Sorry!!! No Data Found in Database. </i>
					</p>
				</div>
			</c:if>
			<c:if test="${!empty centralStoreRequisitionDtlList}">
				<table id="requisitionListTable"
					class="table table-striped table-hover table-bordered">
					<thead>
						<tr
							style="background: #579EC8; color: white; font-weight: normal;">
							<td style="">Item Code</td>
							<td style="">Description</td>
							<td style="">Unit</td>
							<td style="">Current Qty (NS)</td>
							<td style="">Current Qty (RS)</td>
							<td style="">Required Qty</td>
							<td style="">Issued Qty (NS)</td>
							<td style="">Issued Qty (RS)</td>
							<td style="">Total Issued</td>
							<!-- <td style="">Unit Cost</td>
							<td style="">Total Cost</td> -->
							<td style="">Remarks</td>
							<!-- <td style="">Action</td> -->
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${centralStoreRequisitionDtlList}"
							var="centralStoreRequisitionDtl" varStatus="loop">
							<tr>

								<td><c:out value="${centralStoreRequisitionDtl.itemCode}" /></td>
								<td><c:out value="${centralStoreRequisitionDtl.itemName}" /></td>
								<td><c:out value="${centralStoreRequisitionDtl.uom}" /></td>
								<td id="presentStockNs${loop.index}"><fmt:formatNumber
										type="number" maxIntegerDigits="3"
										value="${centralStoreRequisitionDtl.presentStockNs}" /></td>
								<td id="presentStockRs${loop.index}"><fmt:formatNumber
										type="number" maxIntegerDigits="3"
										value="${centralStoreRequisitionDtl.presentStockRs}" /></td>

								<td><fmt:formatNumber type="number" maxIntegerDigits="3"
										value="${centralStoreRequisitionDtl.quantityRequired}" /></td>
								<%-- <td><c:out value="${centralStoreRequisitionDtl.quantityIssued}" /></td> --%>
								<td>${centralStoreRequisitionDtl.quantityIssuedNS}</td>

								<td>${centralStoreRequisitionDtl.quantityIssuedRS}</td>
								<%-- <td><c:out value="${centralStoreRequisitionDtl.unitCost}" /></td>
								<td><c:out value="${centralStoreRequisitionDtl.totalCost}" /></td> --%>
								<td id="totalIssuedQty${loop.index}"><fmt:formatNumber
										type="number" maxIntegerDigits="3"
										value="${centralStoreRequisitionDtl.quantityIssuedNS+centralStoreRequisitionDtl.quantityIssuedRS}" />

								</td>
								<td>${centralStoreRequisitionDtl.remarks}</td>
								<%-- <td>
									<div class="action-buttons">
										<a href="#" data-toggle="modal" data-target="#editModal"
											class="editModal"
											onclick="editItem(${centralStoreRequisitionDtl.id})"> <i
											class="ace-icon fa fa-pencil bigger-130"></i>
										</a>
										<!-- Trigger the modal with a button -->
										<button type="button" class="btn btn-success"
											aria-label="Left Align" data-toggle="modal"
											data-target="#myModal"
											onclick="setModalHeader(${centralStoreRequisitionDtl.itemCode}, ${loop.index})">
											<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
											Set
										</button>
										<a href="#" class="btn btn-primary"
											onclick="editItemLocation(${centralStoreRequisitionDtl.itemCode}, ${loop.index})">
											<i class="glyphicon glyphicon-edit" aria-hidden="true"> </i>
											Edit
										</a>
									</div>
								</td> --%>
							</tr>
							<c:set var="count" value="${loop.index}" scope="page" />
						</c:forEach>
					</tbody>
				</table>
			</c:if>

		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/resources/assets/js/contractor/c2LsRequisitionShowAddedLocation.js"></script>

<!-- ------------------------------------Start of Footer-------------------------------------------------- -->
<%@include file="../common/ibcsFooter.jsp"%>