<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Breadcrumb Start -->
<div class="container-fluid">
	<div class="container">
		<nav class="breadcrumb bg-transparent m-0 p-0">
			<a class="breadcrumb-item" href="<c:url value='/trang-chu'/>">Trang
				chủ</a><a class="breadcrumb-item" href="<c:url value='/danh-muc'/>">Danh
				mục</a> <span class="breadcrumb-item active">${categoryModel.name}</span>
		</nav>
	</div>
</div>
<!-- Breadcrumb End -->
<!-- content start -->
<div class="container-fluid py-3">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<c:forEach var="item" items="${newModel.listResult }">
						<div class="col-lg-12">
							<div class="d-flex mb-3">
								<img src="${item.thumbnail }"
									style="width: 100px; height: 100px; object-fit: cover;">
								<div
									class="w-100 d-flex flex-column justify-content-center bg-light px-3"
									style="height: 100px;">
									<div class="mb-1" style="font-size: 13px;">
										<a href="">${item.categoryCode }</a> <span class="px-1">/</span>
										<span class="dateDisplay">${item.createdDate }</span>
									</div>
									<a class="h6 m-0" href="">${item.title }</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		// Lấy tất cả các phần tử có class 'dateDisplay'
		var dateElements = document.getElementsByClassName('dateDisplay');

		// Duyệt qua từng phần tử và định dạng ngày
		for (var i = 0; i < dateElements.length; i++) {
			var dateTimeStr = dateElements[i].innerText;
			var formattedDate = formatDate(dateTimeStr);
			dateElements[i].innerText = formattedDate;
		}
	});

	function formatDate(dateString) {
		// Tách phần ngày từ chuỗi ngày giờ
		var datePart = dateString.split(' ')[0];
		var dateParts = datePart.split('-');
		var year = dateParts[0];
		var month = dateParts[1];
		var day = dateParts[2];
		return day + '/' + month + '/' + year;
	}
</script>
<!-- content end -->