<%@page import="SQL.MySQLLink"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录</title>
<style type="text/css">
.maindiv {
	margin: auto;
	margin-top: 200px;
	text-align: center;
	width: 600px;
	height: 220px;
}

.yzmdiv {
	margin: 0 auto;
	width: 40%
}
</style>
</head>

<body background="./image/bgimage.jpg">

	<%
		if (request.getParameter("sub") != null) {

			String dluser = request.getParameter("user");//获取输入的帐号密码验证码
			String dlpass = request.getParameter("pass");
			String dlyzm = request.getParameter("dlyzm");
			dlyzm.toLowerCase();

			String yzm = (String) session.getAttribute("yzm");//获取后台生成的验证码
			/*out.print("输入yzm=" + dlyzm + "   yzm=" + yzm + "   结果=" + (dlyzm.equals(yzm)));
			System.out.println("输入yzm=" + dlyzm + "   yzm=" + yzm + "   结果=" + (dlyzm.equals(yzm)));*/

			if (dlyzm.equals(yzm)) {

				Connection conn = MySQLLink.getMySQLLink().getConnection();//获取数据库链接
				//System.out.println((MySQLLink.getMySQLLink()==null) +"   ");

				String sql = "select * from user where user = ?;";//查询数据库
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, dluser);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					if (dlpass.equals(rs.getString(2))) {

						String furl = "";//存放跳转链接
						if (rs.getInt(4) == 2) {//获取登录帐号的类型，0是管理员，1是老师，2是学生
							furl = "jsp/student/studentMain.jsp";
						} else if (rs.getInt(4) == 1) {
							furl = "jsp/teacher/teacherMain.jsp";
						} else {
							furl = "jsp/err.jsp";
							response.sendRedirect(furl);//立即跳转，不执行以下的代码
							return;
						}

						if (request.getParameter("rember") != null && !request.getParameter("rember").equals("")) {
							//添加coolike
							Cookie co = new Cookie("userData", dluser + "~" + dlpass);
							co.setMaxAge(60 * 2);
							response.addCookie(co);
						}

						session.setAttribute("user", dluser);//先把帐号和姓名属性放进session，再执行跳转
						session.setAttribute("username", rs.getString(3));
						response.sendRedirect(furl);
					} else {
						pageContext.setAttribute("usererr", "帐号或密码错误!");
					}
				} else {
					pageContext.setAttribute("usererr", "帐号或密码错误!");
				}
				rs.close();
				ps.close();
			} else {
				pageContext.setAttribute("yzmerr", "验证码错误!");
			}
		}
	%>

	<%
		String userData[] = { "", "" };
		Cookie arr[] = request.getCookies();
		if (arr != null) {
			for (Cookie elem : arr) {
				if (elem.getName().equals("userData")) {
					userData = elem.getValue().split("~");
				}
			}
		}
	%>
	<div class="maindiv">
		<h2>
			试题库管理系统登录<br />
		</h2>
		<form action="" method="post">
			<img src="./image/user.png" /> 用户名： <input type="text" name="user"
				value="<%=userData[0]%>" style="background-color: #FFFFCC" />
			<%
				if (request.getParameter("sub") != null && pageContext.getAttribute("usererr") != null) {
					out.print(pageContext.getAttribute("usererr"));
				}
			%><br /> <img src="./image/pass.png" />密&nbsp;&nbsp;&nbsp;码： <input
				type="password" name="pass" style="background-color: #FFFFCC"
				value="<%=userData[1]%>" /><br />
			<div class="yzmdiv">
				<table>
					<tr>
						<td><img src="./image/yzm.png" /></td>
						<td>验证码：</td>
						<td><input type="text" name="dlyzm"
							style="width: 60px; height: 18px;" /></td>
						<td><img src="./yzm"
							onclick="this.src = './yzm?' + Math.random()" id="yzm" /></td>
						<%
							if (request.getParameter("sub") != null && pageContext.getAttribute("yzmerr") != null) {
								out.print("<td>" + pageContext.getAttribute("yzmerr") + "</td>");
							}
						%>
					</tr>
				</table>
			</div>
			<input name="rember" type="checkbox" value="true" />记住密码 <br> <input
				type="submit" name="sub" value="登录"
				style="width: 80px; height: 40px; font-size: 20px;" />
		</form>
	</div>
</body>
</html>
