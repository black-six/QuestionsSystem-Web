<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.poi.xwpf.usermodel.*"%>
<%@page import="SQL.MySQLLink"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>下载试卷</title>
        <link href="top.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            .form { margin:80px auto 100px; width:50%;}
	    .butt{font-size: 20px; height: 30px; width: 30}
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
	<form class="form">
	    <input class="butt" type="submit" value="下载试卷" name="sub"/>
	</form>
        <%
	    request.setCharacterEncoding("utf-8");
	    if (!"".equals(request.getParameter("sub")) && request.getParameter("sub") != null) {
		int questionsNum[] = {15, 10, 5, 5};//各种类型题目的数量，0：选择；1：判断；2：填空；3：综合
									    //15    10	    5	    5	
		MySQLLink sqllink = MySQLLink.getMySQLLink();
		Connection conn = sqllink.getConnection();
		String sql = "select * from questions where type = ?;";
		ResultSet rsArr[] = new ResultSet[4];//各种类型题目的查询结果集数组
		PreparedStatement ps1 = conn.prepareStatement(sql);
		ps1.setInt(1, 1);
		rsArr[0] = ps1.executeQuery();

		PreparedStatement ps2 = conn.prepareStatement(sql);
		ps2.setInt(1, 2);
		rsArr[1] = ps2.executeQuery();

		PreparedStatement ps3 = conn.prepareStatement(sql);
		ps3.setInt(1, 3);
		rsArr[2] = ps3.executeQuery();

		PreparedStatement ps4 = conn.prepareStatement(sql);
		ps4.setInt(1, 4);
		rsArr[3] = ps4.executeQuery();

		boolean questionsFlag[] = new boolean[4];//判断如果题目数量不足则不生成试卷
		for (int i = 0; i < 4; i++) {
		    if (rsArr[i].next()) {
			rsArr[i].last();
			if (rsArr[i].getRow() >= questionsNum[i]) {
			    questionsNum[i] = rsArr[i].getRow();
			    questionsFlag[i] = true;
			    rsArr[i].beforeFirst();
			}
		    }
		}

		boolean flag = questionsFlag[0] && questionsFlag[1] && questionsFlag[2] && questionsFlag[3];
		if (!flag) {
		    //System.out.println("题目数量不足请先添加试题！");
		    out.print("<script type='text/javascript'>"
			    + "alert('题目数量不足请先添加试题！');"
			    + "</script>");
		    return;
		}

		ArrayList questionsList[] = new ArrayList[4];//将数据库题目放入list集合中
		for (int i = 0; i < 4; i++) {
		    questionsList[i] = new ArrayList();
		    while (rsArr[i].next()) {
			questionsList[i].add(rsArr[i].getString(4));
		    }
		    Collections.shuffle(questionsList[i]);//打乱题目
		}

		String date = new SimpleDateFormat("YYYY-MM-dd-HH_mm_ss").format(new java.util.Date());
		String fileName = (String) session.getAttribute("username") + date + ".docx";//用姓名加时间生成唯一文件名
		File file = new File(getServletContext().getRealPath("\\") + "\\temp\\" + fileName);//文件完整目录和名字
		//System.out.println("filepath="+file.getParent());
		
		File a = new File(file.getParent());//如果temp目录文件数多于10个就全部删除
		a.mkdirs();
		File arrFile[] = a.listFiles();//获取该目录下的所有文件的file对象
		if (arrFile.length > 10) {
		    for (File tempFile : arrFile) {
			tempFile.delete();
		    }
		}

		file.createNewFile();
		XWPFDocument document = new XWPFDocument();
		
		XWPFDocument doc = new XWPFDocument();//word文档对象
		Map<String, String> numMap = new HashMap();
		numMap.put("1", "一：选择题，共15道小题，每题2分，共30分，每题仅有一个正确答案。" + ((char) 13));
		numMap.put("2", "二：判断题，共10道小题，每题1分，共10分。" + ((char) 13));
		numMap.put("3", "三：填空题，共5道小题，每题2分，共10分。" + ((char) 13));
		numMap.put("4", "四：综合题，共5道小题，每题10分，共50分。" + ((char) 13));
		
		for (int i = 0; i < 4; i++) {//分四种类型题添加进word文档
		    XWPFParagraph para = doc.createParagraph();//word段落
		    XWPFRun title = para.createRun();//word相同属性的一段字
		    title.setText(numMap.get("" + (i + 1)));//根据映射表设置标题

		    switch (i) {
			case 0://选择题
			    for (int j = 1; j <= 15; j++) {
				XWPFRun run = para.createRun();
				XWPFRun run2 = para.createRun();
				String question = ((String) questionsList[i].get(j - 1)).split("##")[0];//题干部分
				String answer = ((String) questionsList[i].get(j - 1)).split("##")[1];//选项部分
				int answreLen = answer.split("#").length;
				run.setText(j + "：" + question + ((char) 13));//添加题干
				for (int k = 1; k < answreLen; k++) {//添加选项
				    run2.setText(((char) (64 + k)) + ":" + answer.split("#")[k - 1]);
				    run2.addTab();
				}
				run2.addBreak();//添加中断换行
				run2.addBreak();
			    }
			    break;
			case 1://判断题
			    for (int j = 0; j < 10; j++) {
				XWPFRun run = para.createRun();
				run.setText((j + 1) + "：" + (String) questionsList[i].get(j) + "（）" + ((char) 13));
			    }
			    break;
			case 2://填空题
			    for (int j = 0; j < 5; j++) {
				XWPFRun run = para.createRun();
				String question = ((String) questionsList[i].get(j)).replace("##", "______");//替换出下划线
				run.setText((j + 1) + "：" + question + ((char) 13));
			    }
			    break;
			case 3://综合题
			    for (int j = 0; j < 5; j++) {
				XWPFRun run = para.createRun();
				run.setText((j + 1) + "：" + (String) questionsList[i].get(j) + ((char) 13));
				run.addBreak();
				run.addBreak();
			    }
			    break;
		    }
		}
		
		OutputStream os = new FileOutputStream(file);//将word数据输出到文件中
		//把doc输出到输出流  
		doc.write(os);
		os.close();
		response.sendRedirect("/WebQuestions/temp/" + URLEncoder.encode(fileName, "utf-8"));//浏览器打开word的url
	    }
        %>
    </body>
</html>
