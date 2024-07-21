<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<c:url var="deleteAPI"  value="/api/delete-new" />
	<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách bài viết</title>
</head>

<body>
	<div class="main-content">
		<form action="<c:url value="/quan-tri/bai-viet/danh-sach" />"
			id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<c:url var="createNewURL"
												value="/quan-tri/bai-viet/chinh-sua" />
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm bài viết'
												href='${createNewURL}'> <span> <i
													class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												onclick="warningBeforeDelete()"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa bài viết'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll"></th>
													<th>Ảnh đại diện </th>
													<th>Tên bài viết</th>
													<th>Thể loại</th>
													<th>Mẫu</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id="checkbox_${item.id}"
															value="${item.id}"></td>
															<td> <img src="${item.thumbnail}" alt="Không có ảnh" style="width: 50px; height: 50px; object-fit: cover;"></td>
														<td>${item.title}</td>
														<td>${item.categoryCode}</td>
														<td>${item.type}</td>
														<td><c:url var="updateNewURL"
																value="/quan-tri/bai-viet/chinh-sua">
																<c:param name="id" value="${item.id}" />
															</c:url> <a class="btn btn-sm btn-primary btn-edit"
															data-toggle="tooltip" title="Cập nhật bài viết"
															href='${updateNewURL }'><i
																class="fa fa-pencil-square-o" aria-hidden="true"></i> </a>
																 <input type='button' class="btn btn-danger btn-sm"   value="Xóa"    type="student"  onclick="warningBeforeDelete2(${item.id})"> </a>
															</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- /.main-content -->
	<script>
	var totalPages = ${model.totalPage};
	var currentPage = ${model.page};
	$(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
            	if (currentPage != page) {
					$('#page').val(page);
					$('#formSubmit').submit();
				}
            }
        });
    });
	function warningBeforeDelete() {
		swal({
			  title: "Xóa?",
			  text: "Sau khi xóa dữ liệu sẽ không thể khôi phục!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
						var data = {};
						var ids = $('tbody input[type=checkbox]:checked').map( function () {
				            return $(this).val();
				            }).get();
						data['ids'] = ids;
						 deleteNew(ids); 
			    }
			  })
	}
	function warningBeforeDelete2(id) {
		swal({
			  title: "Xóa?",
			  text: "Sau khi xóa dữ liệu sẽ không thể khôi phục!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
						var data = [id];
						 deleteNew(data); 
			    }
			  })
	}
	
	 function deleteNew(data) {
		        $.ajax({
		            url: '${deleteAPI}',
		            type: 'DELETE',
		            contentType: 'application/json',
		            data: JSON.stringify(data),
		            success: function (result) {
		            	swal("Đã xóa thành công.").then(() => {
		            		window.location.href= "<%=request.getContextPath()%>/quan-tri/bai-viet/danh-sach";
		            	});
		            },
		            error: function (error) {
		            	  swal("Lỗi !"); 
		            }
		        });
		    }
	</script>
</body>
</html>