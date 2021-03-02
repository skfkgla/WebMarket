<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.oreilly.servlet.*"%>
	<%@ page import="com.oreilly.servlet.multipart.*" %>
	<%@ page import="java.util.*" %>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<meta charset="UTF-8">

<%
request.setCharacterEncoding("UTF-8");

String filename="";
String realFolder="C:\\upload";
int maxSize = 5*1024*1024;
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String productId = multi.getParameter("productId");		//상품 아이디
String name = multi.getParameter("name");					//상품명
String unitPrice = multi.getParameter("unitPrice");		//상품가격
String description = multi.getParameter("description");	//상품 설명
String manufacturer = multi.getParameter("manufacturer");	//제조사
String category = multi.getParameter("category");			//분류
String unitsInStock = multi.getParameter("unitsInStock");	//재고 수
String condition = multi.getParameter("condition");		//신상품 or 중고품 or 재생품

Integer price;

if (unitPrice.isEmpty())		
	price = 0;
else
	price = Integer.valueOf(unitPrice);

long stock;

if (unitsInStock.isEmpty())
	stock = 0;
else
	stock = Long.valueOf(unitsInStock);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

ProductRepository dao = ProductRepository.getInstance();

Product newProduct = new Product();
newProduct.setProductId(productId);
newProduct.setPname(name);
newProduct.setUnitPrice(price);
newProduct.setDescription(description);
newProduct.setManufacturer(manufacturer);
newProduct.setCategory(category);
newProduct.setUnitsInStock(stock);
newProduct.setCondition(condition);
newProduct.setFilename(fileName);

dao.addProduct(newProduct);
response.sendRedirect("products.jsp");
%>