<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="SQL.MySQLLink"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>试题库</title>        
        <link href="top.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            .tablediv{margin:0px 0px 230px 0px; padding: 0px 0px 0px 0px;}
            .b { margin:0 auto; width:800px;border-collapse:collapse; margin-top: 80px;}
            th,td{ border-bottom-style:solid; height: 40px; width: 50px;}
        </style>
    </head>
    <body>
        <ul id="nav"> 
            <li><a href="teacherMain.jsp">首页</a></li> 
            <li><a href="questions.jsp">试题库</a></li> 
            <li><a href="addQuestion.jsp">添加试题</a></li> 
            <li><a href="CreateTestPaper.jsp">生成试卷</a></li> 
            <li><a href="/WebQuestions/exit">退出系统</a></li>
        </ul> 
        <div class="tablediv">
            <table class="b">
                <tr>
                    <th scope="col">试题编号</th>
                    <th scope="col">试题名称</th>
		    <th scope="col">试题类型</th>
		    <th scope="col">试题详情</th>		    
		    <th scope="col">创建老师</th>
                    <th scope="col">修改试题</th>
		    <th scope="col">创建时间</th>
                </tr>
                <%!
		    String qTable = "questions";
                %>
                <%
		    MySQLLink sqllink = MySQLLink.getMySQLLink();
		    String sql = "select * from " + qTable + ";";
		    Connection conn = sqllink.getConnection();
		    PreparedStatement ps = conn.prepareStatement(sql);
		    ResultSet rs = ps.executeQuery();

		    for (int i = 0; rs.next(); i++) {
			String questionId = rs.getString(1);
			String name = rs.getString(2);
			if (name == null || "".equals(name)) {
			    name = "该题无名";
			}
			String type = "";
			switch (rs.getInt(3)) {
			    case 1:
				type = "选择";
				break;
			    case 2:
				type = "判断";
				break;
			    case 3:
				type = "填空";
				break;
			    case 4:
				type = "综合";
				break;
			}
			out.print("<tr>");
			out.print("<td>" + questionId + "</td>");
			out.print("<td>" + name + "</td>");
			out.print("<td>" + type + "</td>");
			out.print("<td>" + rs.getString(4) + "</td>");
			out.print("<td>" + rs.getString(5) + "</td>");
			out.print("<td><a href='upDataQuestion.jsp?id="+questionId+"'>修改</a></td>");
			out.print("<td>" + new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(rs.getTimestamp(6)) + "</td>");
			out.print("</tr>");
		    }
                %>
            </table>
        </div>
    </body>
</html>
