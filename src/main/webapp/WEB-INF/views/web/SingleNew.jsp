<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Breadcrumb Start -->
<div class="container-fluid">
	<div class="container">
		<nav class="breadcrumb bg-transparent m-0 p-0">
			<a class="breadcrumb-item" href="<c:url value='/trang-chu'/>">Trang
				chủ</a> <a class="breadcrumb-item" href="<c:url value='/danh-muc'/>">Danh
				mục</a> <a class="breadcrumb-item"
				href="<c:url value='/danh-muc/${model.categoryCode }'/>"><c:forEach
					var="item" items="${categoryModel.listResult }">
					<c:if test="${item.code eq model.categoryCode }">
												 		${item.name }
												 		 <c:set var="categoryName" value="${item.name }" />
					</c:if>
				</c:forEach></a> <span class="breadcrumb-item active">${model.title }</span>
		</nav>
	</div>
</div>
<!-- Breadcrumb End -->
<div class="container-fluid py-3">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<!-- News Detail Start -->
				<div class="position-relative mb-3">
					<img class="img-fluid w-100" src="${model.thumbnail }"
						style="object-fit: cover;">
					<div class="overlay position-relative bg-light">
						<div class="mb-3">
							<a href="<c:url value="/danh-muc/${model.categoryCode }"/>">${categoryName }</a>
							<span class="px-1">/</span> <span class="dateDisplay">
								${model.createdDate }</span>
						</div>
						<div>
							<h3 class="mb-3">${model.title }</h3>
							<h5 class="mb-3">${model.shortDescription }</h5>
							${model.content }
						</div>
					</div>
				</div>
				<!-- News Detail End -->
				<!-- 				Comment List Start
				<div class="bg-light mb-3" style="padding: 30px;">
					<h3 class="mb-4">3 Comments</h3>
					<div class="media mb-4">
						<img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
							style="width: 45px;">
						<div class="media-body">
							<h6>
								<a href="">John Doe</a> <small><i>01 Jan 2045</i></small>
							</h6>
							<p>Diam amet duo labore stet elitr invidunt ea clita ipsum
								voluptua, tempor labore accusam ipsum et no at. Kasd diam tempor
								rebum magna dolores sed sed eirmod ipsum. Gubergren clita
								aliquyam consetetur sadipscing, at tempor amet ipsum diam tempor
								consetetur at sit.</p>
							<button class="btn btn-sm btn-outline-secondary">Reply</button>
						</div>
					</div>
					<div class="media">
						<img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
							style="width: 45px;">
						<div class="media-body">
							<h6>
								<a href="">John Doe</a> <small><i>01 Jan 2045 at
										12:00pm</i></small>
							</h6>
							<p>Diam amet duo labore stet elitr invidunt ea clita ipsum
								voluptua, tempor labore accusam ipsum et no at. Kasd diam tempor
								rebum magna dolores sed sed eirmod ipsum. Gubergren clita
								aliquyam consetetur sadipscing, at tempor amet ipsum diam tempor
								consetetur at sit.</p>
							<button class="btn btn-sm btn-outline-secondary">Reply</button>
							<div class="media mt-4">
								<img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
									style="width: 45px;">
								<div class="media-body">
									<h6>
										<a href="">John Doe</a> <small><i>01 Jan 2045 at
												12:00pm</i></small>
									</h6>
									<p>Diam amet duo labore stet elitr invidunt ea clita ipsum
										voluptua, tempor labore accusam ipsum et no at. Kasd diam
										tempor rebum magna dolores sed sed eirmod ipsum. Gubergren
										clita aliquyam consetetur sadipscing, at tempor amet ipsum
										diam tempor consetetur at sit.</p>
									<button class="btn btn-sm btn-outline-secondary">Reply</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				Comment List End
				Comment Form Start
				<div class="bg-light mb-3" style="padding: 30px;">
					<h3 class="mb-4">Leave a comment</h3>
					<form>
						<div class="form-group">
							<label for="name">Name *</label> <input type="text"
								class="form-control" id="name">
						</div>
						<div class="form-group">
							<label for="email">Email *</label> <input type="email"
								class="form-control" id="email">
						</div>
						<div class="form-group">
							<label for="website">Website</label> <input type="url"
								class="form-control" id="website">
						</div>

						<div class="form-group">
							<label for="message">Message *</label>
							<textarea id="message" cols="30" rows="5" class="form-control"></textarea>
						</div>
						<div class="form-group mb-0">
							<input type="submit" value="Leave a comment"
								class="btn btn-primary font-weight-semi-bold py-2 px-3">
						</div>
					</form>
				</div>
				Comment Form End  -->
			</div>
			<div class="col-lg-4 pt-3 pt-lg-0">
				<!-- Popular News Start -->
				<div class="pb-3">
					<div class="bg-light py-2 px-4 mb-3">
						<h3 class="m-0">Tranding</h3>
					</div>
					<c:forEach var="item" items="${model.listResult }">
						<div class="d-flex mb-3">
							<img src="${item.thumbnail }"
								style="width: 100px; height: 100px; object-fit: cover;">
							<div
								class="w-100 d-flex flex-column justify-content-center bg-light px-3"
								style="height: 100px;">
								<div class="mb-1" style="font-size: 13px;">
									<a href="<c:url value='/danh-muc/${model.categoryCode }'/>"><c:forEach var="category"
											items="${categoryModel.listResult }">
											<c:if test="${category.code eq item.categoryCode }">
												 		${category.name }
											</c:if>
										</c:forEach></a> <span class="px-1">/</span> <span class="dateDisplay">${item.createdDate }</span>
								</div>
								<a class="h6 m-0" href="<c:url value='/${item.id}'/>">${item.title }</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- Popular News End -->
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