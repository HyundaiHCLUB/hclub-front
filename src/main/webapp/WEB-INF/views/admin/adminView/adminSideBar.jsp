<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 페이지 로드 시 초기 실행
    checkAccessAdminTokenInfo();

    // sessionStorage 변경 감지를 위한 이벤트 리스너 등록
    window.addEventListener("storage", function(event) {
   // 변경된 키가 "accessTokenInfo"인 경우
        if (event.key === "accessTokenInfo") {
            // 변경된 값을 기반으로 다시 실행
            checkAccessAdminTokenInfo();
        } 
    });
});
let accessAdminTokenInfo = sessionStorage.getItem("accessAdminTokenInfo");
// sessionStorage에서 값 가져와서 처리하는 함수
function checkAccessAdminTokenInfo() {
    if (accessAdminTokenInfo !== null && accessAdminTokenInfo !== "") {
        $("#sidebarLocation").show();
    } else {
        $("#sidebarLocation").hide();
    }   
}
function signedOut(){
	sessionStorage.setItem("accessAdminTokenInfo", "");
	accessAdminTokenInfo = sessionStorage.getItem("accessAdminTokenInfo");
	location.href='/dashboard/adminLoginPage';
	checkAccessAdminTokenInfo();
}
</script>
<style>
	#headerLogo{
	  width: 50px;
	}
	#logo{
	  width: 100px;
	}
</style>
<aside class="sidebar" >
   <div class="sidebar-start">
       <div class="sidebar-head">
           <a href="/dashboard/clubAdminPage" class="logo-wrapper" title="Home">
               <span class="sr-only">Home</span>
              <!--  <span class="icon logo" aria-hidden="true"></span> -->
                <span><img id="headerLogo" src="/resources/image/oriCharacter.png"></span>
               <div class="logo-text">
                   <span class="logo-title"><img id="logo" src="/resources/image/hlogo.png"></span>
                   <span class="logo-subtitle">&nbsp;&nbsp;관리자페이지</span>
               </div>
            </a>
	        <button class="sidebar-toggle transparent-btn" title="Menu" type="button">
               <span class="sr-only">Toggle menu</span>
               <span class="icon menu-toggle" aria-hidden="true"></span>
           </button>
        </div>
        <!-- LNB 영역 -->
        <div class="sidebar-body" id="sidebarLocation" >
			<ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="/dashboard/clubAdminPage"><span class="icon home" aria-hidden="true"></span>동아리 관리</a>
                </li>
            </ul>
            <ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="/dashboard/rankAdminPage"><span class="icon user-3" aria-hidden="true"></span>회원목록 관리</a>
                </li>
            </ul>
             <!-- 로그아웃 버튼 영역 -->
	        <div style="margin: 100px 0px 0px 0px;cursor:pointer;"><input type="button" value="로그아웃" style="font-weight:500; cursor:pointer; color:#46675c;" onclick="signedOut()">
	  		</div>      
        </div>
    </div>
  
</aside>
