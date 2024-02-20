<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
	<head>
		<link rel="stylesheet" href="/resources/css/main.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>메인 페이지</title>
		<script>
			var headerHeight = document.querySelector('header').offsetHeight;
			var footerHeight = document.querySelector('footer').offsetHeight;

			window.addEventListener('scroll', function() {
				var scrollY = window.scrollY || document.documentElement.scrollTop;

				if (scrollY > headerHeight) {
					document.body.style.paddingTop = headerHeight + 'px';
					document.querySelector('header').classList.add('fixed');
				} else {
					document.body.style.paddingTop = 0;
					document.querySelector('header').classList.remove('fixed');
				}

				var scrollBottom = window.innerHeight + scrollY;
				var documentHeight = document.documentElement.offsetHeight;

				if (documentHeight - scrollBottom < footerHeight) {
					document.body.style.paddingBottom = footerHeight + 'px';
					document.querySelector('footer').classList.add('fixed-bottom');
				} else {
					document.body.style.paddingBottom = 0;
					document.querySelector('footer').classList.remove('fixed-bottom');
				}
			});
		</script>
	</head>

	<body>
	<main>
		<div class="navbar_menu">
				<li><a href="home/home.jsp"> 투데이</a></li>
        		<li><a href="">인기 동아리</a></li>
    			<li><a href="">신규 동아리</a></li>
    			<li><a href="">오늘의 랭킹</a></li>
    			<li><a href="">내 모임</a></li>
		</div>

		<div class="slidebox">
			<input type="radio" name="slide" id="slide01" checked>
			<input type="radio" name="slide" id="slide02">
			<input type="radio" name="slide" id="slide03">
			<input type="radio" name="slide" id="slide04">
			<ul class="slidelist">
				<li class="slideitem">
					<div>
						<label for="slide04" class="left"></label>
						<label for="slide02" class="right"></label>
						<a><img src="/resources/image/banner1.png"></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide01" class="left"></label>
						<label for="slide03" class="right"></label>
						<a><img src="/resources/image/banner2.png"></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide02" class="left"></label>
						<label for="slide04" class="right"></label>
						<a><img src="/resources/image/banner3.png"></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide03" class="left"></label>
						<label for="slide01" class="right"></label>
						<a><img src="/resources/image/banner4.png"></a>
					</div>
				</li>
			</ul>
		</div>

		<div class="category">
			<div class="category-item">
				<a href="today.jsp"><img src="/resources/image/category_cooking.png"></a>
			</div>
			<div class="category-item">
				<img src="/resources/image/category_activity.png">
			</div>
			<div class="category-item">
				<img src="/resources/image/category_game.png">
			</div>
			<div class="category-item">
				<img src="/resources/image/category_culture.png">
			</div>
		</div>
		<div class="category">
			<div class="category-item">
				<img src="/resources/image/category_foreign.png">
			</div>
			<div class="category-item">
				<img src="/resources/image/category_travel.png">
			</div>
			<div class="category-item">
				<img src="/resources/image/category_self.png">
			</div>
			<div class="category-item">
				<img src="/resources/image/category_money.png">
			</div>
		</div>

		<div class="title">
			<div class="title-item">
				<p class="sub-title">혜연님을 위한 추천 동아리</p>
			</div>
			<div class="title-item">
				<p class="more">더보기</p>
			</div>
		</div>

		<div class="grid-container">
			<div class="grid-item">
				<img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
				<div class="circle_content">
					<p class="circle_name">난쏘공</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">추천</a>
				</div>
			</div>
			<div class="grid-item">
				<img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
				<div class="circle_content">
					<p class="circle_name">난쏘공</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">추천</a>
				</div>
			</div>
		</div>
		<div class="grid-container">
			<div class="grid-item">
				<img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
				<div class="circle_content">
					<p class="circle_name">난쏘공</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">추천</a>
				</div>
			</div>
			<div class="grid-item">
				<img class="circle_recommend" src="/resources/image/sample.png" alt="Example Image">
				<div class="circle_content">
					<p class="circle_name">난쏘공</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">추천</a>
				</div>
			</div>
		</div>

		<div class="title">
			<div class="title-item">
				<p class="sub-title">취향저격! 인기 동아리</p>
			</div>
			<div class="title-item">
				<p class="more">더보기</p>
			</div>
		</div>

		<div class="grid-container">
			<div class="grid-hot-item">
				<img class="circle_recommend" src="/resources/image/sample2.png" alt="Example Image">
			</div>
			<div class="grid-hot-item">
				<div class="circle_hot_content">
					<p class="circle_name">볼링즈</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">인기</a>
				</div>
				<p class="circle_hot_loc">서울특별시 서초구</p>
				<i class="fa-solid fa-users fa-1x" style="margin-top: 8px">10</i>
			</div>
		</div>
		<div class="grid-container">
			<div class="grid-hot-item">
				<img class="circle_recommend" src="/resources/image/sample2.png" alt="Example Image">
			</div>
			<div class="grid-hot-item">
				<div class="circle_hot_content">
					<p class="circle_name">볼링즈</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">인기</a>
				</div>
				<p class="circle_hot_loc">서울특별시 서초구</p>
				<i class="fa-solid fa-users fa-1x" style="margin-top: 8px">10</i>
			</div>
		</div>
		<div class="grid-container">
			<div class="grid-hot-item">
				<img class="circle_recommend" src="/resources/image/sample2.png" alt="Example Image">
			</div>
			<div class="grid-hot-item">
				<div class="circle_hot_content">
					<p class="circle_name">볼링즈</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">인기</a>
				</div>
				<p class="circle_hot_loc">서울특별시 서초구</p>
				<i class="fa-solid fa-users fa-1x" style="margin-top: 8px">10</i>
			</div>
		</div>
		<div class="grid-container">
			<div class="grid-hot-item">
				<img class="circle_recommend" src="/resources/image/sample2.png" alt="Example Image">
			</div>
			<div class="grid-hot-item">
				<div class="circle_hot_content">
					<p class="circle_name">볼링즈</p>
					<a href="#" class="category_button">액티비티</a>
					<a href="#" class="content_button">인기</a>
				</div>
				<p class="circle_hot_loc">서울특별시 서초구</p>
				<i class="fa-solid fa-users fa-1x" style="margin-top: 8px">10</i>
			</div>
		</div>
	</main>
	</body>
</html>