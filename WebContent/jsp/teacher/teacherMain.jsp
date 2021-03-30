<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>欢迎您!<%=request.getSession().getAttribute("username")%>老师</title>
        <link href="top.css" rel="stylesheet" type="text/css" />       
        <style type="text/css">
            .divone{ width:50%;text-align:left; padding-top:150px; margin:auto}
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

        <div>
            <div class="divone">
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎<%=session.getAttribute("username")%>老师使用本系统，
                    试题库可查看所有试题，并能查看某一道题的详情；添加试题则能往试题库中添加不同类型的试题；
                    生成试卷则能在不同类型的题库中抽取一定数量的题目到word文档中，
                    形成试卷。
                </p>
            </div>
        </div>
    </body>
</html>
