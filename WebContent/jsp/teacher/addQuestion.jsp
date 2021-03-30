<%@page import="java.sql.*"%>
<%@page import="SQL.MySQLLink"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加试题</title>
        <link href="top.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            .b {margin:40px auto 0px; padding: 0px 0px 0px 0px;text-align: center; width: 100%;border-collapse:collapse;}
            .c{ margin: 0 auto;width: 30%;text-align: left;}
            .text{margin-left: 60px; padding-bottom: 15px;}
            .title{ font-size: 20px;padding: 20px 0;}
            .textarea{ width: 98%; height: 100px;;}
            .inputtext{height: 25px;width: 250px;}
            .inputsub{font-size: 30px; margin-right: 1px; margin-bottom: 230px;}
            .inputsubdiv{text-align: right;}
	    .select{height: 27px; margin-left: 20px;}
	    p{text-indent: 2em;}
        </style>
	<script type="text/javascript">
	    function sub2() {
		var question = document.getElementById("body").value;
		if (question == "") {
		    alert("题目题干不能为空！");
		    return false;
		}
		return true;
	    }
	</script>
    </head>
    <body>
	<%
	    String mass = (String) session.getAttribute("mass");
	    if (mass != null && !"".equals(mass)) {
		out.print("<script type='text/javascript'>"
			+ "alert('" + mass + "');"
			+ "</script>");
		session.setAttribute("mass", null);
	    }
	%>
        <ul id="nav"> 
            <li><a href="teacherMain.jsp">首页</a></li> 
            <li><a href="questions.jsp">试题库</a></li> 
            <li><a href="addQuestion.jsp">添加试题</a></li> 
            <li><a href="CreateTestPaper.jsp">生成试卷</a></li> 
            <li><a href="/WebQuestions/exit">退出系统</a></li>
        </ul> 
        <div class="b">
            <div class="c">
                <form action="/WebQuestions/addQuestionServlet" method="post" onsubmit="return sub2()">
                    <div>
                        <p>提示：带有*的项目是必填项！有四种类型的题目，分别是选择，判断，填空，综合。</p>
			<p>选择题在题干完后加上“##”分隔答案，然后就可以写答案选项了，
			    选项最少三个，最多四个，每个选项之间用“#”分隔，最后不要写标点符号或其它的字符，否则会被认为是选项的一部分；</p>
			<p>例如：1+1等于几？##2#3#10#69（此处不要写标点符号或其它的字符）</p>
			<p>填空题则是在填空处同样用“##”代替即可；</p>
			<p>例如：##的人流。</p>
			<p>其它题目无特别限制。</p>
                    </div>
		    <div class="title">题目类型*
			<select class="select" name="q_type">
			    <option value="1">选择</option>
			    <option value="2">判断</option>
			    <option value="3">填空</option>
			    <option value="4">综合</option>
			</select>
		    </div>
                    <div class="title">题目名称</div>
                    <div class="text"><input class="inputtext" type="text" name="q_name"/></div>
                    <div class="title">题目题干*</div>
                    <div class="text"><textarea class="textarea" name="q_body" rows="5" id="body"></textarea></div>
                    <div class="inputsubdiv">
			<input class="inputsub" type="submit" name="sub"/>
		    </div>
                </form>
            </div>
        </div>
    </body>
</html>
