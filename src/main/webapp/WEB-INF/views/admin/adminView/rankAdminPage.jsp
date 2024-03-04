<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Elegant Dashboard | Dashboard</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/logo.svg" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">
</head>
<script src="${pageContext.request.contextPath}/resources/plugins/chart.min.js"></script>
<!-- Icons library -->
<script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>
<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
<style>
	#pagination {
	    display: flex;
	    justify-content: center;
	    margin: 20px 0px 20px 0px;
	}
   
	#pagination a {
	    color: #333;
	    text-decoration: none;
	    padding: 8px 12px;
	    margin: 0 5px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    transition: background-color 0.3s, color 0.3s;
	}
	
	#pagination a.active,
	#pagination a:hover {
	    background-color: #007bff;
	    color: #fff;
	    border-color: #007bff;
	}
	td, th{
		padding: 10px;
		text-align: center;
	}
</style>
<body>
<div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
<div class="page-flex">
  <!-- ! Sidebar -->
<%@ include file="../adminView/adminSideBar.jsp" %>

  <!-- MainContents -->
 <div class="main-wrapper">
   <!-- ! Main nav -->
   <nav class="main-nav--bg">
   <div class="container main-nav">
	   <div class="main-nav-start">
	   <div class="search-wrapper" style="margin-left:50px; display:inline-block;">
	       <i data-feather="search" aria-hidden="true"></i>
	        <input type="text" placeholder="사원 이름으로 검색하세요" id="search" required>
	    </div>
	    <div style="display:inline-block; cursor:pointer;"><input type="button" value="검색" style="font-weight:bold; cursor:pointer; color:#46675c;" onclick="getRankSetUp()"></div>
	   </div>  
	</div>
   </nav>
   <div class="container">
    <div class="row">
    	<div class="col-lg-9" style="margin: 0px 0px 0px 50px">  
          <div class="users-table table-wrapper" style="width: fit-content">
              <table class="posts-table">
                <thead>
                  <tr class="users-table-info">
                  	<!-- <th>
                      <label class="users-table__checkbox ms-20">
                        <input type="checkbox" class="check-all">
                      </label>
                    </th> -->
                    <th>사원번호</th>
                    <th>사원 사진</th>
                    <th>아이디</th>
                    <th>사원 이름</th>
                    <th>레이팅 점수</th>
                    <th>경기 횟수</th>
                  </tr>
                </thead>
                <tbody id="dataTbody">
                  <%-- <tr>
                  	 <td>
                      <label class="users-table__checkbox">
                        <input type="checkbox" class="check">
                      </label>
                    </td>
                    <td>
                    	1
                    </td>
                    <td>
                      라이즈 동아리
                    </td>
                    <td>
						<div class="categories-table-img">
                          <picture><source srcset="${pageContext.request.contextPath}/resources/img/categories/03.webp" type="image/webp"><img src="./img/categories/03.jpg" alt="category"></picture>
                        </div>
                    </td>
                    <td><span class="badge-active">상태</span></td>
                    <td>서울</td>
                    <td>Y</td>
                    <td>액티비티</td>
                    <td> 2021-04-21 </td>
                    <td> 2021-04-21 </td>
                  </tr> --%>
                </tbody>
              </table>
            </div>
    	</div>
    </div>
    <div id="pagination">
	
	</div>
	 <%@ include file="/WEB-INF/views/common/modal.jsp" %> 
  </div>
 <script>
 $(document).ready(function() {
	 $('#search').on('keypress', function(e) {
	        if(e.which === 13) {
	            e.preventDefault();
	            getRankSetUp();
	        }
	  });
	 
	 //공통 모달의 css를 onload시 변경
	 $('#modalMsg').css({
	        'font-size': '20px',
	        'font-weight': 'bold',
	        'text-align': 'center'
	    });

	  $('.modal-content').css({
	        'width': 'fit-content',
	        'padding': '10px'
	  });
 
 });
 
 let setClubStartIndex = 1;
 let setClubEndIndex = 10;
 getRankSize();

 const itemsPerPage = 10; // 페이지 당 아이템 수
 let currentPage = 1; // 현재 페이지
 
 let rankListSize = 0;
 getRankingList(); //초기 랭킹리스트 조회
 
 function getRankSetUp(){
	 $("#pagination").val('');
	 getRankSize();
	 getRankingList();
 }
 
 function getRankingList() { 
	    var params = {}; // 
	    params.searchParams= $("#search").val();
	    params.startIndex = setClubStartIndex;
	    params.endIndex= setClubEndIndex;
	    
	    console.log(params);
		$.ajax({
			type: 'POST',
			/* headers: {
		     'Authorization': 'Bearer ' + accessToken // accessToken 사용
			}, */
			//url: '/adminTest/admin/rank', 
			url: 'https://www.h-club.site/admin/rank', 
		    data: JSON.stringify(params),
			contentType: 'application/json',
			success: function(response) {
	            var list = response.data;
	            $('#dataTbody').empty();
	            for(var i = 0 ; i < list.length; i++){
	            	appendDataToTable(list[i]);
	            }
	        },
	        error: function(xhr, status, error) {
	         	setModalMsg("회원목록 관리 가져오기 실패");
		        getModalMesage(); 
	        }
	    });
 }
 function getRankSize(){
	 var params = {}; // 
	    params.searchParams= $("#search").val();
	    
		$.ajax({
			type: 'POST',
			/* headers: {
		     'Authorization': 'Bearer ' + accessToken // accessToken 사용
			}, */
			//url: '/adminTest/admin/rankCnt', 
			url: 'https://www.h-club.site/admin/rankCnt', 
		    data: JSON.stringify(params),
			contentType: 'application/json', 
			success: function(response) {
			
				rankListSize = response.data;
	            setupPagination();
	           
	        },
	        error: function(xhr, status, error) {
	            console.error('랭크 수 가져오기 실패:', error);
	        }
	    });
	 
 }
 function appendDataToTable(data) {
    var tbody = $('#dataTbody'); 
	 
    var tr = $('<tr>'); 

   /*  tr.append('<td><label class="users-table__checkbox"><input type="checkbox" class="check"></label></td>'); // 체크박스 열 추가 */
    tr.append('<td>'+data.employeeNo+'</td>'); // 사원번호
    tr.append('<td><div class="categories-table-img"><img src="'+data.memberImage+'" alt="category"></div></td>');
    tr.append('<td>'+data.memberId+'</td>'); // 아이디
    tr.append('<td>'+data.employeeName+'</td>'); // 이름
    tr.append('<td>'+data.memberRating+'</td>'); // 카테고리
    tr.append('<td>'+data.matchNum+'</td>'); // 회원가입일 
	   
    tbody.append(tr); 
}
 
function setupPagination() {
    const totalPages = Math.ceil(rankListSize / itemsPerPage);
    const paginationElement = document.getElementById('pagination');
    paginationElement.innerHTML = '';

    for (let i = 1; i <= totalPages; i++) {
        const link = document.createElement('a');
        link.href = '#';
        link.textContent = i;

        link.addEventListener('click', function(event) {
           event.preventDefault();
           currentPage = i;
	            
           //페이징 범위 계산
           setClubStartIndex = (i-1) * itemsPerPage +1;
           setClubEndIndex =  (i)* itemsPerPage;
	                 
           //랭크 리스트 재로딩
           getRankingList()
           highlightCurrentPage();
        });

        paginationElement.appendChild(link);
    }
    highlightCurrentPage();
}

function highlightCurrentPage() {
    const paginationElement = document.getElementById('pagination');
    const links = paginationElement.getElementsByTagName('a');

    for (let i = 0; i < links.length; i++) {
        links[i].classList.remove('active');
    }
    links[currentPage - 1].classList.add('active');
}


 </script>
</body>
</html>