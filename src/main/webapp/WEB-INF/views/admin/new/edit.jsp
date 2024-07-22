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
							<form:form class="form-horizontal" role="form" id="formSubmit"
								modelAttribute="model">
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
										<form:select path="categoryCode" id="categoryCode">
											<form:option value="" label="--- Chọn thể loại ---" />
											<form:options items='${categories}' />
										</form:select>
										<span id="categoryCodeMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden">Chưa nhập dữ liệu</span>
									</div>
								</div>
								<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
										for="categoryCode">Mẫu:</label>
								<div class="col-sm-9">
								<form:select path="type" id="type">
											<form:option value="nomal" label="Normal" />
											<form:option value="mid" label="Mid" />
											<form:option value="featured" label="Featured" />
											<form:option value="hot" label="Hot" />
										</form:select>
									<span id="typeMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden" >Chưa nhập dữ liệu</span>
								</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Tên bài viết </label>
									<div class="col-sm-9">
										<%-- <input type="text" id="title" name="title"
											class="col-xs-10 col-sm-5" value="${model.tittle }"> --%>
										<form:input path="title" id="title" cssClass="col-xs-7" />
										<span id="titleMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden">Chưa nhập dữ liệu</span>
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
											<span id="thumbnailMessage" style="color:red; font-style: italic;margin-left:5px"hidden="hidden" >Chưa nhập dữ liệu</span>
										</c:if>
										<c:if test="${not empty model.thumbnail}">
											<form:input type="hidden" path="thumbnail" id="thumbnail" />
											<img id="imageUrl" src="${model.thumbnail}" alt="Chưa có ảnh"
											style="width: 80px; height: 80px; object-fit: cover;" />
										<button type="button"
											onclick="selectFileWithCKFinder('imageUrl');">Select
											Image</button>
											<span id="thumbnailMessage" style="color:red; font-style: italic;margin-left:5px" hidden="hidden">Chưa nhập dữ liệu</span>
										</c:if>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="shortDescription">Mô tả ngắn:</label>
									<div class="col-sm-5">
										<%-- <textarea class="form-control" rows="5" cols="10"
											id="shortDescription" name="shortDescription">${model.shortDescription }</textarea> --%>
										<form:textarea path="shortDescription" rows="5" cols="10"
											cssClass="form-control" id="shortDescription" />
											<span id="shortDescriptionMessage" style="color:red; font-style: italic;margin-left:5px"hidden="hidden" >Chưa nhập dữ liệu</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="content">Nội dung:</label>
									<div class="col-sm-9">
										<%-- <textarea class="form-control" rows="5" cols="10" id="content"
											name="content">${model.content }</textarea>  --%>
										<form:textarea path="content" id="content" rows="5" cols="10"
											cssClass="form-control"  name="content" />
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
	     editor = CKEDITOR.replace('content',{width:700, height: 500});
	     CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/resources/ckfinder/');
	});
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
		    	if(v.name != 'id' && v.name != 'content' && v.value.trim() == ""){
		    		isValid = false;
		    		const messageElm = document.getElementById(v.name+"Message");
		    		if(messageElm){
		    			messageElm.removeAttribute("hidden");
		    		}
		    	}
		    	if(v.name != 'id' && v.value.trim() != ""){
		    		const messageElm = document.getElementById(v.name+"Message");
		    		if(messageElm){
		    			messageElm.setAttribute("hidden","hidden");
		    		}
		    	}
		        data["" + v.name + ""] = v.value;
		    });
		    const content = CKEDITOR.instances['content'].getData();
			data['content'] = content;
		    var id = $('#newid').val();
		    if(isValid){
		    if (id == "") {
		        addNew(data);
		    } else {
		        updateNew(data);
		    }
		  }
		});
		function addNew(data){
		    $.ajax({
		        url: '${newCreateAPI}',
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
	function updateNew(data){
		$.ajax({
            url: '${newUpdateAPI}',
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
</body>
</html>
