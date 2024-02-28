<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 페이지 로드 시 초기 실행
    //checkAccessAdminTokenInfo();

    // sessionStorage 변경 감지를 위한 이벤트 리스너 등록
    window.addEventListener("storage", function(event) {
      /*   // 변경된 키가 "accessTokenInfo"인 경우
        if (event.key === "accessTokenInfo") {
            // 변경된 값을 기반으로 다시 실행
            checkAccessAdminTokenInfo();
        } */
    });
});
let accessAdminTokenInfo = sessionStorage.getItem("accessTokenInfo");
// sessionStorage에서 값 가져와서 처리하는 함수
function checkAccessAdminTokenInfo() {
    if (accessAdminTokenInfo !== null && accessAdminTokenInfo !== "") {
        $("#sidebarLocation").show();
    } else {
        $("#sidebarLocation").hide();
    }
}
</script>
<aside class="sidebar">
   <div class="sidebar-start">
       <div class="sidebar-head">
           <a href="/" class="logo-wrapper" title="Home">
               <span class="sr-only">Home</span>
               <span class="icon logo" aria-hidden="true"></span>
               <div class="logo-text">
                   <span class="logo-title">관리자페이지</span>
                   <span class="logo-subtitle">admin</span>
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
                    <a class="active" href="/adminView/clubAdminPage"><span class="icon home" aria-hidden="true"></span>동아리 관리</a>
                </li>
            </ul>
            <ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="/adminView/rankAdminPage"><span class="icon user-3" aria-hidden="true"></span>회원목록 관리</a>
                </li>
            </ul>      
        </div>
    </div>
</aside>
