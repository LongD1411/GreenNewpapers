<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Breadcrumb Start -->
<div class="container-fluid">
	<div class="container">
		<nav class="breadcrumb bg-transparent m-0 p-0">
			<a class="breadcrumb-item" href="<c:url value='/trang-chu'/>">Trang chủ</a> <a
				class="breadcrumb-item" href="<c:url value='/danh-muc'/>">Danh mục</a> 
		</nav>
	</div>
</div>
<!-- Breadcrumb End -->
<!-- Category News Slider Start -->
<div class="container-fluid py-3">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<c:forEach var="category" items="${categoryList }">
						<div class="col-12">
						<div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                           <h3 class="m-0">${category.name }</h3>
                           <a class="text-secondary font-weight-medium text-decoration-none" href="<c:url value='/danh-muc/${category.code }'/>">Xem tất cả</a>
                        </div>
					</div>
					<c:forEach var="news" items="${news}">
						<c:if test="${category.code eq news.categoryCode }">
						<div class="col-lg-6">
                            <div class="position-relative mb-3">
                                <img class="img-fluid w-100	" src="${news.thumbnail }" style="object-fit: cover; height:280px; width: 500px;]">
                                <div class="overlay position-relative bg-light">
                                    <div class="mb-2" style="font-size: 14px;">
                                        <a href="<c:url value="/danh-muc/${category.code }"/>">${category.name }</a>
                                        <span class="px-1">/</span>
                                        <span>${news.createdDate }</span>
                                    </div>
                                    <a class="h4" href="<c:url value='/${news.id }'/>">${news.title }</a>
                                    <p class="m-0"></p>
                                </div>
                            </div>
                        </div>
						</c:if>
					</c:forEach>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-4 pt-3 pt-lg-0">
			<!-- Popular News Start -->
                 <div class="pb-3">
                      <div class="bg-light py-2 px-4 mb-3">
                           <h3 class="m-0">Nóng</h3>
                       </div>
                       <c:forEach var="item" items="${trendNews }">
                       <div class="d-flex mb-3">
                           <img src="${item.thumbnail }" style="width: 100px; height: 100px; object-fit: cover;">
                            <div class="w-100 d-flex flex-column justify-content-center bg-light px-3" style="height: 100px;">
                                <div class="mb-1" style="font-size: 13px;">
                                    <a href=""><c:forEach var="category"
											items="${categoryModel.listResult }">
											<c:if test="${category.code eq item.categoryCode }">
												 		${category.name }
											</c:if>
										</c:forEach></a>
                                    <span class="px-1">/</span>
                                    <span class="dateDisplay">${item.createdDate }</span>
                                </div>
                                <a class="h6 m-0" href="<c:url value='/${item.id }'/>">${item.title }</a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <!-- Popular News End -->
              </div>
		</div>
	</div>
</div>
<!-- Category News Slider End -->
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