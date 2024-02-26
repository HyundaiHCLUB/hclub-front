<%--
  Created by IntelliJ IDEA.
  User: podo
  Date: 2/21/24
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/compCreateTeam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>CreateTeam</title>
</head>
<body>
<main>
    <div class="select-game-type-container">
        <div class="rounded-shape-gametype">
            <div class="round-shape">
                <img src="/resources/image/comp/soccer.png"/>

            </div>
        </div>
        <div class="rounded-shape-gametype">
            <div class="round-shape">
                <img src="/resources/image/comp/basketball.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype">
            <div class="round-shape">
                <img src="/resources/image/comp/bowling.png"/>
            </div>
        </div>
        <div class="rounded-shape-gametype">
            <div class="round-shape">
                <img src="/resources/image/comp/dart.png"/>
            </div>
        </div>
    </div>

    <div class="plus-button"></div>
    <div class="team-name-container">

        <input type="text" class="search-input" placeholder="팀 이름">
        <img src="/resources/image/comp/pencil.png" alt="팀 이름"
             class="search-icon">
    </div>


</main>
</body>
</html>
