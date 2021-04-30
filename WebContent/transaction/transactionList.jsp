<%@page import="com.dto.SaleDTO"%>
<%@page import="com.dto.PurchaseDTO"%>
<%@page import="com.dto.FavoriteDTO"%>
<%@page import="com.dto.PostDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../layout/toplayout.jsp" flush="true"></jsp:include>
<!--부트스트랩 css cdn  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<style>
.td_default {
	 text-align: center; 
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
	})//end ready
	
</script>

<table class="table table-hover" width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="10" class="td_default1">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>-구매내역-</b></font> &nbsp;
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>
	
	<tr>
	
		<!-- <td class="td_default" align="center"> -->
		<td class="td_default" align="center"><strong>상품이름</strong></td>
		<td class="td_default" align="center" colspan="1"><strong>상품번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="right"><strong>판매가</strong></td>
		<!-- <td></td> -->
	</tr>
	<tr>
		<td height="30">
	</tr>
	<form name="myForm" >	    
<%  
   //데이터 가져오기 //for문 작성 
	List<PostDTO> plist = (List<PostDTO>)request.getAttribute("purchaseList");
	if(plist != null){
		for(int i=0; i<plist.size(); i++){
			PostDTO dto = plist.get(i);
			String pTitle = dto.getpTitle();
			String pImage = dto.getpImage();
			int pNum = dto.getpNum();
			int pPrice = dto.getpPrice();

%>	    
	  		

		<tr>
			<!--  <td class="td_default"  width="80">  -->
			<td class="td_default"  width="80"><%= pTitle %></td>
			<td class="td_default" align="center" width="80"><%= pNum %></td>
			<td class="td_default" width="80">
			<td class="td_default" width="80">
			<a href="PostDetailServlet?pNum=<%= pNum%>"><%--여기 해당상품 이동될 페이지  --%>
			<img src="/Dong-Dong/images/<%= pImage %>" border="0" align="left"
				width="80" /></td>
			<%-- <td class="td_default" width="300" style='padding-left: 30px'><%= pTitle %> --%>
			
			<br><%--  <font size="2" color="#665b5f">[분류 :<%= pCategory %>] </font> --%></td>
			<td class="td_default" align="center" width="100"><%= pPrice %>
			</td>

		</tr>
<%
	}//end for
}//end if
%>
	

	</form>
	
</table> 

<hr>

<!--여기서부터 판매내역  -->
<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default1">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>-판매내역-</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		 <!-- <td class="td_default" align="center"> --> 
		<td class="td_default" align="center"><strong>상품이름</strong></td>
		<td class="td_default" align="center" colspan="1"><strong>상품번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="right"><strong>판매가</strong></td>
		<!-- <td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td> -->
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	

	<form name="myForm2" >	    
<%  
   //데이터 가져오기 //for문 작성 
	List<PostDTO> slist = (List<PostDTO>)request.getAttribute("saleList");
	if(slist != null){
		for(int i=0; i<slist.size(); i++){
			PostDTO dto = slist.get(i);
			String pTitle = dto.getpTitle();
			String pImage = dto.getpImage();
			int pNum = dto.getpNum();
			int pPrice = dto.getpPrice();

%>	    
	  		

		<tr>
			<!--  <td class="td_default"  width="80">  -->
			<td class="td_default"  width="80"><%= pTitle %></td>
			<td class="td_default" align="center" width="80"><%= pNum %></td>
			<td class="td_default" width="80">
			<td class="td_default" width="80">
			<a href="PostDetailServlet?pNum=<%= pNum%>"><%--여기 해당상품 이동될 페이지  --%>
			<img src="/Dong-Dong/images/<%= pImage %>" border="0" align="center"
				width="80" /></td>
			<%-- <td class="td_default" width="300" style='padding-left: 30px'><%= pTitle %> --%>
			
			<br><%--  <font size="2" color="#665b5f">[분류 :<%= pCategory %>] </font> --%></td>
			<td class="td_default" align="center" width="100"><%= pPrice %>
			</td>

		</tr>
<%
	}//end for
}//end if
%>


	</form>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td height="20">
	</tr>
</table> 

    