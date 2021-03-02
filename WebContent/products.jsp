<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta>
<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div align="center" class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
	ProductRepository dao = ProductRepository.getInstance();
	ArrayList<Product> listOfProducts = dao.getAllProducts(); //ProductRepository에 있는 listOfProducts를
																	 //jsp파일에서 사용할 수 있게 똑같이 선언해줌
	%>
	<div class="container">
		<div class="row" align="center">
			<%
			for (int i = 0; i < listOfProducts.size(); i++) {		//배열에 저장되어 있는 크기만큼 for문
				Product product = listOfProducts.get(i);			//배열 순서대로 값을 product에 저장
			%>
			<div class="col-md-4">
				<img src="C:/upload/<%=product.getFilename()%>" style="width:100%">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
				<p><a href="./product.jsp?id=<%=product.getProductId() %>"
				class="btn btn-primary" role="button"> 상세 정보 &raquo;</a>
			</div>
			<%
			}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>