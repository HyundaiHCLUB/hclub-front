<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>H-Club</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/teamDetail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<body>
<main>
    <div class="detail-top-menu-container">
        <div class="detail-top-menu">
            <img src="/resources/image/left-arrow.png"
                 onclick="window.history.back()"/>
            <span>ss</span>
            <img src="https://h-clubbucket.s3.ap-northeast-2.amazonaws.com/profile/KakaoTalk_20240225_125308814.jpg"
                 alt="">
        </div>
    </div>

</main>
<script>
    let num =
        ${teamNo}
        console.log(num);
</script>
</body>
</html>
