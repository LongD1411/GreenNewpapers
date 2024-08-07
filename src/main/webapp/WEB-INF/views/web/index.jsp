<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Menu top slide -->
<div class="container-fluid py-3">
	<div class="container">
		<div
			class="owl-carousel owl-carousel-2 carousel-item-3 position-relative">
			<c:forEach var="item" items="${headNewList}">
				<div class="d-flex">
					<img src="${item.thumbnail }"
						style="width: 80px; height: 80px; object-fit: cover;">
					<div class="d-flex align-items-center bg-light px-3"
						style="height: 80px;">
						<a class="text-secondary font-weight-semi-bold"
							href="<c:url value='/${item.id }'/>">${item.title}</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- Menu top slide end -->

<!-- Main News Slider Start -->
<div class="container-fluid py-3">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div
					class="owl-carousel owl-carousel-2 carousel-item-1 position-relative mb-3 mb-lg-0">
					<c:forEach var="item" items="${midNewList }">
						<div class="position-relative overflow-hidden"
							style="height: 435px;">
							<img class="img-fluid h-100" src="${item.thumbnail}"
								style="object-fit: cover;">
							<div class="overlay">
								<div class="mb-1">
									<a class="text-white"
										href="<c:url value='/danh-muc/${item.categoryCode }'/>"><c:forEach
											var="category" items="${categoryModel.listResult }">
											<c:if test="${category.code eq item.categoryCode }">
												 		${category.name }
											</c:if>
										</c:forEach></a> <span class="px-2 text-white">/</span> <a class="text-white"
										href=""><span class="dateDisplay">${item.createdDate }</span></a>
								</div>
								<a class="h2 m-0 text-white font-weight-bold"
									href="<c:url value="/${item.id }"/>">${item.title }</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-4">
				<div
					class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
					<h3 class="m-0">Danh Mục</h3>
					<a class="text-secondary font-weight-medium text-decoration-none"
						href="<c:url value='/danh-muc'/>">Xem tất cả</a>
				</div>
				<c:forEach var="item" items="${categoryList }">
					<div class="position-relative overflow-hidden mb-3"
						style="height: 80px;">
						<img class="img-fluid w-100 h-100" src="${item.thumbnail }"
							style="object-fit: cover;"> <a
							href="<c:url value='danh-muc/${item.code}'/>"
							class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">${item.name }</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- Main News Slider End -->
<!-- Featured News Slider Start -->
<div class="container-fluid py-3">
	<div class="container">
		<div
			class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
			<h3 class="m-0">Featured</h3>
			<a class="text-secondary font-weight-medium text-decoration-none"
				href="">View All</a>
		</div>
		<div
			class="owl-carousel owl-carousel-2 carousel-item-4 position-relative">
			<c:forEach var="item" items="${featuredNews }">
				<div class="position-relative overflow-hidden"
					style="height: 300px;">
					<img class="img-fluid w-100 h-100" src="${item.thumbnail }"
						style="object-fit: cover;">
					<div class="overlay">
						<div class="mb-1" style="font-size: 13px;">
							<a class="text-white"
								href="<c:url value='/danh-muc/${item.categoryCode }'/>"><c:forEach
									var="category" items="${categoryModel.listResult }">
									<c:if test="${category.code eq item.categoryCode }">
													 		${category.name }
												</c:if>
								</c:forEach></a> <span class="px-1 text-white">/</span> <a class="text-white"
								href=""><span class="dateDisplay">${item.createdDate }</span></a>
						</div>
						<a class="h4 m-0 text-white" href="<c:url value='/${item.id }'/>"><span
							class="title" id="title-${item.id}">${item.title }</span></a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		document.querySelectorAll('.title').forEach(function(titleElement) {
			var titleText = titleElement.innerText;
			if (titleText.length > 27) {
				titleElement.innerText = titleText.substring(0, 27) + '...';
			}
		});
	});
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
<!-- Featured News Slider End -->
