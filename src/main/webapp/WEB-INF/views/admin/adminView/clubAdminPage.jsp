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
<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.js"></script>
<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>

<style>
	#deleteButton
	{
	    margin: 10px 0px 10px 72%;
	    border: 1px solid #F15F5F;
	    width: fit-content;
    	padding: 7px 10px 7px 10px;
    	border-radius: 10px;
    	cursor: pointer;
    	color: white;
    	background-color: #F15F5F;
	}
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

</style>
<body>
<body>
  <div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
<div class="page-flex">
  <!-- ! Sidebar -->
  <%@ include file="../adminView/adminSideBar.jsp" %>
 <div class="main-wrapper">
   <!-- ! Main nav -->
   <nav class="main-nav--bg">
   <div class="container main-nav">
	   <div class="main-nav-start">
	  
	  <div class="search-wrapper" style="margin-left:50px; display:inline-block;">
	       <i data-feather="search" aria-hidden="true"></i>
	        <input type="text" placeholder="동아리 이름으로 검색하세요" required id="search">
	        
	    </div>
	    <div style="display:inline-block; cursor:pointer;"><input type="button" value="검색" style="font-weight:bold; cursor:pointer; color:dodgerblue;" onclick="getClubList()"></div>
	   </div>  
	</div>
   </nav>
   <div class="container">
   <!-- <div id="deleteButton" onclick="deleteClub()">삭제</div> -->
    <div class="row">
    	
    	<div class="col-lg-9" style="margin: 0px 0px 0px 50px">  
          <div class="users-table table-wrapper">
              <table class="posts-table">
                <thead>
                  <tr class="users-table-info">
                  <!-- 	<th>
                      <label class="users-table__checkbox ms-20">
                        <input type="checkbox" class="check-all">
                      </label>
                    </th> -->
                    <th>번호</th>
                    <th>동아리 이름</th>
                    <th>동아리 사진</th>
                    <th>동아리 소개</th>
                    <th>활동 지역</th>
                    <th>활성 여부</th>
                    <th>카테고리</th>
                    <th>등록 날짜</th>
                    <th>수정 날짜</th>
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
  </div>
 <script>
 $(document).ready(function() {
 
	 $('#search').on('keypress', function(e) {
	        if(e.which === 13) {
	            e.preventDefault();
	            getClubList();
	        }
	    });
	 /* window.pagObj = $('#pagination').twbsPagination({
	        totalPages: [[20]], // 전체 페이지
	        startPage: parseInt([[0]] + 1), // 시작(현재) 페이지
	        visiblePages: 10, // 최대로 보여줄 페이지
	        prev: "‹", // Previous Button Label
	        next: "›", // Next Button Label
	        first: '«', // First Button Label
	        last: '»', // Last Button Label
	        onPageClick: function (event, page) { // Page Click event
	            console.info("current page : " + page);
	        }
	    }).on('page', function (event, page) {
	        searchDataList(page);
	    }); */
 });
 let setClubStartIndex = 1;
 let setClubEndIndex = 10;
 getClubSize();
 getClubList(); //초기 화면 로딩
 const itemsPerPage = 10; // 페이지 당 아이템 수
 let currentPage = 1; // 현재 페이지
 
 let clubListSize = 0;

 function getClubList() { 
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
			//url: '/hyndai/admin/club', 
			url: '/admin/club', 
		    data: JSON.stringify(params),
			contentType: 'application/json', 
			success: function(response) {
	            console.log('동아리 리스트 정보 가져오기 성공');
	            //그리드 재로딩
	            $('#dataTbody').empty();//재로딩을 위해 tbody안의 요소를 비운다음에 append
	         
	            var list = response.data;
	       
	            for(var i = 0 ; i < list.length; i++){
	            	appendDataToTable(list[i]);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('동아리 리스트 정보 가져오기 실패:', error);
	        }
	    });
}

 function getClubSize(){
	 var params = {}; // 
	    params.searchParams= $("#search").val();
	    
		$.ajax({
			type: 'POST',
			/* headers: {
		     'Authorization': 'Bearer ' + accessToken // accessToken 사용
			}, */
			//url: '/hyndai/admin/clubCnt', 
			url: '/admin/clubCnt', 
		    data: JSON.stringify(params),
			contentType: 'application/json', 
			success: function(response) {
	          
	            clubListSize = response.data;
	            setupPagination();
	           
	        },
	        error: function(xhr, status, error) {
	            console.error('동아리 리스트 정보 가져오기 실패:', error);
	        }
	    });
 }
 function appendDataToTable(data) {
	    var tbody = $('#dataTbody');
	   
	    var tr = $('<tr>'); 
	   /*  tr.append('<td><label class="users-table__checkbox"><input type="checkbox" class="check" name="check" value="'+data.clubNo+'"></label></td>'); // 체크박스 열 추가 */
	    tr.append('<td>'+data.clubNo+'</td>'); // 동아리 ID 
	    tr.append('<td>'+data.clubName+'</td>'); // 동아리명 
	    tr.append('<td><div class="categories-table-img"><img src="'+data.clubImage+'" alt="category"></div></td>'); // 동아리 이미지
	    tr.append('<td>'+data.clubInfo+'</td>'); //동아리 정보
	    tr.append('<td>'+data.clubLoc+'</td>');  //동아리 위치
	    if(data.useYn == 'Y'){
	        tr.append('<td style="text-align:center"><span class="badge-active">'+data.useYn+'</span></td>'); // 동아리 활성화 여부
	    }else{
	        tr.append('<td><span class="badge-active" style="cursor:pointer; color:red; background-color:blanchedalmond;" onclick="updateUseYn('+data.clubNo+')">'+data.useYn+'</span></td>'); // 활성화 여부 
	    }
	    tr.append('<td>'+data.categoryName+'</td>'); // 카테고리 
	    tr.append('<td>'+data.createdAt+'</td>'); // 생성일 
	    tr.append('<td>'+data.modifiedAt+'</td>'); // 수정일 
	    
	    tbody.append(tr); 
}
 function updateUseYn(clubNo){
	 var result = window.confirm("해당 동아리를 승인 하시겠습니까??");

	if (result) {
		$.ajax({
			type: 'GET',
			/* headers: {
		     'Authorization': 'Bearer ' + accessToken // accessToken 사용
			}, */
		    url: '/admin/club/updateUseYn/'+clubNo, 
			contentType: 'application/json', 
			success: function(response) {
	         	console.log('동아리 승인 업데이트 성공: '+response);
	         	getClubList();//업데이트 후 데이터 재 로딩
	        },
	        error: function(xhr, status, error) {
	            console.error('동아리 승인 업데이트 실패: ', error);
	        }
	    });
	} 
 }


 function setupPagination() {
    const totalPages = Math.ceil(clubListSize / itemsPerPage);
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
            setClubStartIndex = i * itemsPerPage +1;
            setClubEndIndex =  (i+1)* itemsPerPage;
           
            console.log("setClubStartIndex: "+setClubStartIndex +", setClubEndIndex: "+setClubEndIndex);
            
            //클럽 리스트 재로딩
            getClubList();
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