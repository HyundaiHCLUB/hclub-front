<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
	<head>
	<style>

		main {
			margin: 0;
			padding-top: 120px;
			padding-bottom: 100px;
			font-family: 'Inter';
			overflow-y: scroll;
		}

		.scroll-container {
			padding-top: 120px;
			padding-bottom: 100px;
			overflow-y: auto;
			height: 100vh;
		}

		header {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			z-index: 100;
			height: 60px;
		}

		footer {
			position: fixed;
			bottom: 0;
			left: 0;
			height: 100px;
			width: 100%;
		}

		@media (max-width: 768px) {
			header, footer {
				position: static;
				width: 100%;
			}

			footer {
				position: relative;
				margin-top: auto;
			}
		}
	</style>

<%--		<link rel="stylesheet" href="/resources/css/main.css">--%>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>메인 페이지</title>
	</head>
	<body>
<%--	<header>--%>
<%--		<jsp:include page="../header.jsp"></jsp:include>--%>
<%--	</header>--%>
	<main>
		<a href="today.jsp">투데이로 이동하기!!</a>
	</main>
<%--	<footer>--%>
<%--		<jsp:include page="../footer.jsp"></jsp:include>--%>
<%--	</footer>--%>

	</body>
</html>