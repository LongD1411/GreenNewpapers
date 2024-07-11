<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>NEWSROOM - Free Bootstrap Magazine Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="<c:url value='/template/web/img/favicon.ico' />" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">   

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"  rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value='/template/web/lib/owlcarousel/assets/owl.carousel.min.css'/>" rel="stylesheet" type="text/css">
    
    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value='/template/web/css/style.css'/>" rel="stylesheet" type="text/css">
</head>
<body>

	<%@ include file="/common/web/header.jsp"%>
	<dec:body />
	<%@ include file="/common/web/footer.jsp"%>

	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value='/template/web/lib/easing/easing.min.js '/>"></script>
    <script src="<c:url value='/template/web/lib/owlcarousel/owl.carousel.min.js' />"></script>

    <!-- Contact Javascript File -->
    <script src="<c:url value='/template/web/mail/jqBootstrapValidation.min.js' />"></script>
    <script src="<c:url value='/template/web/mail/contact.js' />"></script>

    <!-- Template Javascript -->
   <script src="<c:url value='/template/web/js/main.js' />"></script>
</body>
</html>