<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDTO dto = (MemberDTO)session.getAttribute("login");

	String userid = (String)request.getAttribute("userid");
 	String username = (String)request.getAttribute("username");
  	String pNum = (String)request.getAttribute("pNum");
	String addr = (String)request.getAttribute("addr");
	String pCategory = (String)request.getAttribute("pCategory");
	String pTitle = (String)request.getAttribute("pTitle");
	String pContent = (String)request.getAttribute("pContent");
	String pPrice = (String)request.getAttribute("pPrice");
	String pImage = (String)request.getAttribute("pImage");
	String pHit = (String)request.getAttribute("pHit");
	String pDate = (String)request.getAttribute("pDate");
	String pStatus = (String)request.getAttribute("pStatus");
	String userImage = (String)request.getAttribute("userImage");
	String nickName = (String)request.getAttribute("nickName");
	boolean favorite = (boolean)request.getAttribute("favorite");
	boolean status = (pStatus.charAt(0)=='1'?true:false);
	// 가격에 1000단위에 쉼표를 붙여 줍니다.
    DecimalFormat formatter = new DecimalFormat("###,###");
    String price = formatter.format(Integer.parseInt(pPrice));
    String favoriteCount = (String)request.getAttribute("favoriteCount");
    
    String category = "";
    // 카테고리 설정	
	switch (pCategory) {
		case "D" :
		category = "디지털, 가전";
			break;
    	case "H" :
    		category = "가구, 인테리어";
    		break;
    	case "BY" :
    		category = "유아동";
    		break;
    	case "L" :
    		category = "생활, 가공식품";
    		break;
    	case "S" :
    		category = "스포츠, 레저";
    		break;
    	case "W" :
    		category = "여성의류, 여성잡화";
    		break;
    	case "M" :
    		category = "남성의류, 남성잡화";
    		break;
    	case "G" :
    		category = "게임, 취미";
    		break;
    	case "BT" :
    		category = "뷰티, 미용";
    		break;
    	case "PET" :
    		category = "반려동물용품";
    		break;
    	case "BK" :
    		category = "도서";
    		break;
    	case "T" :
    		category = "티켓";
    		break;
    	case "P" :
    		category = "식물";
    		break;
    	case "E" :
    		category = "기타";
    		break;
    	default :
    		category = "오류...";
    		break;
    } 
%>

<!-- Bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- Bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<style type="text/css">
.container{
	text-align : center;
}
#mainImgDiv{
	max-height: 700px;
	overflow: hidden;
}
#mainImage{
	max-height: initial;
	margin-top: -10%;
}
</style>

<script type="text/javascript">
	var favorite = <%=favorite%>;
	$(function() {
		
		<%if(dto!=null) {%> // 비 로그인 시 비활성화
		
			$("#favorite").on("click", function(){
				$.ajax({
					type: "get",
					url: "FavorateSwitchServlet",
					data: {
						pNum: <%=pNum%>,
						favorite : favorite
					}, //data
					dataType: "text",
					success: function(data, status, xhr) {
						if(data=="true"){
							$("#favoriteImg").attr("src","/Dong-Dong/images/util/favorite1.png");
							favorite = true;
						} else {
	
							$("#favoriteImg").attr("src","/Dong-Dong/images/util/favorite2.png");
							favorite = false;
						}//if_else
					}, //success
					error: function(xhr, status, error) {
						$("#result").append(error);
						$("#result").append(status);
					} //error
				});//ajax
			});//on
			
			function complaintPost() {
				var popupWidth = 300;
				var popupHeight = 500;
				var popupX = (window.screen.width/2)-(popupWidth/2);
				var popupY= (window.screen.height/2)-(popupHeight/2);
				url = "complaint/complaintDetail.jsp?pNum="+"<%=pNum%>"+"&coType=2";
				open(url,"complaintPost", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
			}//end compliantPost
			$("#complaintPost").click(function() {
				complaintPost();
			});

		<%}%>// 위쪽 영역 : 로그인시 사라짐, 아래쪽 영역 : 비 로그인 시에도 동작
		function userprofile() {
			var popupWidth = 300;
			var popupHeight = 500;
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			var popupY= (window.screen.height / 2) - (popupHeight / 2);
			url = "userprofile.jsp?nickName="+"<%=nickName%>"+"&userImage="+"<%=userImage%>"+"&userid="+"<%=userid%>";
			open(url,"userprofile", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		}//end userprofile
			
			$("#userprofile").click(function() {
			userprofile();
		});
	});//end ready
</script>

<!-- --------------------------------페이지 표시 시작 지점--------------------------------- -->  
<!-- Page Content -->
  <div class="container">

    <!-- Heading Row -->
    <div class="row align-items-center my-5">
      <div id="mainImgDiv" class="col-lg-7">
        <img id="mainImage" class="img-fluid rounded mb-4 mb-lg-0" src="/Dong-Dong/images/<%=pImage%>" width="700px" height="">
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5 font-weight-bold" style="text-align: left">
        <br>
        <h7 class="font-weight-light text-secondary">><%=category%></h7>
        <h2 class="font-weight-light"><%=pTitle%></h2><br>
        <%if(!status) {%>
        <h3 class="font-weight-light"><%=price%>원</h3><br>
        <%} else { %>
        <h3 class="font-weight-light">판매완료</h3><br>
        <%} %>
        <div class="text-secondary font-weight-bold" style="text-align : left;">

					<span style="margin-left: 2px"><img src="/Dong-Dong/images/util/heart.png" width="20"/></span>
					<span style="margin-left: 2px"><%=favoriteCount%></span>
					<span style="margin-left: 15px"><img src="/Dong-Dong/images/util/eye.png" width="20"/></span>
					<span style="margin-left: 2px"><%=pHit%></span>
					<span style="margin-left: 15px"><img src="/Dong-Dong/images/util/time.png" width="20"/></span>
					<span style="margin-left: 2px"><%=pDate.substring(0, pDate.length()-3)%></span>

	    </div>
        <hr>
		<table class="table">
		   <tr>
		      <th>유저</th>
		      <td><%=username%></td>
		   </tr>
		   <tr>
		      <th>거래지역</th>
		      <td><%=addr %></td>
		   </tr>
		 </tbody> 
		
		</table>
		
		<%if(status){%>
			<!-- 아무것도 안띄움 -->
		<%} else if(dto==null){%>
			<a class="btn btn-primary" href="LoginUIServlet">구매시 로그인이 필요합니다.</a><br>
		<% } else {%>
			<a class="btn btn-primary" onclick="window.open('chat/chat.jsp','window_name','width=400,height=400,location=no,status=no,scrollbars=yes,left='+((window.screen.width/2)-200)+',top='+((window.screen.height/2)-250))">채팅</a>
			<% if(userid.equals(dto.getUserid())){%>
				<a class="btn btn-primary" href="PostUpdateUIServlet?pNum=<%=pNum%>">상품 정보 수정</a>
		  		<a class="btn btn-primary" href="PostDeleteServlet?pNum=<%=pNum%>">상품 삭제</a>
			<%}
		}%>
		<%if(dto!=null && !userid.equals(dto.getUserid())){%>
			<button id="userprofile" class="btn btn-primary">프로필</button>
			<a class="btn btn-primary" onclick="window.open('orderSheet/orderSheet.jsp?sUserid=<%=userid %>&pNum=<%=pNum %>&pPrice=<%=pPrice %>','window_name','width=400,height=300,location=no,status=no,scrollbars=yes,left='+((window.screen.width/2)-200)+',top='+((window.screen.height/2)-250))">주문서작성</a>	
			<a id="complaintPost" class="btn btn-danger">신고</a>
			<a id="favorite"  class="btn">
			<%if(favorite==true) {%>
	    	    <img id="favoriteImg" src="/Dong-Dong/images/util/favorite1.png"  width="50" height="50"/>
	    	<% } else {%>
	    	    <img id="favoriteImg" src="/Dong-Dong/images/util/favorite2.png"  width="50" height="50"/>
	    	   <% } %>
			</a>
		<%} %>
	      
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
     <!-- Call to Action Well -->	
    <div class="card text-dark my-5 py-4" style="border: none; ">
      <div style="text-align : left; font-weight: bolder; margin-left: 20px"><h2>상세 설명</h2></div>
      <hr>
      <div class="card-body" style="text-align : left; min-height : 200px; margin-left: 20px">
        <h4><%=pContent%></h4>
      </div>
    </div>
  </div>
  <!-- /.container -->

    