<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.PostDTO"%>
<%@page import="java.util.List"%>
<a href="PostWriteUIServlet">글쓰기</a>
<a href="">

 <%
 	List<PostDTO> list = (List<PostDTO>)request.getAttribute("postList");
	for(int i=1;i<=list.size();i++){
		PostDTO dto = list.get(i-1);
		String pTitle = dto.getpTitle();
		String pContent = dto.getpContent();
		int pPrice = dto.getpPrice();
		String pImage = dto.getpImage();
		String pDate = dto.getpDate();
		String addr = dto.getAddr();
		int pNum = dto.getpNum();

		%>

		
		<style type="text/css"> 
a { text-decoration:none } 
</style>

<a href="PostDetailServlet?pNum=<%=pNum %>">
<div style=" background-color: white; padding:30px; width: auto; height: auto; cursor: pointer;" onclick="postdetail">
<td><img src="/Dong-Dong/images/<%=pImage %>" align="top" width="100" height="100">
		<%=pTitle%>
		<tr>
		<br>
 	 	<td class="Dong"><b><%=addr%></b>
							&nbsp;</td>
							<br>	
		</tr>					
 	 	
 	 		<%=pDate%> <br>	
 	 	
 	 		
 	 			<br>
 	 			
          <%=pPrice%><br>
		</td>
　　　</td>
　　</tr>
</div>


　</table> 
 </body> 
</html>     



</tr>
</table>

 <hr>
  
 <td>
	
		
		
		</table>
<%
    }//end for
%>

