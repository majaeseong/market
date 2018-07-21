<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>	<%--엑셀 파일 선언 --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    //출력 데이타 받기
	Object obj = request.getAttribute("list");
	obj= (obj == null) ? new ArrayList() : obj ;
	List<Map<String,String>> list=(List) obj;
	
	//파일명에 다운로드 날짜 붙여주기 위해 작성
	Date date=new Date();
	SimpleDateFormat dayformat=new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	String day=dayformat.format(date);
	String fileName="onejo_"+day;
	
	//필수 선언 부분
	//.getBytes("KSC5601"),"8859_1") 을 통한 한글파일명 깨짐 방지
	response.setHeader("Content-Disposition", "attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
	response.setHeader("Content-Description", "JSP Generated Date");
%>

<!doctype html>
<html lang="ko" style="overflow:hidden">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title></title>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="784" border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bordercolordark="#6C717D" cellspacing="0" cellpadding="0">
	<thead>
	   <tr align="center">
		<th scope="col" bgcolor="CDCDCD">Menu Name</th>
		<th scope="col" bgcolor="CDCDCD">Price</th>
		<th scope="col" bgcolor="CDCDCD">today's Sold</th>
		<th scope="col" bgcolor="CDCDCD">Sum</th>
	   </tr>
	</thead>
	<tbody>
	<% for(int i=0; i<list.size(); i++){ 	%>
		<tr>
			<td style="text-align:left;"><%= list.get(i).get("name")%> </td>
			<td style="text-align:left; mso-number-format:\#\,\#\#0\;" ><%= list.get(i).get("price")%> </td>
			<td style="text-align:left;"><%= list.get(i).get("todaysold")%> </td>
			<td style="text-align:left; mso-number-format:\#\,\#\#0\;"><%= list.get(i).get("money")%> </td>
		</tr>
	 <%}%>
	</tbody>
</table>

</body>

</html>