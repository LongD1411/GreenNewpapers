<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="categoryCreateAPI" value="/api/create-category" />
<c:url var="categoryUpdateAPI" value="/api/update-category" /> 
<html>
<head>
<title>Chỉnh sửa danh mục</title>
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
							<form:form class="form-horizontal" role="form" id="formSubmit"
								modelAttribute="model">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="categoryCode">Tên danh mục:</label>
									<div class="col-sm-9">
										<form:input path="name" id="name" cssClass="col-xs-7" />
										<span id="nameMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden">Chưa nhập dữ liệu</span>
									</div>
									
								</div>
								<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
										for="categoryCode">Mẫu:</label>
								<div class="col-sm-9">
								<form:select path="type" id="type">
											<form:option value="nomal" label="Normal" />
											<form:option value="hot" label="Hot" />
								</form:select>
								<span id="typeMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden">Chưa nhập dữ liệu</span>
								</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Mã danh mục </label>
									<div class="col-sm-9">
										<%-- <input type="text" id="title" name="title"
											class="col-xs-10 col-sm-5" value="${model.tittle }"> --%>
										<form:input path="code" cssClass="col-xs-7" id="code" />
										<span id="codeMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden">Chưa nhập dữ liệu</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">Ảnh đại diện </label>
									<div class="col-sm-5">
										<c:if test="${empty model.thumbnail}">
											<form:input type="hidden" path="thumbnail" id="thumbnail" />
											<img id="imageUrl" src="" alt="Chưa có ảnh"
											style="width: 80px; height: 80px; object-fit: cover;" />
										<button type="button"
											onclick="selectFileWithCKFinder('imageUrl');">Select
											Image</button>
											<span id="thumbnailMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden">Chưa nhập dữ liệu</span>
											<div><span  style="color:red; font-style: italic;margin-left:5px">Lưu ý: Chọn ảnh có tỷ lệ 500 x 80</span></div>
										</c:if>
										<c:if test="${not empty model.thumbnail}">
											<form:input type="hidden" path="thumbnail" id="thumbnail" />
											<img id="imageUrl" src="${model.thumbnail}" alt="Chưa có ảnh"
											style="width: 80px; height: 80px; object-fit: cover;" />
										<button type="button"
											onclick="selectFileWithCKFinder('imageUrl');">Select
											Image</button>
											<div><span  style="color:red; font-style: italic;margin-left:5px">Lưu ý: Chọn ảnh có tỷ lệ 500 x 80</span></div>
										</c:if>
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
	function selectFileWithCKFinder(elementId) {
        CKFinder.popup({
            basePath: '<c:url value="/resources/ckfinder/" />',
            selectActionFunction: function(fileUrl) {
            	document.getElementById("thumbnail").value= fileUrl;
            	document.getElementById(elementId).src = fileUrl;
            }
        });
    }
		$('#btnAddOrUpdateNew').click((e) =>{
			e.preventDefault();
			var isValid = true;
		    var data = {};
		    var formDataArray = $('#formSubmit').serializeArray();
		    $.each(formDataArray, function (i, v) {
		    	if(v.name != 'id' && v.value.trim() == ""){
		    		isValid = false;
		    		c++;
		    		const messageElm = document.getElementById(v.name+"Message");
		    		if(messageElm){
		    			messageElm.removeAttribute("hidden");
		    		}
		    	}
		        data["" + v.name + ""] = v.value.trim();
		    });
		    var id = $('#newid').val();
		    if(isValid){
		    if (id == "") {
		        addCategory(data);
		    } else {
		        updateCategory(data);
		    }
		  }
		});
		function addCategory(data){
		    $.ajax({
		        url: '${categoryCreateAPI}',
		        type: 'POST',
		        contentType:'application/json',
		        data: JSON.stringify(data),
		        dataType: 'json',
		        success: function (result) {
		            swal("Thêm thành công.").then((value) =>{
		            	window.location.reload();
		            })
		        },
		        error: function (error) {
		            swal("Lỗi.");
		        }
		    });
		}
	function updateCategory(data){
		$.ajax({
            url: '${categoryUpdateAPI}',
	        type: 'PUT',
	        contentType:'application/json',
	        data: JSON.stringify(data),
	        dataType: 'json',
	        success: function (result) {
	            swal("Cập nhật thành công").then((value) =>{
	            	window.location.reload();
	            })
	        },
	        error: function (error) {
	            swal("Lỗi.");
	        }
	    });
	}
</script>
