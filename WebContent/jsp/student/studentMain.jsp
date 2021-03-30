<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>欢迎您!<%=request.getSession().getAttribute("username")%>同学 </title>
        <link href="top.css" rel="stylesheet" type="text/css" />       
        <style type="text/css">
            .divone{ width:50%;text-align:left; padding-top:150px; margin:auto}
        </style>
    </head>
    <body>
        <ul id="nav"> 
            <li><a href="studentMain.jsp">首页</a></li> 
            <li><a href="CreateTestPaper.jsp">生成试卷</a></li>
            <li><a href="/WebQuestions/exit">退出系统</a></li> 
        </ul> 
        <div>
            <div class="divone">
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎<%=session.getAttribute("username")%>同学使用本系统，
                	点击生成试卷即可即时生成独属于你的个人试卷~~
                </p>
            </div>
        </div>
    </body>
</html>
