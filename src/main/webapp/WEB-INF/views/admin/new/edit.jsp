<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua" />
<c:url var="newCreateAPI" value="/api/create-new" />
<c:url var="newUpdateAPI" value="/api/update-new" />
<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>

					<li><a href="#">Forms</a></li>
					<li class="active">Form Elements</li>
				</ul>
				<!-- /.breadcrumb -->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message }">
								<div class="alert alert-${alert }">
									<strong>${message }</strong>
								</div>
							</c:if>

							<form:form class="form-horizontal" role="form" id="formSubmit"
								modelAttribute="model"  enctype="multipart/form-data" >
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="categoryCode"> Thể loại bài viết:</label>
									<div class="col-sm-9">
										<%-- <select class="form-control" id="categoryCode"
											name="categoryCode">
											<option>--- Chọn thể loại ---</option>
											<c:forEach var="item" items='${categories }'>
												<option value="${item.code }">${item.name}</option>
											</c:forEach>
										</select> --%>
										<form:select path="categoryCode" id="categoryCode" >
											<form:option value="" label="--- Chọn thể loại ---" />
											<form:options items='${categories}' />
										</form:select> 
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Tên bài viết </label>
									<div class="col-sm-9">
										<%-- <input type="text" id="title" name="title"
											class="col-xs-10 col-sm-5" value="${model.tittle }"> --%>
										<form:input path="title"   cssClass="col-xs-7"   />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">Ảnh đại diện </label>
									<div class="col-sm-5">
										<c:if test="${not empty model.thumbnail }">
										  <img src="<c:url value='/resources/img/${model.thumbnail}'  />" style="width: 80px; height: 80px; object-fit: cover;">
										</c:if>
										<input type="file" class="col-xs-10 col-sm-5" id="thumbnail"
											name="thumbnail">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="shortDescription">Mô tả ngắn:</label>
									<div class="col-sm-5">
										<%-- <textarea class="form-control" rows="5" cols="10"
											id="shortDescription" name="shortDescription">${model.shortDescription }</textarea> --%>
										<form:textarea path="shortDescription" rows="5" cols="10"
											cssClass="form-control" id="shortDescription"  />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="content">Nội dung:</label>
									<div class="col-sm-9">
									<%-- <textarea class="form-control" rows="5" cols="10" id="content"
											name="content">${model.content }</textarea>  --%>
									 <form:textarea path="content" rows="5" cols="10"
											cssClass="form-control" id="content"  name="content"  /> 
									</div>
								</div>
								<form:hidden path="id" id="newid" />
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<c:if test="${not empty model.id }">
											<button class="btn btn-info" type="button"
												id="btnAddOrUpdateNew">
												<i class="ace-icon fa fa-check bigger-110"></i>Cập nhật
												bài viết
											</button>
										</c:if>
										<c:if test="${empty model.id }">
											<button class="btn btn-info" type="button"
												id="btnAddOrUpdateNew">
												<i class="ace-icon fa fa-check bigger-110"></i>Thêm bài
												viết
											</button>
										</c:if>
										&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset">
											<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
										</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	var editor = '';
	$(document).ready(function(){
	     editor = CKEDITOR.replace('content');
	     CKFinder.setupCKEditor(editor, '/nongnghiep/resources/ckfinder/');
	});
		$('#btnAddOrUpdateNew').click	((e) =>{
			e.preventDefault();
		    var data = {};
		    var formDataArray = $('#formSubmit').serializeArray();
		    $.each(formDataArray, function (i, v) {
		        data["" + v.name + ""] = v.value;
		    });
		    const content = CKEDITOR.instances['content'].getData();
			data['content'] = content;
		    var formData = new FormData();
		    formData.append('thumbnail', $('#thumbnail')[0].files[0]);
		    formData.append('newDTO', new Blob([JSON.stringify(data)], { type: 'application/json' }));

		    var id = $('#newid').val();
		    
		    if (id == "") {
		        addNew(formData);
		    } else {
		        updateNew(formData);
		    }
		});
		function addNew(formData){
		    $.ajax({
		        url: '${newCreateAPI}',
		        type: 'POST',
		        processData: false, 
		        contentType: false, 
		        data: formData,
		        success: function (result) {
		            swal("Thêm thành công.");
		        },
		        error: function (error) {
		            swal("Lỗi.");
		        }
		    });
		}
	function updateNew(data){
		$.ajax({
            url: '${newUpdateAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
              	window.location.href = "${newURL}?page=1&limit=2&id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editNewURL}?message=error_system";
            }
        });
	}
</script>
</body>
</html>
